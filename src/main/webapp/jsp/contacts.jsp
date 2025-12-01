<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>ЧИСТЫЙ ХОЛСТ</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
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
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <li><a href="${pageContext.request.contextPath}/contacts">Контакты</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/myCourses">Мои курсы</a></li>
                    </c:otherwise>
                </c:choose>


                <c:if test="${sessionScope.user != null and sessionScope.user.role == 'admin'}">
                    <li><a href="${pageContext.request.contextPath}/admin">Админка</a></li>
                </c:if>

                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <li><a href="${pageContext.request.contextPath}/logout">Выйти</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/login">Войти</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>

            <a href="${pageContext.request.contextPath}/cart">
                <img src="${pageContext.request.contextPath}/images/cart.jpeg" height="100" alt="Корзина">
            </a>
        </nav>
    </header>

    <main>
        <h1 id="contacts-title">КОНТАКТЫ</h1>
        <section id="contacts">
            <p>Вы можете задать все вопросы или оплатить приглянувшийся курс, позвонив на этот номер <u>+79172877777</u></p>
            <p>Также вы можете перейти в наш канал <a href="https://t.me/+AFy-YGReZiI1NzYy">Telegram</a></p>

        </section>
    </main>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
