package ru.itis.dao;

import ru.itis.entity.ReviewEntity;
import ru.itis.util.ConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {


    public void saveReview(Long userId, Long courseId, String courseTitle, String text) throws SQLException {

        String sql = "INSERT INTO reviews (user_id, course_id, course_title, text) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            stmt.setLong(2, courseId);
            stmt.setString(3, courseTitle);
            stmt.setString(4, text);
            stmt.executeUpdate();
        }
    }

    public List<ReviewEntity> getReviewsByCourseId(Long courseId) throws SQLException {
        List<ReviewEntity> reviews = new ArrayList<>();
        String sql = """
                SELECT r.id, r.user_id, u.username, r.course_id, r.text
                FROM reviews r
                JOIN users u ON r.user_id = u.id
                WHERE r.course_id = ?
                ORDER BY r.id DESC
                """;

        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ReviewEntity review = new ReviewEntity();
                    review.setId(rs.getLong("id"));
                    review.setUserId(rs.getLong("user_id"));
                    review.setUsername(rs.getString("username"));
                    review.setCourseId(rs.getLong("course_id"));
                    review.setText(rs.getString("text"));
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

    public List<ReviewEntity> getAllReviews() throws SQLException {
        List<ReviewEntity> reviews = new ArrayList<>();
        String sql = "SELECT r.id, r.user_id, r.course_id, r.course_title, r.text, u.username " +
                "FROM reviews r JOIN users u ON r.user_id = u.id ORDER BY r.id DESC";

        try (Connection conn = ConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ReviewEntity review = new ReviewEntity();
                review.setId(rs.getLong("id"));
                review.setUserId(rs.getLong("user_id"));
                review.setUsername(rs.getString("username"));
                review.setCourseId(rs.getLong("course_id"));
                review.setCourseTitle(rs.getString("course_title"));
                review.setText(rs.getString("text"));
                reviews.add(review);
            }
        }
        return reviews;
    }

}