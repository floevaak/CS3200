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

    @PostMapping("/api/passes")
    public Pass createPass(@RequestBody Pass pass) {
        return passRepository.save(pass);
    }

    @GetMapping("/api/passes")
    public List<Pass> findAllPasses() {
        return passRepository.findAllPasses();
    }

    @GetMapping("/api/passes/{passId}")
    public Pass findPassById(
            @PathVariable("passId") Integer id) {
        return passRepository.findPassById(id);
    }

    @DeleteMapping("/api/passes/{passId}")
    public void deletePass(
            @PathVariable("passId") Integer id) {
        passRepository.deleteById(id);
    }

    @PutMapping("/api/passes/{passId}")
    public Pass updatePass(
            @PathVariable("passId") Integer id,
            @RequestBody Pass passUpdates) {
        Pass pass = passRepository.findPassById(id);
        pass.setPrice(passUpdates.getPrice());
        pass.setDescription(passUpdates.getDescription());
        pass.setStartDate(passUpdates.getStartDate());
        pass.setEndDate(passUpdates.getEndDate());
        pass.setFoodPack(passUpdates.getFoodPack());
        pass.setFastPass(passUpdates.getFastPass());
        pass.setUserId(passUpdates.getUserId());
        pass.setParkId(passUpdates.getParkId());
        return passRepository.save(pass);
    }
}
