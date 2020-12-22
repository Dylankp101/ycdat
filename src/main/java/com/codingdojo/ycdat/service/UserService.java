package com.codingdojo.ycdat.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ycdat.models.Ratings;
import com.codingdojo.ycdat.models.Shows;
import com.codingdojo.ycdat.models.Users;
import com.codingdojo.ycdat.repository.RatingRepo;
import com.codingdojo.ycdat.repository.ShowRepo;
import com.codingdojo.ycdat.repository.UsersRepo;

@Service
public class UserService {
	@Autowired
    private UsersRepo userRepo;
	@Autowired
	private ShowRepo showRepo;
	@Autowired
	private RatingRepo ratingRepo;
 
    public UserService(UsersRepo userRepo) {
        this.userRepo = userRepo;
    }  
    public Shows delete(Long id) {
        showRepo.deleteById(id);
		return null;
    }
    public Users registerUser(Users user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    public Shows create(Shows show) {
        return showRepo.save(show);
    }
    public Ratings create(Ratings rating) {
        return showRepo.save(rating);
    }
    
        public Users findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
        public List<Shows> all() {
            return showRepo.findAll();
        }
        public List<Users> allU() {
            return userRepo.findAll();
        }
        public List<Ratings> allR() {
            return ratingRepo.findAll();
        }
        public Users findUserById(Long id) {
    	Optional<Users> u = userRepo.findById(id);
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
        public Ratings findRatingById(Long id) {
    	Optional<Ratings> c = ratingRepo.findById(id);
    	if(c.isPresent()) {
            return c.get();
    	} else {
    	    return null;
    	}
    }
        public Shows findShowById(Long id) {
    	Optional<Shows> u = showRepo.findById(id);
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    public boolean authenticateUser(String email, String password) {
        Users user = userRepo.findByEmail(email);
        if(user == null) {
            return false;
        } else {
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
}
