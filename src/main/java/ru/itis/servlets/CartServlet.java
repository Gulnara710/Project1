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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final CourseService courseService = new CourseService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UserEntity user = (UserEntity) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                String courseIdStr = req.getParameter("courseId");
                if (courseIdStr != null && !courseIdStr.isEmpty()) {
                    Long courseId = Long.parseLong(courseIdStr);
                    courseService.addToCart(user.getId(), courseId);

                }
            }
            else if ("remove".equals(action)) {
                String courseIdStr = req.getParameter("courseId");
                if (courseIdStr != null) {
                    Long courseId = Long.parseLong(courseIdStr);
                    courseService.removeFromCart(user.getId(), courseId);
                }
            }
            else if ("pay".equals(action)) {
                courseService.payCart(user.getId());
                resp.sendRedirect(req.getContextPath() + "/myCourses");
                return;
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UserEntity user = (UserEntity) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            var cartCourses = courseService.getCartCourses(user.getId());
            double total = cartCourses.stream().mapToDouble(CourseEntity::getPrice).sum();

            req.setAttribute("userCourses", cartCourses);
            req.setAttribute("totalPrice", String.format("%.2f", total));
        } catch (SQLException e) {
            e.printStackTrace();
        }


        req.getRequestDispatcher("/jsp/cart.jsp").forward(req, resp);
    }
}