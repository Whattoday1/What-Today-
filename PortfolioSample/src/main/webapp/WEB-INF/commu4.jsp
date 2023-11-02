<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
       <!-- 폰트 -->
    <style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    
    .submit_list{
      border : none;
      padding: 10px 20px; /* 버튼 내부 여백 설정 */
	  background-color: #b30909; /* 배경색 설정 */
	  color: #fff; 
	  border: none; 
	  border-radius: 5px; 
	  cursor: pointer; 
	  font-size: 16px; 
	  width : 70px;
	  margin-left : 15px;
    }
    


    
    
  </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 원래 css주소참조-->
	<link rel="stylesheet" href="./resource/CSS/index.css">
    <link rel="stylesheet" type="text/css" href="./resource/CSS/style.css">    
	<link rel="stylesheet" href="./resource/CSS/commu1.css">
<!-- path로 수정된 css참조 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resource/CSS/index.css">
<link rel="stylesheet" type="text/css" href="${path}/resource/CSS/style.css"> -->	


      	
    <title>Your Website</title>
       <!-- 슬라이드쇼 영역 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
          <!-- jQuery 스크립트 추가 -->
          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
          <script>
              $(document).ready(function() {
                  $("#mypage-link").click(function(e) {
                      e.preventDefault();
                      $("#mypage-card").slideToggle();
                  });
              });

		  $(".hover").mouseleave(
		    function () {
		      $(this).removeClass("hover");
		    }
		  );
    </script>
	
         
</head>
<body>
    <div id="container" style="font-family:'Pretendard-Regular';">  
   <!-- 네비 고정 -->
<header class="navbar navbar-expand-lg navbar-light fixed-top custom-navbar">
    <div class="container">
        <!-- 로고를 왼쪽에 배치 -->
		<a class="navbar-brand" href="main.do">
        	<img src="./resource/Images/3_ci_clear5.png" alt="로고 이미지" style="width: 300px; height: 60px;">
        </a>
        <!-- 나머지 요소들을 오른쪽에 배치 -->
        <div class="navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav" >
                <li class="nav-item">
                    <a class="nav-link" href="postController" style="color: #3c3c3c;">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contentsController" style="color: #3c3c3c;">컨텐츠 확인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sub.do?action=event" style="color: #3c3c3c;">이벤트</a>
                </li>
				<li class="nav-item">
                    <c:choose>													<%-- 수정부분 --%>
                    	<c:when test="${loginUser.user_name != null}">
                        <a class="nav-link" href="logout.do" onclick="alert('로그아웃 되었습니다.');">
                            <img src="./resource/Images/s1.png" alt="로그아웃" style="width: 30px;" height="30px">
                        </a>
                        </c:when>
                        <c:when test="${loginUser.user_name == null}">
                        <a class="nav-link" href="login.do">
                            <img src="./resource/Images/s1u.png" alt="로그인" style="width: 30px;" height="30px">
                        </a>
                        </c:when>
                    </c:choose>													<%-- 여기까지 --%>
                    </li>
                    <li class="nav-item">
				    <c:choose>													
						<c:when test="${loginUser.user_id != null}">
							<li class="nav-item">
							    <a class="nav-link" href="#" id="mypage-link">
							        <img src="./resource/Images/s2.png" alt="마이페이지" style="width: 30px;" height="30px">
							    </a>
							</li>							
						</c:when>
						<c:when test="${loginUser.user_id == null}">
							<li class="nav-item">
							    <a class="nav-link" href="login.do">
							        <img src="./resource/Images/s2.png" alt="마이페이지" style="width: 30px;" height="30px">
							    </a>
							</li>									
						</c:when>
					</c:choose>
                    </li>
                    <li class="nav-item">
                    	<c:choose>													<%-- 수정부분 --%>
                    	<c:when test="${loginUser.user_name != null}">
                        	<a class="nav-link" href="wishController">
                            	<img src="./resource/Images/s3.png" alt="찜목록" style="width: 30px;" height="30px">
                        	</a>
                        </c:when>
                        <c:when test="${loginUser.user_name == null}">
                        	<a class="nav-link" href="login.do">
                            	<img src="./resource/Images/s3.png" alt="찜목록" style="width: 30px;" height="30px" onclick="alert('로그인이 필요한 서비스입니다.')">
                        	</a>
                        </c:when>
                    	</c:choose>	
                        <li class="nav-item">
                            <a class="nav-link" href="sub.do?action=gg">
                                <img src="./resource/Images/s4.png" alt="고객센터" style="width: 30px;" height="30px">
                            </a>
                        </li>
            </ul>
       </div>
                
                
      <!-- 로그인시스템으로 업데이트된 마이페이지 드롭다운 -->
      <div id="mypage-card" class="card">
               <h3 style="font-weight:1000;" style="margin-top:10px;">My Page</h3>
               <!-- 이미지를 중앙 정렬하여 추가 -->
               <div class="text-center">
               	<c:forEach items="${users}" var="u" varStatus="vs">
               		<c:if test="${loginUser.user_id == u.user_id}">
               		<img src="./resource/Images/${u.user_image}" alt="${u.user_image}" style="width: 250px; height: 250px; border-radius:250px;">
               		</c:if>
               	</c:forEach>
               </div>
               
               <!-- 닉네임 및 닉네임 수정 이미지 링크 추가 및 간격 설정 -->
               <div class="text-center" style="margin-top: 20px;"> 
                   <h4>
                   <c:forEach items="${users}" var="uc">
                   	<c:if test="${loginUser.user_name == uc.user_name}">					<%-- 수정부분2 --%>
                       <span style="font-size:larger; font-weight:800;">${uc.user_nickname}</span><br>
                       <span style="font-size:smaller; font-weight:400; color:rgb(130,130,130);">${uc.user_name} (${uc.user_id})</span>
                       <a href="memberUpdate.do?user_id=${loginUser.user_id}">
                         <img src="./resource/Images/pen.png" alt="수정 아이콘" style="width: 15px; height: 15px;">
                     	</a>
                     </c:if>	
                     </c:forEach>														<%-- 여기까지 --%>
                   </h4>
               </div>
               
               <br>
               <!-- 찜목록, 작성글, 작성댓글 정보 추가 -->
               
               <div class="text-center">
               <c:if test="${loginUser.user_name != null}">								<%-- 수정부분 3 --%>
                   <p><a href="wishController">찜목록</a> | <a href="postController3">작성글</a>
               </c:if>
               </div>
               <c:if test="${loginUser.user_name != null}">
              	<form action="logout.do">
					<input style="background-color: #b30909; color:white; border: none; border-radius: 5px; padding: 10px 15px; font-weight:800;" 
					type="submit" value="로그아웃" onclick="alert('로그아웃되었습니다.');"> 		
				</form>
				</c:if>																		<%-- 여기까지 --%>
      </div>

                
