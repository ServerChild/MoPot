<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="/src/main/webapp/resources/js/tag.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="/src/main/webapp/resources/js/comentBytes.js"></script>
    <title>모집 글 작성</title>
    <style>
        textarea {
            resize: none;
        }
    </style>
</head>
<body>
    <!-- 헤더 부분 -->
    <jsp:include page="/WEB-INF/views/Common/header.jsp" />

    <form action="potWrite" method="post">
        <!-- 제목 -->
        <label for="postTitle">제목</label><br>
        <input type="text" id="postTitle" name="postTitle" required>
        <br><br>

        <!-- 닉네임(지정값 불러오기) -->
        <label for="nickname">작성자 : ${ loginUser.username }</label>
        <br><br>

        <!-- 본문 -->
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-10">
                    <table class="table border">
                        <tr>
                            <label for="potContent">본문</label><br>
                            <sup>(<span id="nowByte">0</span>/100bytes)</sup>
                        </tr>
                        <tr>
                            <td>
                                <form id="frm_textArea" name="frm_textArea">
                                    <textarea rows="10" class="form-control" id="textArea_byteLimit" name="textArea_byteLimit" onkeyup="fn_checkByte(this)"></textarea>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>	<br><br>

        <!-- 모집 인원 -->
        <!-- 모집 인원을 본인이 적게 할 지 아니면 선택하게 할 지 정해야 함. 선택하게 할거면 최대인원은 몇명으로 할 지도 정해야함 -->
        <label for="recruitmentCount">모집 인원</label><br>
        <input type="number" id="headCount" name="headCount">

        </input>
        <br><br>

        <!-- 해시태그 -->
        <!-- 미완성 -->
        <div class="tr_hashTag_area">
            <p>해시태그 구현</p>
            <div class="form-group">
                <input type="hidden" value="" name="tag" id="rdTag" />
            </div>

            <ul id="tag-list"></ul>

            <div class="form-group">
                <input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;"/>
            </div>
        </div>
        <br>

        <br>

        <!-- 등록, 취소 버튼 -->
        <button type="submit">등록</button>
        <button type="button">취소</button>
    </form>

    <!-- 푸터 부분 -->
    <jsp:include page="/WEB-INF/views/Common/footer.jsp" />
</body>
</html>
