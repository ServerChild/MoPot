<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!-- jstl 포맷 라이브러리 축 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <link href="${path}/resources/css/detailForm.css" rel="stylesheet" />
    <script src="/webjars/jquery/3.7.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>디테일 글 폼 보기 </title>
</head>
<body>
	<br><br><br><!-- 헤더 부분 공간  -->
	<!-- 페이지 전체 적용 -->
	<section class="content-detail">
    	<div class="content-detail-title"><!-- Title : 상 세 보 기-->
   			<div class="container">
	    		<h2>상세보기</h2>
	    	</div>
	    </div>
	    <div class="content-detail-prevnext"><!-- 이전글, 다음글 버튼 -->
   			<div class="container">
	    		<button type="button" onclick="moveToPrevPage(${content.conNo})" class="list-btn">이전글</button>&emsp;
	    		<button type="button" onclick="moveToNextPage(${content.conNo})" class="list-btn">다음글</button>&emsp;
	    		<hr>
	    	</div>
	    </div>
	    <!-- 테이블 시작 -->	
	    <div class="content-detail-body">
	    	<div class="container">
				<form action="/update" method="post">
					<table class="content-Detail-table">
						<tr class="ConNoConCategory">
							<!-- 1-(1) 번호(No)+ 번호 입력칸 (읽기만가능 readonly)-->
							<td><div class="conNo">No</div></td>
							<td><input id="conNoInput" name="conNo" value="${content.conNo}" readonly></td>
							<!-- 1-(2) 분류(Category) + 분류 입력칸  -->
							<td><div class="conCategory">분류</div></td>
							<td>
								<!-- 기존에 설정한 카테고리를 상단에 표시에서 selected로 보여줌 -->
							<select class=conCategoryInput name="conCategory">
                      			<c:choose>
                      				<c:when test="${content.conCategory eq '공지사항'}">
                      				<option value="공지사항" selected>공지사항</option>
                      				</c:when>
                      				<c:when test="${content.conCategory eq '야구'}">
                      				<option value="야구" selected>야구</option>
                      				</c:when>
                      				<c:when test="${content.conCategory eq '농구'}">
                      				<option value="농구" selected>농구</option>
                      				</c:when>
                      				<c:when test="${content.conCategory eq '축구'}">
                      				<option value="축구" selected>축구</option>
                      				</c:when>
                      				<c:when test="${content.conCategory eq '코딩'}">
                      				<option value="코딩" selected>코딩</option>
                      				</c:when>
                      				<c:when test="${content.conCategory eq '영어회화'}">
                      				<option value="영어회화" selected>영어회화</option>
                      				</c:when>
                      			</c:choose>
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
							</td>
						</tr>
						<tr>
						
							<!-- 2 제목(Title) + 입력칸 -->
							<!-- <td colspan="2"><div class="conTitle">제목</div></td> -->
							<td colspan="4"><input id="conTitleInput" name="conTitle" value="${content.conTitle}"></td>
						<tr>
						<tr>
							<!-- 3-(1) 작성자(Writer) + 입력칸  -->	
							<td class="conWriter">작성자</td>
							<td><input id="conWriterInput" name="conWriter" value="${content.conWriter}"></td>
							<!-- 3-(2) 조회수(Count) + 입력칸 (읽기만가능 readonly) -->	
							<td class="conCount">조회수</td>
							<td><input id="conCountInput" name="conCount" value="${content.conCount}" readonly></td>
						</tr>						
						<tr>
							<!-- 4-(1) 작성일(Create) + 입력칸 (읽기만가능 readonly) -->
							<td class="conCreate">작성일</td>
							<td><input id="conCreateInput" 
							           value="${content.conCreate}" 
							           type="datetime-local"
							           readonly></td>
							<!-- 4-(2) 수정일(Modify) + 입력칸 (읽기만가능 readonly) -->
							<td class="conModify">수정일</td>
							<td><input id="conModifyInput" 
							           value="${content.conModify}" 
							           type="datetime"
							           name="conModify" 
							           readonly></td>
						</tr>
						<tr>
							<!-- 5 내용(Detail) + 입력칸 -->
							<!-- <td colspan="2"><div class="conDetail">내용</div></td> -->
							<td colspan="4"><textarea id="conDetailInput"
							                 		  name="conDetail" 
							                          rows="10" 
							                          cols="50">${content.conDetail}
							                 </textarea>
							</td>
						</tr>
						<tr>
							<!-- 6 태그(Tag) + 입력칸 -->
							<td><div class="conTag">태그</div></td>
							<td colspan="3"><input id="conTagInput"
							                       name="conTag" 
							                       value="${content.conTag}">
							</td>
						</tr>
						
						<tr>
							<!-- 7 버튼 (수정, 목록, 글쓰기, 삭제) -->
							<td colspan="4">
								<div id="button">
										<button type="submit" class="modify-btn">수정</button>&emsp;
										<button type="button" onclick="location.href='list' " class="list-btn">목록</button>&emsp;
										<button type="button" onclick="location.href='form' " class="write-btn">글쓰기</button>&emsp;
										<button type="button" onclick="location.href='/contentDelete/${content.conNo}'" class="delete-btn">삭제</button>&emsp;
								</div>
							</td>
						</tr>
						<tr>
							<!-- 8 버튼 (작성자 게시글 더보기 ) -->
							<td colspan="4">
							<div id="conWriterMore">
								<div class="container">
									<button type="button" onclick="location.href='/list?searchType=conWriter&searchKeyword=${content.conWriter}'" class="conWriterMore-btn"><b>${content.conWriter}</b>님의 게시글 더보기</button>&emsp;
								</div>
							</div>
						</tr>
						
					</table>
				</form>
			</div>
		   </div>	
    <br><br>
    
    <!--  좋아요 하트 버튼  -->	
	  <div class="heart-btn">
	    <div class="content">
	      <span class="heart"></span>
	      <span class="text">Like</span>
	      <span class="numb"></span>
	    </div>
	  </div>
	  <script>
	    $(document).ready(function (){
	      $(".content").click(function (){
	        $(".content").toggleClass("heart-active")
	        $('.text').toggleClass("heart-active")
	        $(".numb").toggleClass("heart-active")
	        $(".heart").toggleClass("heart-active")
	      });
	    });
	  </script>
    
	<!-- 댓글 부분 -->
    <div class="reply">
    	<!-- 댓글 작성 -->
    	<table class="reply-write">
    		<th>
		    	<div class="reply-head">
		    		<div class="container">
			    		<input type="hidden" name="conNo" value=${content.conNo}/>
			    		<textarea id="reDetail" class="reply-content" rows="1" ></textarea>
			    		<!-- 댓글 입력 + 댓글수(+1) -->
			    		<button onclick="insertReply() 
			    						 updateReplyCntPlus(); ;" 
			    			    id="reply-btn" 
			    			    class="reply-btn">댓글달기
			    		</button>
					</div>
			    </div>
			</th>
	    </table>
   	</div>
    	<!-- 댓글 리스트 출력 -->
		<div class="reply-list">
    	<c:forEach var="r" items="${rlist}">
    		<form action="/updateReply/${r.reNo}/${content.conNo}" method="post">
			   	<!-- 댓글 박스처리 -->
			   	<table class="reply-box">
			   		<div class="container">
					<tr class="reply-detail" align="left">
						<td class="replyname">
						<c:out value="${r.rname}" />
						</td>
						<td class="replydetail"> 
				    	<input id="reDeatil" name="reDetail" value="${r.reDetail}">
				        </td>
				    </tr>
				    <tr>
				        <td colspan="3" class="reTime">
				        <c:set var="reCreateformattedDate" value="${r.reCreate.format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm:ss'))}" />
				    	<c:out value="입력: ${reCreateformattedDate}"  />
						<c:set var="reModifyformattedDate" value="${r.reModify.format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm:ss'))}" />
				    	<c:out value=" 수정 :${reModifyformattedDate}"  />
				    	</td>
					</tr>
					
					<tr>
						<!-- 댓글 수정하기 -->
						<td colspan="3" class="reply-box-button">
						<input type="submit" value="수정" class="modify-btn">&emsp;
						
						<!-- 댓글 삭제 + 댓글수(-1) -->
						<button type="button" onclick="location.href='/replyDelete/${r.reNo}/${content.conNo}'
						                              updateReplyCntMinus(); ;" 
						                      class="delete-btn">삭제
						</button>&emsp;
						
						<!-- 대댓글달기 -->
						<button type="button" onclick="toggleReplyTextarea('replyTextarea${r.reNo}') " class="write-btn">대댓글달기</button>&emsp;
							<div id="replyTextarea${r.reNo}" style='display:none'>
								<input type="hidden" name="conNo" value=${content.conNo}/>
			    				<!-- 대댓글 입력창 -->
 								<textarea id="reReDetail" value="${r.reDetail}" placeholder="답글은 100자" ></textarea>
 								<br>
								<input type="hidden" name="refCno" value=${content.conNo}>
								<!-- <input type="hidden" name="ref" value=${reply.getRef}>
								<input type="hidden" name="reStep" value=${reply.getReStep}>
								<input type="hidden" name="reLevel" value=${reply.getReLevel}> -->
								<button onclick="insertReplyReply()">등록</button>
								<button onclick="toggleReplyTextarea('replyTextarea${r.reNo}') ">취소</button>
							</div>
						</td>
					</tr>
					<br>
					</div>
				</table>
			</form>
		</c:forEach>
    </div>
    
	<!-- 댓글 등록  함수-->
	    <script>
	    function insertReply() {
	        $.ajax({
	            url: "insertReplyForm.bo",
	            data: {
	                "refCno": "${content.conNo}",
	                "rname": "${content.conWriter}",
	                "reDetail": $("#reDetail").val()
	            },
	            type: "post",
	            success: function(data) {
	            	console.log("댓글 등록 성공");
	                location.reload();
	            },
	            error: function() {
	                console.log("댓글 등록 실패");
	            }
	        })
	    }
	    </script>
		    
    <!-- 댓글수 리스트 반영 업데이트 함수  (+1)-->
	    <script>
	    function updateReplyCntPlus() {
	        $.ajax({
	            url: "updateReplyCntPlus.bo",  // ContentController로 이동
	            data: {
	            	"conNo" : "${content.conNo}", //같이 불러와야 업데이트 된다.
	            	"conReCnt" : "$(content.conReCnt}"
	            },
	            type: "post",  
	            success: function(data) {
	                console.log("댓글 숫자 업데이트 성공");
	            },
	            error: function() {
	                console.log("댓글 숫자 업데이트 실패");
	            }
	        });
	    } 
	    </script>
		    
	<!-- 댓글수 리스트 반영 업데이트 함수  (-1)-->
	    <script>
	    function updateReplyCntMinus() {
	        $.ajax({
	            url: "updateReplyCntMinus.bo",  // ContentController로 이동
	            data: {
	            	"conNo" : "${content.conNo}", // 같이 불러와야 업데이트 된다.
	            	"conReCnt" : "$(content.conReCnt}"
	            },
	            type: "post", 
	            success: function(data) {
	                console.log("댓글 숫자 업데이트 성공");
	            },
	            error: function() {
	                console.log("댓글 숫자 업데이트 실패");
	            }
	        });
	    } 
	    </script>	    
		    
    <!-- 이전글 , 다음글 보기 함수  -->
	    <script>
		  	// 이전글 보기 함수
		  function moveToPrevPage(conNo) {
		    var prevPage = ${nowPage - 1};
		     location.href = 'http://localhost:8080/detailForm?conNo=' + (conNo-1);
			}
			// 다음글 보기 함수
		  function moveToNextPage(conNo) {
		    var nextPage = ${nowPage + 1};
		    location.href = 'http://localhost:8080/detailForm?conNo=' + (conNo+1) ;
		  	}
		</script>
    	
    <!-- 대댓글 달기 함수  -->	
    
    	<!-- 대댓글 입력창 열고 닫기 -->
    	<script>
    		function toggleReplyTextarea(textareaId){
    			var textarea = document.getElementById(textareaId);
    	        textarea.style.display = (textarea.style.display === 'none' || textarea.style.display === '') ? 'block' : 'none';
    	    }
    		
    		<!-- 대댓글 취소 버튼 -->
    		function cancelReplyReply() {
    	        var textareaId = 'replyTextarea${r.reNo}';
    	        toggleTextarea(textareaId); // 취소 시 텍스트 영역을 숨김
    	    }
    	</script>
    	
    	<!--  대댓글 입력하기 -->
    	<script>
    		function insertReplyReply{
    			// 현재 대댓글의 ref, re_step, re_level 값 가져오기
    			var conNo = "${content.conNo}";
			    var currentRef = "${reply.ref}";
			    var currentReStep = "${reply.reStep}";
			    var currentReLevel = "${reply.reLevel}";
			
    			$.ajax({
    	            url: "insertReplyReply.bo",
    	            data: {
    	            	"conNo": conNo,
    	                "rname": "${content.conWriter}",
    	                "reDetail": $("#reReDetail").val(),
    	                "refCno": conNo,
    	                "ref": currentRef,
    	                "reStep": currentReStep,
    	                "reLevel": currentReLevel
    	            },
    	            type: "post",
    	            success: function(data) {
    	            	console.log("대댓글 등록 성공");
    	                location.reload();
    	            },
    	            error: function() {
    	                console.log("대댓글 등록 실패");
    	            }
    	        })
    	    }
    		}
    	
    	</script>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	</section>
    </body>
</html>