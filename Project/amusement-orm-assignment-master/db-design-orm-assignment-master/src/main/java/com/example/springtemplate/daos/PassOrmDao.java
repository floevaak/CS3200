package com.example.springtemplate.daos;

import com.example.springtemplate.models.Pass;
import com.example.springtemplate.models.User;
import com.example.springtemplate.repositories.PassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class PassOrmDao {
    @Autowired
    PassRepository passRepository;

    @PostMapping("orm/passes")
    public Pass createPass(@RequestBody Pass pass) {

        return passRepository.save(pass);
    }

/*
    @GetMapping("/orm/create/pass/{fn}/{ln}/{un}/{pw}")
    public Pass createPass(
            @PathVariable("pri") Integer price,
            @PathVariable("sd") String startDate,
            @PathVariable("ed") String endDate,
            @PathVariable("fpk") Boolean foodPack,
            @PathVariable("fp") Boolean fastPass) {
        Pass pass = new Pass(price, startDate, endDate, foodPack, fastPass, null, null);
        return passRepository.save(pass);
    }*/

    @GetMapping("/orm/passes")
    public List<Pass> findAllPasses() {
        return passRepository.findAllPasses();
    }

    @GetMapping("/orm/passes/{passId}")
    public Pass findPassById (
            @PathVariable("passId") Integer passId) {
        return passRepository.findPassById(passId);
    }

    @PutMapping("/orm/passes/{passId}/")
    public Pass updatePass(
            @PathVariable("passId") Integer id,
            @RequestBody Pass passUpdated) {
        Pass pass = passRepository.findPassById(id);
        pass.setDescription(passUpdated.getDescription());
        pass.setPrice(passUpdated.getPrice());
        pass.setStartDate(passUpdated.getStartDate());
        pass.setEndDate(passUpdated.getEndDate());
        pass.setFoodPack(passUpdated.getFoodPack());
        pass.setFastPass(passUpdated.getFastPass());

        return passRepository.save(pass);
    }

    @DeleteMapping("/orm/passes/{passId}")
    public void deletePass(
            @PathVariable("passId") Integer id) {
        passRepository.deleteById(id);
    }

}
