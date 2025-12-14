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
    <jsp:include page="/jsp/header.jsp"/>
    <h1>ЧИСТЫЙ ХОЛСТ</h1>
    <div id="index">


        <img src="https://avatars.mds.yandex.net/i?id=a965fff38f01dfd6cebd33b09f8d3d4d1340e1f3-16281999-images-thumbs&n=13">
        <p>🖌️ Живопись — теперь ближе, чем когда-либо!</p>
        <p>У нас вы найдёте: бесплатные вебинары, пошаговые курсы, библиотеку техник и поддержку сообщества.</p>
        <p>Мечтаете писать картины, но не хотите в вуз? Мы покажем, как начать - бесплатно и без сложностей. Переходите по ссылке</p>
        <a href="https://www.youtube.com/watch?v=bY2jYShjcBA&pp=ygUv0LzQsNGB0YLQtdGAINC60LvQsNGB0YEg0L_QviDRgNC40YHQvtCy0LDQvdC40Y4%3D">
            <button class="button">Ссылка на вебинар</button>
        </a>


        <div id="timer">
            <h3>До начала вебинара осталось:</h3>
            <span id="days">25</span> дней
            <span id="hours">19</span> часов
            <span id="minutes">39</span> минут
            <span id="seconds">29</span> секунд
        </div>

    </div>

    <div id="news">
        <h1>Наши новости</h1>
        <div id="news-container">

        </div>
        <button id="add-news" class="button">Добавить новость</button>

    </div>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>