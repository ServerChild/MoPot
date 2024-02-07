<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}/resources/css/header.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-light"  >

    <a class="navbar-brand" href="<%= request.getContextPath() %>/">모여라!!!</a> <!-- 홈페이지 메인 링크 걸기 -->

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">팟구하기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list">자유게시판</a>
            </li>
        </ul>
    </div>

    <!-- if문 넣어서 로그인 전/후 아이콘 변경 -->
    <c:choose>
        <c:when test="${empty loginUser}">
            <!-- 사용자가 로그인하지 않은 경우 -->
            <ul class="userMul nav-item ">
                <li class="userMli nav-item">
<%--                    <form action="login" method="post">
                    <span class="material-symbols-outlined">
                        login
                    </span>
                    </form>--%>
                    <a href="loginPage">로그인</a>
                    <a href="joinPage">회원가입</a>
                </li>
            </ul>
        </c:when>
        <c:otherwise>
            <!-- 사용자가 로그인한 경우 -->
            <ul class="userMul nav-item ">
                <li class="userMli nav-item">
                <%--<span class="material-symbols-outlined" href="#">
                    person
                </span>
                    <span class="material-symbols-outlined" href="#">
                    logout
                </span>--%>
                <a href="logout">로그아웃</a>
                <a href="myPage">마이페이지</a>
                </li>
            </ul>
        </c:otherwise>
    </c:choose>
</nav>

</body>
</html>