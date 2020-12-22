package com.codingdojo.ycdat.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ycdat.models.Ratings;
import com.codingdojo.ycdat.models.Shows;

@Repository
public interface ShowRepo extends CrudRepository<Shows, Long>{
	List<Shows> findAll();

	Ratings save(Ratings rating);
}
