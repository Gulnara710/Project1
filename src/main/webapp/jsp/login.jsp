<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Вход</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <main>
        <h1>Вход</h1>
        <section id="contacts">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <label for="username">Логин:</label><br>
                <input type="text" id="username" name="username" required><br>
                <label for="password">Пароль:</label><br>
                <input type="password" id="password" name="password" required ><br><br>
                <button type="submit" class="button">Войти</button>
            </form>
            <p><a href="${pageContext.request.contextPath}/register">Нет аккаунта? Регистрация</a></p>
            <% if ("invalid".equals(request.getParameter("error"))) { %>
                <p>Неверный логин или пароль!</p>
            <% } else if ("empty".equals(request.getParameter("error"))) { %>
                <p>Заполните все поля!</p>
            <% } %>
            <% if ("true".equals(request.getParameter("registered"))) { %>
                <p>Регистрация прошла успешно! Войдите</p>
            <% } %>
        </section>
    </main>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>