</header>
   <!-- 게시판 글쓰기-->
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
 	<div class="container"style="font-family:'Pretendard-Regular';">  
    <legend style="color: #3c3c3c;">게시판 글쓰기</legend>
    <br>
    <br>
    
    
    <form method="post" action="/PortfolioSample/postController?action=insert" onsubmit="return validateForm()">
    	<input type="hidden" name="po_id" placeholder="게시글 일련번호 자동생성 sql시퀀스">
    	<input type="hidden" name="pd_rec" value="0" placeholder="추천수 기본값 0 ">
    	<input type="hidden" name="po_count" value="0" placeholder="조회수 기본값 0">
    	<input type="hidden" name="po_file" value="pdimg.jpg" placeholder="이미지임시">
    	
    	<input type="hidden" name="po_date" value="" placeholder="시간 : 하단에 JS로 현재시간 불러오기">
    	<input type="hidden" name="user_id" value="${loginUser.user_id}" placeholder="유저아이디 연동 : 중요 !">
    	
    	
	    <table class="board_write">
	        <tbody>
	            <tr>
	                <th scope="row">카테고리</th>
	                <td>
	                    <select class="category" name="po_category">
	                        <option value="잡담">잡담</option>	                    
	                        <option value="리뷰">리뷰</option>
	                        <option value="맛집 추천">맛집 추천</option>
	                        <option value="명소 정보">명소 정보</option>
	                        <option value="티켓팅">티켓팅</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <tr>
	                    <th scope="row">제목</th>
	                    <td>
	                        <div class="input">
	                            <input type="text" name="po_title" title="글 제목 입력"  maxlength="70" style="text-align:left;">
	                        </div>
	                    </td>
	                </tr>
	               
					<!-- 
	                <th scope="row">파일첨부</th>
	                <td class="file_upload">
	                    <div class="file">
	                        <div>
	                            <label for="file" title="파일선택">파일선택</label>
	                            <input type="file" name="simg" class="fileUp" id="file">
	                        </div>
	                    </div>
	                </td>
	                 -->
	            </tr>
	            <tr>
	                <th scope="row">내용</th>
	                <td>                      
	                    <textarea class="content" name="po_contents" rows="4" cols="50" style="text-align:left;"></textarea>
	
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <div class="btn_box center btn_type3">
	        <input class="submit_list" type="submit" value="등록">
	        <a href="postController"><input class="submit_list" value="목록"></a>
	    </div>
    </form>
</div>
	

	
	
	<script>
		  // 현재 날짜 가져오기 
		  var currentDate = new Date();
		
		  // 날짜를 원하는 형식으로 변환 (예: "yyyy-MM-dd")
		  var year = currentDate.getFullYear();
		  var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 포맷팅
		  var day = String(currentDate.getDate()).padStart(2, '0'); // 날짜는 두 자리로 포맷팅
		  var currentDateStr = year + '-' + month + '-' + day;
		
		  // review_date 필드에 현재 날짜 값을 입력
		  document.querySelector('input[name="po_date"]').value = currentDateStr;

	  <!-- 제목, 내용 입력시키기 -->
		function validateForm() {
		    var title = document.getElementsByName('po_title')[0].value;
		    var content = document.getElementsByName('po_contents')[0].value;
		
		    if (title.trim() === '') {
		        alert('제목을 입력해야합니다.');
		        return false; // 폼 제출을 방지합니다
		    }
		
		    if (content.trim() === '') {
		        alert('내용을 입력해야합니다.');
		        return false; // 폼 제출을 방지합니다
		    }
		
		    return true; // 모든 유효성 검사가 통과하면 폼 제출을 허용합니다
		}
	</script>
    	  
	
        
	
	
	
	
	
	
	  


<br>
<br>
<br>
   <!-- 푸터 영역 -->
   <footer class="custom-footer">
    <div class="contain">
        <div class="row">
            <div class="col-md-12 text-center">
                <p>&copy; 2023 Your Website. All Rights Reserved.</p>
            </div>
        </div>
    </div>  
</footer>


</div>
</body>
</html>