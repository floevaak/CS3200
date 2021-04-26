package com.example.springtemplate.models;

import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name="passes")
public class Pass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="price")
    private Integer price;

    @Column(name="start_date")
    private String startDate;

    @Column(name="end_date")
    private String endDate;

    @Column(name="food_pack")
    private Boolean foodPack;

    @Column(name="fast_pass")
    private Boolean fastPass;

    @Column(name="user_id")
    private Integer userId;

    @Column(name="park_id")
    private Integer parkId;

    private Timestamp created;
    private Timestamp updated;

    // getters and setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public String getEndDate() { return endDate; }
    public void getEndDate(String endDate) { this.endDate = endDate; }
    public Boolean getFoodPack() { return foodPack; }
    public void setFoodPack(Boolean foodPack) { this.foodPack = foodPack; }
    public Boolean getFastPass() {return fastPass; }
    public void setFastPass(Boolean fastPass) {this.fastPass = fastPass; }
    public Integer getUserId() {return userId; }
    public void setUserId(Integer userId) {this.userId = userId; }
    public Integer getParkId() {return parkId; }
    public void setParkId(Integer parkId) {this.parkId = parkId; }

    public Timestamp getCreated() { return created; }
    public void setCreated(Timestamp created) { this.created = created; }
    public Timestamp getUpdated() { return updated; }
    public void setUpdated(Timestamp updated) { this.updated = updated; }

    // constructor
    public Pass(Integer price, String startDate, String endDate, Boolean foodPack,
                Boolean fastPass, Integer userId, Integer parkId) {
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
        this.foodPack = foodPack;
        this.fastPass = fastPass;
        this.userId = userId;
        this.parkId = parkId;
    }

    // default constructor
    public Pass() {
    }
}
