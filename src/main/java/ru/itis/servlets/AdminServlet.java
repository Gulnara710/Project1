package ru.itis.servlets;

import ru.itis.entity.UserEntity;
import ru.itis.service.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

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

        UserEntity user = (UserEntity) req.getSession().getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            req.setAttribute("courses", courseService.getAllCourses());
        } catch (Exception e) {
            req.setAttribute("error", "Не удалось загрузить курсы: " + e.getMessage());
        }

        req.getRequestDispatcher("/jsp/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserEntity user = (UserEntity) req.getSession().getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        try {
            switch (action) {
                case "add":
                    courseService.addCourse(
                            req.getParameter("title"),
                            req.getParameter("description"),
                            req.getParameter("details"),
                            req.getParameter("image"),
                            Double.parseDouble(req.getParameter("price"))
                    );
                    break;

                case "update":
                    courseService.updateCourse(
                            Long.parseLong(req.getParameter("id")),
                            req.getParameter("title"),
                            req.getParameter("description"),
                            req.getParameter("details"),
                            req.getParameter("image"),
                            Double.parseDouble(req.getParameter("price"))
                    );
                    break;

                case "delete":
                    courseService.deleteCourse(Long.parseLong(req.getParameter("id")));
                    break;
            }
        } catch (Exception e) {
            req.setAttribute("error", "Ошибка: " + e.getMessage());
        }

        doGet(req, resp);
    }
}