package com.example.springtemplate.daos;

import com.example.springtemplate.models.Park;
import com.example.springtemplate.repositories.ParkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class ParkOrmDao {
    @Autowired
    ParkRepository parkRepository;

    @GetMapping("/orm/create/park/{fn}/{ln}/{un}/{pw}")
    public Park createPark(
            @PathVariable("n") String name,
            @PathVariable("f") Integer foodNum,
            @PathVariable("s") Integer sizeSqm,
            @PathVariable("r") Integer revenue,
            @PathVariable("l") Boolean lights) {
        Park park = new Park(name, foodNum, sizeSqm, revenue, lights);
        return parkRepository.save(park);
    }

    @GetMapping("/orm/find/parks")
    public List<Park> findAllParks() {
        return parkRepository.findAllParks();
    }

    @GetMapping("/orm/find/park/{parkId}")
    public Park findParkById (
            @PathVariable("parkId") Integer parkId) {
        return parkRepository.findParkById(parkId);
    }

    @GetMapping("/orm/delete/park/{parkId}")
    public void deletePark(
            @PathVariable("parkId") Integer id) {
        parkRepository.deleteById(id);
    }

    @GetMapping("/orm/update/park/{parkId}/")
    public Park updatePark(
            @PathVariable("parkId") Integer id) {
        Park park = parkRepository.findParkById(id);
        return parkRepository.save(park);
    }
}
