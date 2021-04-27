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

    @PostMapping("/api/parks")
    public Park createPark(@RequestBody Park park) {
        return parkRepository.save(park);
    }

    @GetMapping("/api/parks")
    public List<Park> findAllParks() {
        return parkRepository.findAllParks();
    }

    @GetMapping("/api/parks/{parkId}")
    public Park findParkById(
            @PathVariable("parkId") Integer id) {
        return parkRepository.findParkById(id);
    }

    @DeleteMapping("/api/parks/{parkId}")
    public void deletePark(
            @PathVariable("parkId") Integer id) {
        parkRepository.deleteById(id);
    }

    @PutMapping("/api/parks/{parkId}")
    public Park updatePark(
            @PathVariable("parkId") Integer id,
            @RequestBody Park parkUpdates) {
        Park park = parkRepository.findParkById(id);
        park.setName(parkUpdates.getName());
        park.setFoodNum(parkUpdates.getFoodNum());
        park.setSizeSqm(parkUpdates.getSizeSqm());
        park.setRevenue(parkUpdates.getRevenue());
        park.setLights(parkUpdates.getLights());
        return parkRepository.save(park);
    }
}
