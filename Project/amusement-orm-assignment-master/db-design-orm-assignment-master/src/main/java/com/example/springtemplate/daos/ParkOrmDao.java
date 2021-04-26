package com.example.springtemplate.daos;

import com.example.springtemplate.models.Park;
import com.example.springtemplate.models.User;
import com.example.springtemplate.repositories.ParkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class ParkOrmDao {
    @Autowired
    ParkRepository parkRepository;

    @PostMapping("/orm/parks")
    public Park createPark(@RequestBody Park park) {
        return parkRepository.save(park);
    }

    /*
    @GetMapping("/orm/create/park/{fn}/{ln}/{un}/{pw}")
    public Park createPark(
            @PathVariable("n") String name,
            @PathVariable("f") Integer foodNum,
            @PathVariable("s") Integer sizeSqm,
            @PathVariable("r") Integer revenue,
            @PathVariable("l") Boolean lights) {
        Park park = new Park(name, foodNum, sizeSqm, revenue, lights);
        return parkRepository.save(park);
    }*/

    @GetMapping("/orm/parks")
    public List<Park> findAllParks() {
        return parkRepository.findAllParks();
    }

    @GetMapping("/orm/parks/{parkId}")
    public Park findParkById (
            @PathVariable("parkId") Integer parkId) {
        return parkRepository.findParkById(parkId);
    }

    @DeleteMapping("/orm/parks/{parkId}")
    public void deletePark(
            @PathVariable("parkId") Integer id) {
        parkRepository.deleteById(id);
    }

    @PutMapping("/orm/parks/{parkId}")
    public Park updatePark(
            @PathVariable("parkId") Integer id,@RequestBody Park parkUpdates) {
        Park park = parkRepository.findParkById(id);
        park.setFoodNum(parkUpdates.getFoodNum());
        park.setName(parkUpdates.getName());
        park.setSizeSqm(parkUpdates.getSizeSqm());
        park.setLights(parkUpdates.getLights());
        park.setRevenue(parkUpdates.getRevenue());
        return parkRepository.save(park);
    }
}
