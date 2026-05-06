package com.restaurant.controller;

import com.restaurant.model.SpecialOffer;
import com.restaurant.service.SpecialOfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/offers")
public class SpecialOfferController {

    @Autowired
    private SpecialOfferService offerService;

    @GetMapping("/view")
    public String viewOffers(Model model) throws SQLException {
        List<SpecialOffer> offers = offerService.getActiveOffers();
        model.addAttribute("offers", offers);
        return "offers";
    }

    @GetMapping("/admin/list")
    public String listAllOffers(Model model) throws SQLException {
        List<SpecialOffer> offers = offerService.getAllOffers();
        model.addAttribute("offers", offers);
        return "admin/offers/list";
    }

    @GetMapping("/admin/add")
    public String showAddForm(Model model) {
        model.addAttribute("offer", new SpecialOffer());
        return "admin/offers/add";
    }

    @PostMapping("/admin/add")
    public String addOffer(@RequestParam String title,
                           @RequestParam String description,
                           @RequestParam double discountPercentage,
                           @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate validFrom,
                           @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate validTo,
                           Model model) throws SQLException {

        if (validFrom.isAfter(validTo)) {
            model.addAttribute("error", "Valid From date must be before Valid To date");
            return "admin/offers/add";
        }

        boolean success = offerService.addOffer(title, description, discountPercentage, validFrom, validTo);

        if (success) {
            return "redirect:/offers/admin/list";
        } else {
            model.addAttribute("error", "Failed to add offer");
            return "admin/offers/add";
        }
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) throws SQLException {
        SpecialOffer offer = offerService.getOfferById(id);
        model.addAttribute("offer", offer);
        return "admin/offers/edit";
    }

    @PostMapping("/admin/edit/{id}")
    public String updateOffer(@PathVariable int id,
                              @RequestParam String title,
                              @RequestParam String description,
                              @RequestParam double discountPercentage,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate validFrom,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate validTo,
                              @RequestParam boolean isActive) throws SQLException {

        offerService.updateOffer(id, title, description, discountPercentage, validFrom, validTo, isActive);
        return "redirect:/offers/admin/list";
    }

    @GetMapping("/admin/delete/{id}")
    public String deleteOffer(@PathVariable int id) throws SQLException {
        offerService.deleteOffer(id);
        return "redirect:/offers/admin/list";
    }
}