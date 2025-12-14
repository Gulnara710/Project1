package ru.itis.servlets;

import ru.itis.entity.CourseEntity;
import ru.itis.entity.ReviewEntity;
import ru.itis.entity.UserEntity;
import ru.itis.service.CourseService;
import ru.itis.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/reviews")
public class ReviewsServlet extends HttpServlet {
    private ReviewService reviewService;
    private CourseService courseService;

    @Override
    public void init() throws ServletException {
        try {
            courseService = new CourseService();
            reviewService = new ReviewService();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
            return;
        }

        try {

            List<ReviewEntity> allReviews = reviewService.getAllReviews();
            req.setAttribute("allReviews", allReviews);

            List<CourseEntity> boughtCourses = courseService.getBoughtCourses(user.getId());
            req.setAttribute("boughtCourses", boughtCourses);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/jsp/reviews.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
            return;
        }

        String courseIdParam = req.getParameter("courseId");
        String text = req.getParameter("text");

        if (courseIdParam == null || courseIdParam.isEmpty() || text == null || text.trim().isEmpty()) {
            req.setAttribute("error", "Выберите курс)");
            doGet(req, res);
            return;
        }

        try {
            Long courseId = Long.parseLong(courseIdParam);
            reviewService.addReview(user.getId(), courseId, text.trim());

            res.sendRedirect(req.getContextPath() + "/reviews");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Ошибка при добавлении отзыва");
            doGet(req, res);
        }
    }
}