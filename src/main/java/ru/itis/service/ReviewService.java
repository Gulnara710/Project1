package ru.itis.service;

import ru.itis.dao.CourseDao;
import ru.itis.dao.ReviewDao;
import ru.itis.entity.CourseEntity;
import ru.itis.entity.ReviewEntity;
import ru.itis.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ReviewService {
    private ReviewDao reviewDao;
    private CourseDao courseDao;

    public ReviewService() {
        this.reviewDao = reviewDao;
        this.courseDao = courseDao;
    }

    public CourseDao getCourseDao() throws SQLException {
        return courseDao = new CourseDao(ConnectionUtil.getConnection());
    }

    public ReviewDao getReviewDao() throws SQLException {
        return reviewDao = new ReviewDao(ConnectionUtil.getConnection());
    }

    public void addReview(Long userId, Long courseId, String text) throws SQLException {
        if (courseId == null || userId == null || text == null || text.trim().isEmpty()) {
            throw new IllegalArgumentException("Некорректный отзыв");
        }

        String courseTitle = "Неизвестный курс";
        CourseEntity course = courseDao.getCourseById(courseId);
        if (course != null) {
            courseTitle = course.getTitle();
        }


        reviewDao.saveReview(userId, courseId, courseTitle, text);
    }

    public List<ReviewEntity> getReviewsByCourseId(Long courseId) throws SQLException {
        return reviewDao.getReviewsByCourseId(courseId);
    }

    public List<ReviewEntity> getAllReviews() throws SQLException {
        return reviewDao.getAllReviews();
    }
}