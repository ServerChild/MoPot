<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${path}/resources/css/mainPage.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>MoPot</title>
</head>
<body>
    <!-- 헤더 부분 -->
    <jsp:include page="/WEB-INF/views/Common/header.jsp" />

    <!-- 메인 홈페이지 본문 -->
    <div class="container">
        <div class="wrapper">
            <div class="typing-demo">
                <a>MoPot(모여라 팟)</a>
            </div>
        </div>
    </div>

    <!-- 푸터 부분 -->
    <jsp:include page="/WEB-INF/views/Common/footer.jsp" />
</body>
</html>
