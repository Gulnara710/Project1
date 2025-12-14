<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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