package com.restaurant.config;

import com.restaurant.service.ReservationService;
import com.restaurant.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.util.List;

@Component
@EnableScheduling
public class ReservationScheduler {

    @Autowired
    private ReservationService reservationService;

    @Scheduled(cron = "0 0 1 * * ?")
    public void autoCompleteReservations() {
        System.out.println("========================================");
        System.out.println("Running scheduler to auto-complete reservations...");
        System.out.println("========================================");

        try {
            List<Reservation> pendingCompleted = reservationService.getPendingCompletedReservations();

            if (pendingCompleted.isEmpty()) {
                System.out.println("No reservations to auto-complete.");
                return;
            }

            int completedCount = 0;
            for (Reservation reservation : pendingCompleted) {
                boolean success = reservationService.completeReservation(reservation.getId());
                if (success) {
                    completedCount++;
                    System.out.println("✓ Auto-completed reservation #" + reservation.getId() +
                            " | Table " + reservation.getTableNumber() +
                            " | Added " + reservation.calculatePoints() + " points");
                }
            }

            System.out.println("========================================");
            System.out.println("Completed " + completedCount + " reservations and added loyalty points!");
            System.out.println("========================================");

        } catch (SQLException e) {
            System.err.println("Error auto-completing reservations: " + e.getMessage());
        }
    }
}