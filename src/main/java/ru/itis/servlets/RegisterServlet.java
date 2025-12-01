package ru.itis.servlets;

import ru.itis.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || username.trim().isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("error", "Заполните все поля");
            req.setAttribute("username", username);
            doGet(req, resp);
            return;
        }

        if (!userService.registration(username, password)) {
            req.setAttribute("error", "Пользователь с таким именем уже существует");
            req.setAttribute("username", username);
            doGet(req, resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/login?registered=true");
    }
}