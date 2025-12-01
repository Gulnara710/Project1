<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<section id="courses">
    <h1 id="education-title">Обучение у нас – это удобно и результативно</h1>
    <div class="cards-conteiner">
        <c:forEach var="course" items="${courses}">
            <div class="card" id="course-${course.id}">
                <img src="${pageContext.request.contextPath}${course.image}" width="200" height="200" alt="${course.title}">
                <h3>${course.title}</h3>
                <p><i>${course.description}</i></p>
                <p>${course.details}</p>
                <p><strong>Цена: ${course.price} ₽</strong></p>

                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/login'">Войдите, чтобы купить</button>
                    </c:when>


                    <c:otherwise>

                        <c:set var="courseInCart" value="false"/>
                        <c:forEach var="uc" items="${userCoursesInCart}">
                            <c:if test="${uc.id == course.id}">
                                <c:set var="courseInCart" value="true"/>
                            </c:if>
                        </c:forEach>


                        <c:set var="isBought" value="false"/>
                        <c:forEach var="up" items="${userBoughtCourses}">
                            <c:if test="${up.id == course.id}">
                                <c:set var="isBought" value="true"/>
                            </c:if>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${isBought}">
                                <button class="button" disabled>курс куплен</button>
                            </c:when>

                            <c:when test="${courseInCart}">
                                <button class="button" disabled>Уже в корзине</button>
                            </c:when>

                            <c:otherwise>
                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="courseId" value="${course.id}">
                                    <input type="hidden" name="action" value="add">
                                    <button class="button" type="submit">В корзину</button>
                                </form>
                            </c:otherwise>

                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>
</section>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>