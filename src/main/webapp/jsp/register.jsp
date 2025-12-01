<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
    <nav>
        <a href="${pageContext.request.contextPath}/">
         <img src="${pageContext.request.contextPath}/images/logo.png" height="100" alt="Логотип">
        </a>
        <ul id="navigation">
        <li><a href="${pageContext.request.contextPath}/">Главная</a></li>
        <li class="menu">
            <a href="${pageContext.request.contextPath}/courses">Курсы</a>
            <div class="menu-content">
             <c:forEach var="course" items="${courses}">
                 <a href="${pageContext.request.contextPath}/courses#course-${course.id}">
                    ${course.title}
                 </a>
             </c:forEach>
             <c:if test="${empty courses}">
                 <a href="#">Курсов пока нет</a>
             </c:if>
            </div>
        </li>
        <li><a href="${pageContext.request.contextPath}/reviews">Отзывы</a></li>
        <li><a href="${pageContext.request.contextPath}/contacts">Контакты</a></li>
        <li><a href="${pageContext.request.contextPath}/login">Войти</a></li>

        </ul>

        <a href="${pageContext.request.contextPath}/cart">
            <img src="${pageContext.request.contextPath}/images/cart.jpeg" height="100" alt="Корзина">
        </a>
    </nav>
</header>
<main>
    <h1>Регистрация</h1>
    <section id="contacts">

        <form method="post" action="${pageContext.request.contextPath}/register">
            <label for="username">Логин:</label><br>
            <input type="text" id="username" name="username" value="${username}" required >
            <br><br>

            <label for="password">Пароль:</label><br>
            <input type="password" id="password" name="password" required>
            <br><br>

            <button type="submit" class="button">Зарегистрироваться</button>
        </form>
        <p><a href="${pageContext.request.contextPath}/login">Уже есть аккаунт? Войти</a></p>

        <c:if test="${not empty error}">
            <div>
                ${error}
            </div>
        </c:if>



    </section>
</main>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>