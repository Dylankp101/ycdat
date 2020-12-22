package com.codingdojo.ycdat.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.ycdat.models.Ratings;

public interface RatingRepo extends CrudRepository<Ratings, Long>{
	List<Ratings> findAll();
}
