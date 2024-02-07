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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<title>팟 구하기</title>
	<style>
		div {
			border: 1px solid;
			/* background-color: beige; */
			border-radius: 16px;
			/* box-shadow: inset 0 0 2px ; */
		}
		table {
			width: 100%;
			/* border: solid 1px; */
		}
		/* tr, td {
			border: solid;
		} */

		/* 추가된 스타일: 프로그레스 바 크기 조절 */
		progress {
    	width: 90%; /* 여기서 크기를 조절하세요 */
    }
	</style>
</head>
<body>
	<br>
	<!-- 헤더 코드 -->
	<jsp:include page="/WEB-INF/views/Common/header.jsp"></jsp:include>
	<br>
	<!-- 게시글 목록 구성

			 유저 닉네임
			 본문 내용, 모집 마감/진헹 정도(커서 올리면 모집 인원 확인 가능, progress 코드 사용), 신청 버튼
			 해시태그 -->
	<!-- for문 사용해서 반복 -->
	<div>
		<table>
			<tr>
				<td></td>
				<td>
					프로필 사진, 유저 닉네임
				</td>

			</tr>
			<tr>
				<td style="width: 2%;"></td>
				<td style="width: 75%;">본문</td>
				<!-- 모집 인원, 신청 인원에 따른 프로그레스바 상태 변경 스크립트 필요 -->
				<td style="width: 10%;">
					<progress value="20" max="100" id="progress1"></progress>
				</td>
				<td>
					<!-- 버튼에 온클릭 걸어서 스크립트 실행 -->
					<button type="button" class="btn btn-secondary" onclick="updateProgress(1, 70)">신청</button>
				</td>
				<td style="width: 2%;"></td>
			</tr>
			<tr>
				<td></td>
				<td>해시태그</td>
			</tr>
		</table>
	</div>

	<!-- 푸터 코드 -->

	<jsp:include page="/WEB-INF/views/Common/footer.jsp"></jsp:include>

	<script>
		function updateProgress(postId, newProgress) {
				// postId를 사용하여 해당 게시글의 프로그레스바를 업데이트
				const progressBar = document.getElementById(`progress${postId}`);
				progressBar.value = newProgress;
		}
</script>
</body>
</html>