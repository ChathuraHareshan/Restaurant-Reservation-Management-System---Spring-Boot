package com.restaurant.dao;

import com.restaurant.model.SpecialOffer;
import com.restaurant.util.DatabaseConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SpecialOfferDAO {

    @Autowired
    private DatabaseConnection dbConnection;

    public boolean addOffer(SpecialOffer offer) throws SQLException {
        String sql = "INSERT INTO special_offers (title, description, discount_percentage, valid_from, valid_to, is_active) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, offer.getTitle());
            pstmt.setString(2, offer.getDescription());
            pstmt.setDouble(3, offer.getDiscountPercentage());
            pstmt.setDate(4, Date.valueOf(offer.getValidFrom()));
            pstmt.setDate(5, Date.valueOf(offer.getValidTo()));
            pstmt.setBoolean(6, offer.isActive());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    offer.setId(rs.getInt(1));
                }
                return true;
            }
            return false;
        } finally {
            dbConnection.closeConnection(conn, pstmt, null);
        }
    }

    public List<SpecialOffer> getActiveOffers() throws SQLException {
        List<SpecialOffer> offers = new ArrayList<>();
        String sql = "SELECT * FROM special_offers WHERE is_active = TRUE AND valid_to >= CURDATE() ORDER BY valid_from";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                offers.add(extractOffer(rs));
            }
        } finally {
            dbConnection.closeConnection(conn, pstmt, rs);
        }
        return offers;
    }

    public List<SpecialOffer> getAllOffers() throws SQLException {
        List<SpecialOffer> offers = new ArrayList<>();
        String sql = "SELECT * FROM special_offers ORDER BY valid_from DESC";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                offers.add(extractOffer(rs));
            }
        } finally {
            dbConnection.closeConnection(conn, pstmt, rs);
        }
        return offers;
    }

    public SpecialOffer getOfferById(int id) throws SQLException {
        String sql = "SELECT * FROM special_offers WHERE id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractOffer(rs);
            }
            return null;
        } finally {
            dbConnection.closeConnection(conn, pstmt, rs);
        }
    }

    public boolean updateOffer(int id, String title, String description, double discount,
                               LocalDate validFrom, LocalDate validTo, boolean isActive) throws SQLException {
        String sql = "UPDATE special_offers SET title=?, description=?, discount_percentage=?, valid_from=?, valid_to=?, is_active=? WHERE id=?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, description);
            pstmt.setDouble(3, discount);
            pstmt.setDate(4, Date.valueOf(validFrom));
            pstmt.setDate(5, Date.valueOf(validTo));
            pstmt.setBoolean(6, isActive);
            pstmt.setInt(7, id);

            return pstmt.executeUpdate() > 0;
        } finally {
            dbConnection.closeConnection(conn, pstmt, null);
        }
    }

    public boolean deleteOffer(int id) throws SQLException {
        String sql = "DELETE FROM special_offers WHERE id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = dbConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            return pstmt.executeUpdate() > 0;
        } finally {
            dbConnection.closeConnection(conn, pstmt, null);
        }
    }

    private SpecialOffer extractOffer(ResultSet rs) throws SQLException {
        SpecialOffer offer = new SpecialOffer();
        offer.setId(rs.getInt("id"));
        offer.setTitle(rs.getString("title"));
        offer.setDescription(rs.getString("description"));
        offer.setDiscountPercentage(rs.getDouble("discount_percentage"));

        Date validFrom = rs.getDate("valid_from");
        if (validFrom != null) {
            offer.setValidFrom(validFrom.toLocalDate());
        }

        Date validTo = rs.getDate("valid_to");
        if (validTo != null) {
            offer.setValidTo(validTo.toLocalDate());
        }

        offer.setActive(rs.getBoolean("is_active"));

        Timestamp createdAt = rs.getTimestamp("created_at");
        if (createdAt != null) {
        }

        return offer;
    }
}