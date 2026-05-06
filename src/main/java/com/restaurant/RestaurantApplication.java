package com.restaurant;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling  // ✅ Make sure this is present
public class RestaurantApplication {
    public static void main(String[] args) {
        SpringApplication.run(RestaurantApplication.class, args);
        System.out.println("=========================================");
        System.out.println("Restaurant Reservation Platform Started!");
        System.out.println("Access at: http://localhost:8080/customer/login");
        System.out.println("=========================================");
    }
}