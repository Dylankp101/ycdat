package com.codingdojo.ycdat.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 
	 @PostMapping("/registration")
	 public String registerUser(@Valid @ModelAttribute("user") Users user, BindingResult result, HttpSession session) {
	     userValidator.validate(user, result);
		 if (result.hasErrors()) {
	         return "registration.jsp";
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
	     Long userId = (Long) session.getAttribute("userId");
	     Users u = userService.findUserById(userId);
		 model.addAttribute("user", u);
		 return "homePage.jsp";
	 }
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";

	 }
	
	 // EVERYTHING ELSE BELOW HERE





}
