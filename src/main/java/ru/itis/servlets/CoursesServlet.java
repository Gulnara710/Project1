package ru.itis.servlets;

import ru.itis.entity.CourseEntity;
import ru.itis.entity.UserEntity;
import ru.itis.service.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {
    private CourseService courseService;

    @Override
    public void init() throws ServletException {
        try {
            courseService = new CourseService();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<CourseEntity> courses = courseService.getAllCourses();
            req.setAttribute("courses", courses);
            UserEntity user = (UserEntity)req.getSession().getAttribute("user");
            if (user != null) {
                List<CourseEntity> userCoursesInCart = courseService.getCartCourses(user.getId());
                req.setAttribute("userCoursesInCart", userCoursesInCart);
                List<CourseEntity> userBoughtCourses = courseService.getBoughtCourses(user.getId());
                req.setAttribute("userBoughtCourses", userBoughtCourses);
            }

            req.getRequestDispatcher("/jsp/courses.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Ошибка при загрузке курсов", e);
        }
    }
}