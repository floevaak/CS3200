package com.example.springtemplate.repositories;

import com.example.springtemplate.models.Pass;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PassRepository
        extends CrudRepository<Pass, Integer> {
    @Query(value = "SELECT * FROM pass", nativeQuery = true)
    public List<Pass> findAllPasses();
    @Query(value = "SELECT * FROM passes WHERE id=:passId", nativeQuery = true)
    public Pass findPassById(@Param("passId") Integer passId);

}

