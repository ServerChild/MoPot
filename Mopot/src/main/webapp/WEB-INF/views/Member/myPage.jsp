<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${path}/resources/css/myPage.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>MyPage</title>
</head>
<body>
    <!-- 마이페이지 정보 -->
    <form action="myPageInfo" method="post" class="myPageForm" onsubmit="return valid();">
        <div class="mypage_info">
            <img id="img">
        </div>
        <div class="mypage_info">
            <label>닉네임</label>
            <input name="userNick" id="userNick" value="${ loginUser.userNick }">
            <input type="button" value="중복확인" onclick="nickCheck();" id="nickbtn">
            <div id="checkResult" style="font-size: 0.8em; display: none;"></div>
        </div>
        <div class="mypage_info">
            <label>아이디(ID)</label>
            <input name="userId" id="userId" value="${ loginUser.userId }" readonly>
        </div>
        <div class="mypage_info">
            <label>비밀번호</label>
            <input type="password" name="userPw" id="userPw">
        </div>
        <div class="mypage_info">
            <label>생년월일</label>
            <input name="userBithday" id="userBithday" value="${ loginUser.userBithday }">
        </div>
        <div class="mypage_info" id="user_gender">
            <label>성별</label>
            <input type="radio" name="userGender" value="1"> 남
			<input type="radio" name="userGender" value="2"> 여
        </div>
        <div class="mypage_btn">
            <input type="button" class="my_delete" onclick="mDelete()" value="탈퇴하기">
            <input type="submit" class="my_edit" value="수정하기">
        </div>
    </form>
    
    <!-- 닉네임 중복 체크 -->
    <script>
	    let submitCheck = false;
		
		function valid() {
			// 중복체크가 되면 true = 회원가입 버튼 동작
		    if(submitCheck) {
		        return true;
		    } else { // 중복체크 x = 회원가입 누르면 뜸(가입 버튼 동작 x)
		        alert('ID 중복 체크 확인해주세요.'); 
		        return false; 
		    }
		}
    
		function nickCheck() {
		    $.ajax({
		    	url: "nickCheck",
		    	data: { nick: $('#userNick').val() },
		    	success: function(data) {
		    		console.log(data);
		    		
		    		if(data) {
		    			alert("사용할 수 없는 닉네임 입니다.");
		    			
		    			submitCheck = false;
		    			
		    			$("#checkResult").show();
						$("#checkResult").css("color","red").text("중복된 닉네임이 존재합니다. 다시 입력해 주세요");   
						$("#enrollForm :submit").attr("disabled", true);
		    		} else {
		    			alert("사용 가능한 닉네임 입니다.");
		    			
		    			submitCheck = true;
		    			
		    			$("#checkResult").show();
						$("#checkResult").css("color","green").text("사용할 수 있는 닉네임 입니다");   
						$("#enrollForm :submit").attr("disabled", false);
		    		}
		    	},
		    	error: function() {
		    		console.log("닉네임 중복체크용 AJAX 통신 실패");
		    	}
		    })
				}
	</script>
</body>
</html>