<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<section>
    <h1>ИСТОРИИ УЧЕНИКОВ</h1>
</section>

<div id="reviews">
    <div class="cards-conteiner">

        <c:choose>
            <c:when test="${not empty allReviews}">
                <c:forEach var="r" items="${allReviews}">
                    <div class="card">
                        <h5>${r.username}</h5>
                        <p>
                            <strong>Курс:</strong>
                            ${r.courseTitle}
                            <br><br>
                            ${r.text}
                        </p>

                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="card">
                    <h3>Пока нет отзывов</h3>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<c:if test="${not empty sessionScope.user}">
    <div style="text-align: center; margin: 40px 0;">
        <button onclick="openReviewModal()" class="button add-course-btn" style="font-size: 20px; padding: 16px 50px;">
            + Добавить отзыв
        </button>
    </div>
</c:if>

<div id="reviewModal" class="modal" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Оставить отзыв</h2>
            <span class="close" onclick="closeReviewModal()">×</span>
        </div>
        <div class="modal-body">
            <form action="${pageContext.request.contextPath}/reviews" method="post">
                <div class="form-group">
                    <label>Выберите курс</label>
                    <select name="courseId" required class="form-control">
                        <option value="">Выберите курс</option>
                        <c:forEach var="course" items="${boughtCourses}">
                            <option value="${course.id}">${course.title}</option>
                        </c:forEach>
                        <c:if test="${empty boughtCourses}">
                            <option disabled>Вы ещё ничего не купили</option>
                        </c:if>
                    </select>
                </div>
                <div class="form-group">
                    <label>Ваш отзыв</label>
                    <textarea name="text" placeholder="Поделитесь впечатлениями от курса..." required "></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="button">
                        Опубликовать отзыв
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/js/reviews.js"></script>
</body>
</html>