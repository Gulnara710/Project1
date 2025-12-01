package ru.itis.service;

import ru.itis.dao.CourseDao;
import ru.itis.entity.CourseEntity;
import java.sql.SQLException;
import java.util.List;

public class CourseService {
    private final CourseDao courseDao = new CourseDao();

    public List<CourseEntity> getAllCourses() throws SQLException {
        List<CourseEntity> courses = courseDao.getAllCourses();
        if (courses.isEmpty()) {
            courseDao.initCourses();
            courses = courseDao.getAllCourses();
        }
        return courses;
    }

    public void addToCart(Long userId, Long courseId) throws SQLException {
        if (userId == null || courseId == null) return;
        courseDao.addUserCourse(userId, courseId);
    }

    public List<CourseEntity> getCartCourses(Long userId) throws SQLException {
        return courseDao.getUserCourses(userId);
    }

    public void removeFromCart(Long userId, Long courseId) throws SQLException {
        courseDao.removeFromUserCart(userId, courseId);
    }

    public void payCart(Long userId) throws SQLException {
        courseDao.areCoursesPaid(userId);
    }

    public List<CourseEntity> getBoughtCourses(Long userId) throws SQLException {
        return courseDao.getUserBoughtCourses(userId);
    }

    public void addCourse(String title, String description, String details, String image, double price) throws SQLException {
        CourseEntity course = new CourseEntity(null, title, description, details, image, price);
        courseDao.saveNewCourse(course);
    }

    public void updateCourse(Long id, String title, String description, String details, String image, double price) throws SQLException {
        CourseEntity course = courseDao.getCourseById(id);
        if (course == null) throw new IllegalArgumentException("Курс не найден");

        course.setTitle(title);
        course.setDescription(description);
        course.setDetails(details);
        course.setImage(image);
        course.setPrice(price);
        courseDao.updateCourse(course);
    }

    public void deleteCourse(Long id) throws SQLException {
        courseDao.deleteCourse(id);
    }

}