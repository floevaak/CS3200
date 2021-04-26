package com.example.springtemplate.models;

import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name="parks")
public class Park {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="food_num")
    private Integer foodNum;

    @Column(name="size_sqm")
    private Integer sizeSqm;

    @Column(name="revenue")
    private Integer revenue;

    @Column(name="lights")
    private boolean lights;

    private Timestamp created;
    private Timestamp updated;

    // getters and setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Integer getFoodNum() { return foodNum; }
    public void setFoodNum(Integer foodNum) { this.foodNum = foodNum; }
    public Integer getSizeSqm() { return sizeSqm; }
    public void setSizeSqm(Integer sizeSqm) { this.sizeSqm = sizeSqm; }
    public Integer getRevenue() { return revenue; }
    public void setRevenue(Integer revenue) { this.revenue = revenue; }
    public boolean getLights() {return lights; }

    public void setLights(boolean lights) {
        this.lights = lights;
    }

    public Timestamp getCreated() { return created; }
    public void setCreated(Timestamp created) { this.created = created; }
    public Timestamp getUpdated() { return updated; }
    public void setUpdated(Timestamp updated) { this.updated = updated; }

    // constructor
    public Park(String name, Integer foodNum, Integer sizeSqm, Integer revenue, Boolean lights) {
        this.name = name;
        this.foodNum = foodNum;
        this.sizeSqm = sizeSqm;
        this.revenue = revenue;
        this.lights = lights;
    }

    // default constructor
    public Park() {
    }
}
