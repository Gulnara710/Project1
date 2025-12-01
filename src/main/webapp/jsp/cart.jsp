<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
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
    <section id="cart">
        <h1>🛒 Ваша корзина</h1>

        <c:choose>
            <c:when test="${empty userCourses}">
                <p style="text-align: center; color: #666;">
                    Корзина пуста. <a href="${pageContext.request.contextPath}/courses">Перейти к курсам</a>
                </p>
            </c:when>
            <c:otherwise>
                <div class="cards-conteiner">
                    <c:forEach var="course" items="${userCourses}">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}${course.image}"
                                 width="200" height="200" alt="${course.title}">
                            <h3>${course.title}</h3>
                            <p><i>${course.description}</i></p>
                            <p><strong>Цена: ${course.price} ₽</strong></p>

                            <form action="${pageContext.request.contextPath}/cart" method="post">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="courseId" value="${course.id}">
                                <button type="submit" сlass="button">Убрать</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <p><strong>Итого: ${totalPrice} ₽</strong></p>

                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="pay">
                        <button type="submit" class="button">
                            Оплатить ${totalPrice} ₽
                        </button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>