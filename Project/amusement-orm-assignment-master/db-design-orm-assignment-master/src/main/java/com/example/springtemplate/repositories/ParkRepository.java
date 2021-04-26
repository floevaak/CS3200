package com.example.springtemplate.repositories;

import com.example.springtemplate.models.Park;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ParkRepository
        extends CrudRepository<Park, Integer> {
    @Query(value = "SELECT * FROM parks", nativeQuery = true)
    public List<Park> findAllParks();
    @Query(value = "SELECT * FROM parks WHERE id=:parkId", nativeQuery = true)
    public Park findParkById(@Param("parkId") Integer parkId);

}

