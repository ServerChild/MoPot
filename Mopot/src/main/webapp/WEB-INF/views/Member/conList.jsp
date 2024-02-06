<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Mopot/src/main/webapp/resources/css/conList.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>List</title>
</head>
<body>
    <!-- 마이페이지(myPage) - 작성 / 신청한 글 -->
    <form action="/myPage/content" method="post" class="contentForm">
        <div class="con_list">
            <label>내가 작성한 글</label>
            <table class="conForm">
                <thead>
                    <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>댓글 수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="status_list">
            <label>내가 신청한 글</label>
            <table id="statusForm">
                <thead>
                    <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>신청 현황</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>