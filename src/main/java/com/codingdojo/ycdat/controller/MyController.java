package com.codingdojo.ycdat.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.codingdojo.ycdat.models.Ratings;
import com.codingdojo.ycdat.models.Shows;
import com.codingdojo.ycdat.models.Users;
import com.codingdojo.ycdat.service.UserService;
import com.codingdojo.ycdat.validator.UserValidator;

@Controller
public class MyController {
	private final UserService userService;
    private final UserValidator userValidator;
    
    public MyController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    //LOGIN AND REGISTRATION METHODS
    
	 @RequestMapping("/registration")
	 public String registerForm(@ModelAttribute("user") Users user) {
	 		return "login.jsp";
	 }
	 @RequestMapping("/login")
	 public String login() {
	 		return "login.jsp";
	 }
 
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	 public String registerUser(@Valid @ModelAttribute("user") Users user, BindingResult result, HttpSession session) {
	     userValidator.validate(user, result);
		 if (result.hasErrors()) {
	         return "login.jsp";
	     } else {
			Users u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/home";
	     }		 
	 }
	 
	 @PostMapping("/login")
	 public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
	     boolean isAuthenticated = userService.authenticateUser(email, password);
	     if(isAuthenticated) {
	    	 Users u = userService.findByEmail(email);
	    	 session.setAttribute("userId", u.getId());
	    	 return "redirect:/home";
	     } else {
	    	 model.addAttribute("error", "Ivalid Credentials. Pleasse Try Again");
	    	 return "login.jsp";
	     }		 
	 }	 
	 @GetMapping("/home")
	 public String home(HttpSession session, Model model) {
		 List<Shows> show = userService.all();
		 model.addAttribute("shows", show);
	     Long userId = (Long) session.getAttribute("userId");
	     Users u = userService.findUserById(userId);
		 model.addAttribute("user", u);
		 return "homePage.jsp";
	 }
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/registration";
	 }
	 
	 
	 // EVERYTHING ELSE
	 
	 @RequestMapping("/creation")
	 public String createPage() {
		 return "creation.jsp";
	 }
	 
	 @PostMapping("/create/show")
	 public String createShow(@Valid @ModelAttribute("event") Shows show, BindingResult result, HttpSession session) {
		 if (result.hasErrors()) {
	         return "registration.jsp";
	     } else {
	    	 Long id = (Long)session.getAttribute("userId");
		     Users u = userService.findUserById(id);
		     show.setUser(u);
	    	 userService.create(show);
			return "redirect:/home";
	     }
	 }
		 
	    @PostMapping("/create/rating")
	    public String createR(@Valid @ModelAttribute("rating") Ratings rating, BindingResult result) {
	        if (result.hasErrors()) {
	            return "new.jsp";
	        } else {
	            userService.create(rating);
	            return "redirect:/home";
	        }
	    }
	    @PostMapping("update/{id}")
	    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("show") Shows show, BindingResult result) {
	        if (result.hasErrors()) {
	        	show.setId(id);
	            return "edit.jsp";
	        } else {
	        	show.setId(id);
	        	userService.create(show);
	            return "redirect:/home";
	        }
	    }
	    @RequestMapping("/delete/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	    	userService.delete(id);
	    	return "redirect:/home";
	    }
	    @RequestMapping("/view/{id}")
	    public String show(@PathVariable("id") Long id, Model model) {
	    	Shows show = userService.findShowById(id);
	        model.addAttribute("shows", show);
			List<Ratings> rating = userService.allR();
			model.addAttribute("ratings", rating);	  			
	        return "show.jsp";
	    }
		  @RequestMapping("/edit/{id}")
		    public String edit(@PathVariable("id") Long id, Model model) {
		        Shows show = userService.findShowById(id);
		        userService.create(show);
		        model.addAttribute("shows", show);
		        return "edit.jsp";
		    } 
		    @PostMapping("addrating/{id}")
		    public String addRating(@PathVariable("id") Long id, @Valid @ModelAttribute("show") Shows show, @ModelAttribute("show") Ratings rating, BindingResult result) {
		        if (result.hasErrors()) {
		        	show.setId(id);
		            return "edit.jsp";
		        } else {
		        	show.setId(id);
		        	userService.create(show);
		            return "redirect:/home";
		        }
		    } 
		  
		  
	}
