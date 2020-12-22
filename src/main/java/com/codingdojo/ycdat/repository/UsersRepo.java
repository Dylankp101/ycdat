package com.codingdojo.ycdat.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.ycdat.models.Users;

public interface UsersRepo extends CrudRepository<Users, Long>{
    Users findByEmail(String email);
    List<Users> findAll();
}
