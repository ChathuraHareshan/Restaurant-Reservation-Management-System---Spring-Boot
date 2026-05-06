package com.restaurant.service;

import com.restaurant.dao.SpecialOfferDAO;
import com.restaurant.model.SpecialOffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@Service
public class SpecialOfferService {

    @Autowired
    private SpecialOfferDAO offerDAO;

    public boolean addOffer(String title, String description, double discount,
                            LocalDate validFrom, LocalDate validTo) throws SQLException {
        SpecialOffer offer = new SpecialOffer();
        offer.setTitle(title);
        offer.setDescription(description);
        offer.setDiscountPercentage(discount);
        offer.setValidFrom(validFrom);
        offer.setValidTo(validTo);
        offer.setActive(true);

        return offerDAO.addOffer(offer);
    }

    public List<SpecialOffer> getActiveOffers() throws SQLException {
        return offerDAO.getActiveOffers();
    }

    public List<SpecialOffer> getAllOffers() throws SQLException {
        return offerDAO.getAllOffers();
    }

    public SpecialOffer getOfferById(int id) throws SQLException {
        return offerDAO.getOfferById(id);
    }

    public boolean updateOffer(int id, String title, String description, double discount,
                               LocalDate validFrom, LocalDate validTo, boolean isActive) throws SQLException {
        return offerDAO.updateOffer(id, title, description, discount, validFrom, validTo, isActive);
    }

    public boolean deleteOffer(int id) throws SQLException {
        return offerDAO.deleteOffer(id);
    }
}