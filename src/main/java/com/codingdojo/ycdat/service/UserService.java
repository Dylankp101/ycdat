package com.codingdojo.ycdat.service;

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codingdojo.ycdat.models.Users;
import com.codingdojo.ycdat.repository.UsersRepo;

@Service
public class UserService {
	@Autowired
    private UsersRepo userRepo;
	@Autowired

    
    public UserService(UsersRepo userRepo) {
        this.userRepo = userRepo;
    }


    
    // register user and hash their password
    public Users registerUser(Users user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    // find user by email
    public Users findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public Users findUserById(Long id) {
    	Optional<Users> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
   
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        Users user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
}
