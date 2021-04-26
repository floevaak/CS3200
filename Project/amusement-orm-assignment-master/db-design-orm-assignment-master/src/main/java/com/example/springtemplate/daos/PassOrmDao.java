package com.example.springtemplate.daos;

import com.example.springtemplate.models.Pass;
import com.example.springtemplate.repositories.PassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class PassOrmDao {
    @Autowired
    PassRepository passRepository;

    @GetMapping("/orm/create/pass/{fn}/{ln}/{un}/{pw}")
    public Pass createPass(
            @PathVariable("pri") Integer price,
            @PathVariable("sd") String startDate,
            @PathVariable("ed") String endDate,
            @PathVariable("fpk") Boolean foodPack,
            @PathVariable("fp") Boolean fastPass) {
        Pass pass = new Pass(price, startDate, endDate, foodPack, fastPass, null, null);
        return passRepository.save(pass);
    }

    @GetMapping("/orm/find/passes")
    @CrossOrigin(origins = "*")
    public List<Pass> findAllPasses() {
        return passRepository.findAllPasses();
    }

    @GetMapping("/orm/find/pass/{passId}")
    public Pass findPassById (
            @PathVariable("passId") Integer passId) {
        return passRepository.findPassById(passId);
    }

    @GetMapping("/orm/delete/pass/{passId}")
    public void deletePass(
            @PathVariable("passId") Integer id) {
        passRepository.deleteById(id);
    }

    @GetMapping("/orm/update/pass/{passId}/")
    public Pass updatePass(
            @PathVariable("passId") Integer id) {
        Pass pass = passRepository.findPassById(id);
        return passRepository.save(pass);
    }
}
