package ru.itis.servlets;

import ru.itis.dao.CourseDao;
import ru.itis.entity.CourseEntity;
import ru.itis.entity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/myCourses")
public class MyCoursesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CourseDao course = new CourseDao();
        HttpSession session = req.getSession();
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            List<CourseEntity> myCourses = course.getUserBoughtCourses(user.getId());
            req.setAttribute("myCourses", myCourses);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/jsp/myCourses.jsp").forward(req, res);
    }
}
