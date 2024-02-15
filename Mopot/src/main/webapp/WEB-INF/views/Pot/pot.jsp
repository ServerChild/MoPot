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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>팟 구하기</title>
    <style>
        .potContent_List {
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

        /* 프로그레스 바 크기 조절 */
        progress {
            width: 90%; /* 크기 조절 */
        }
    </style>
</head>
<body>

    <!-- 헤더 부분 -->
    <jsp:include page="/WEB-INF/views/Common/header.jsp" />

    <!-- 게시글 목록 구성
             유저 닉네임
             본문 내용, 모집 마감/진헹 정도(커서 올리면 모집 인원 확인 가능, progress 코드 사용), 신청 버튼
             해시태그 -->
    <!-- for문 사용해서 반복 -->
    <div class="potContent_List">
        <table>
            <tr>
                <td></td>
                <td>
                    프로필 사진, 유저 닉네임
                    <!-- 히든으로 해도 될 거 같음 아닌가.. 일단 글번호는 히든 -->
                    <!-- 작성일/수정일(수정일은 히든) -->
                </td>

            </tr>
            <tr>
                <td style="width: 2%;"></td>
                <td style="width: 75%;">본문</td>
                <!-- 모집 인원 관련 DB도 구성해야함 -->
                <!-- 모집 인원, 신청 인원에 따른 프로그레스바 상태 변경 스크립트 필요 -->
                <td style="width: 10%;">
                    <progress value="20" max="100" id="progress1"></progress>
                </td>
                <td>
                    <!-- 버튼에 온클릭 걸어서 스크립트 실행 -->
                    <button type="button" class="btn btn-secondary" onclick="updateProgress(1, 70)">신청</button>
                </td>
                <td style="width: 2%;">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-three-dots-vertical"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <!-- 수정 버튼 -->
                            <a class="dropdown-item" href="#" onclick="editPost(1)">수정</a>
                            <!-- 삭제 버튼 -->
                            <a class="dropdown-item" href="#" onclick="deletePost(1)">삭제</a>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>태그</td>
            </tr>
        </table>
    </div>

    <!-- 푸터 부분 -->
    <jsp:include page="/WEB-INF/views/Common/footer.jsp" />

    <script>
        function updateProgress(postId, newProgress) {
            // postId를 사용하여 해당 게시글의 프로그레스바를 업데이트
            const progressBar = document.getElementById(`progress${postId}`);
            progressBar.value = newProgress;
        }
    </script>
</body>
</html>
