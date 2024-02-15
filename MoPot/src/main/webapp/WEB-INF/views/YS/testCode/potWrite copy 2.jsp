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
	<title>모집 글 작성</title>
	<style>
		textarea {
			resize: none;
		}
	</style>
</head>
<body>
<!-- 헤더 인클루드 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<br><!-- br 말고 마진으로 간격 조정 해야함 -->

<form action="potWrite" method="post">
	<!-- 제목 -->
	<label for="postTitle">제목</label><br>
	<input type="text" id="postTitle" name="postTitle" required>
	<br><br>

	<!-- 닉네임(지정값 불러오기) -->
	<label for="nickname">작성자 : ${ loginUser.username }</label>
	<br><br>

	<!-- 본문 -->
	<label for="postContent">본문</label><br>
	<textarea id="postContent" name="postContent" rows="4" cols="50" required></textarea>
	<br><br>

	<!-- 모집 인원 -->
	<!-- 모집 인원을 본인이 적게 할 지 아니면 선택하게 할 지 정해야 함. 선택하게 할거면 최대인원은 몇명으로 할 지도 정해야함 -->
	<label for="recruitmentCount">모집 인원</label><br>
	<input type="number" id="headCount" name="headCount">

</input>
	<br><br>
 
	<!-- 해시태그 -->
	<form action="YourServlet" method="post">
    <label for="hashtags">해시태그 입력</label><br>
    <input type="text" name="hashtags" id="hashtags">
		<!--<input type="submit" value="확인">-->
	</form>
	<br>

	<br><br>

	<!-- 등록, 취소 버튼 -->
	<button type="submit">등록</button>
	<button type="button">취소</button>

	<!-- 푸터 인클루드 -->
	<br><!-- br 말고 마진으로 간격 조정 해야함 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</form>
</body>
</html>
