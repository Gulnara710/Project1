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
    <jsp:include page="/jsp/header.jsp" />

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
