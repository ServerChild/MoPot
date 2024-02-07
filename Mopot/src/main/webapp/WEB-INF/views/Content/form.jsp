<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <link href="${path}/resources/css/form.css" rel="stylesheet" />
    <script src="/webjars/jquery/3.7.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
</head>
    <body>
    	<div id="writeForm">
        	<form action="insertForm" method="post" class="contentForm">
      		   <div class="writeFormHead">
                  <div class="writeFormHeadLeft">
                      <h4>말머리</h4>
                      <select class=conCategory name="conCategory">
                      	<option disabled selected>구함</option>
                      	  	  <optgroup label="공지">
                      		   	  <option value="공지사항">공지사항</option>
                      		  </optgroup>
                      	  	  <optgroup label="운동">
	                              <option value="야구">야구</option>
	                              <option value="농구">농구</option>
	                              <option value="축구">축구</option>
	                          </optgroup>
                              <optgroup label="스터디">
	                              <option value="코딩">코딩</option>
	                              <option value="영어회화">영어회화</option>
                          	  </optgroup>
                      </select>
                  </div>
                  <div class="writeFormHeadRight">
                      <h4>제목</h4>
                      <textarea class="conTitle" name="conTitle" placeholder="내용을 입력해 주세요"></textarea>
                  </div>
				</div>
				<div class="writeFormBody">
		            <br>
		            <hr>
            		<h4>내용</h4>
                	<textarea class="conDetail" name="conDetail" rows="10" cols="30" placeholder="글 내용 입력해주세요"></textarea>
              	</div>
               	<div class="writeFormTag">
                    <h4>태그</h4>
                    <textarea class="conTag" name="conTag" cols="30" placeholder="#응원구단"></textarea>
				</div>
				<!-- 임시 -->
				<div class="conWriter">
                    <h4>작성자</h4>
                    <input type="text" name="conWriter" placeholder="작성자" />
				</div>
				<!-- 임시 -->
				<br>
                <div class="writeFromFoot">
                    <button type="submit" class="write-btn">작성</button>
                    <button type="reset" class="reset-btn">초기화</button>
                    <button type="button" onclick="location.href='list' " class="list-btn">취소</button>
                </div>
               	<br>
       		</form>	
    	</div>
    </body>
</html>