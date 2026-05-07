package com.restaurant.model;

import java.time.LocalDate;

public class SpecialOffer {
    private int id;
    private String title;
    private String description;
    private double discountPercentage;
    private LocalDate validFrom;
    private LocalDate validTo;
    private boolean isActive;

    private String validFromStr;
    private String validToStr;

    public SpecialOffer() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getDiscountPercentage() { return discountPercentage; }
    public void setDiscountPercentage(double discountPercentage) { this.discountPercentage = discountPercentage; }

    public LocalDate getValidFrom() { return validFrom; }
    public void setValidFrom(LocalDate validFrom) { this.validFrom = validFrom; }

    public LocalDate getValidTo() { return validTo; }
    public void setValidTo(LocalDate validTo) { this.validTo = validTo; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }

    public String getValidFromStr() { return validFromStr; }
    public void setValidFromStr(String validFromStr) { this.validFromStr = validFromStr; }

    public String getValidToStr() { return validToStr; }
    public void setValidToStr(String validToStr) { this.validToStr = validToStr; }
}