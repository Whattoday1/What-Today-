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
                    <a class="nav-link" href="reviewController" style="color: #3c3c3c;">컨텐츠 확인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="event.do" style="color: #3c3c3c;">이벤트</a>
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
                        <%-- 마이페이지 버튼 조건부 : 로그인여부 --%>    
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
					
                        <%-- 찜목록 버튼 조건부 : 로그인여부 --%>    
				    <c:choose>													
						<c:when test="${loginUser.user_id != null}">
							<li class="nav-item">
							    <a class="nav-link" href="wishController">
							        <img src="./resource/Images/s3.png" alt="찜목록" style="width: 30px;" height="30px">
							    </a>
							</li>							
						</c:when>
						<c:when test="${loginUser.user_id == null}">
							<li class="nav-item">
							    <a class="nav-link" href="login.do">
							        <img src="./resource/Images/s3.png" alt="찜목록" style="width: 30px;" height="30px">
							    </a>
							</li>	
						</c:when>
					</c:choose>
					

					<li class="nav-item">
					    <a class="nav-link" href="gg.do">
					        <img src="./resource/Images/s4.png" alt="고객센터" style="width: 30px;" height="30px">
					    </a>
					</li>
        
            </ul>
       </div>
                
                
      <!-- 로그인시스템으로 업데이트된 마이페이지 드롭다운 -->
      <div id="mypage-card" class="card">
               <h3>My Page</h3>
               <!-- 이미지를 중앙 정렬하여 추가 -->
               <div class="text-center">
                   <img src="./resource/Images/user.jpg" alt="프로필 이미지" style="width: 250px; height: 250px;">
               </div>
               
               <!-- 닉네임 및 닉네임 수정 이미지 링크 추가 및 간격 설정 -->
               <div class="text-center" style="margin-top: 20px;"> 
                   <h4>
                   	<c:if test="${loginUser.user_name != null}">					<%-- 수정부분2 --%>
                       닉네임: ${loginUser.user_name}(${loginUser.user_id}) 
                       <a href="링크_주소">
                         <img src="./resource/Images/pen.png" alt="수정 아이콘" style="width: 15px; height: 15px;">
                     	</a>
                     	</c:if>															<%-- 여기까지 --%>
                   </h4>
               </div>
               
               <br>
               <!-- 찜목록, 작성글, 작성댓글 정보 추가 -->
               
               <div class="text-center">
               <c:if test="${loginUser.user_name != null}">								<%-- 수정부분 3 --%>
                   <p><a href="./jj.html">찜목록</a>: 10 | <a href="./commu3.html">작성글</a>: 5 | <a href="./commu3.html">작성댓글</a>: 20</p>
               </c:if>
               </div>
               <c:if test="${loginUser.user_name != null}">
              	<form action="logout.do">
       	       		<input type="button" value="회원정보변경" onclick="location.href='memberUpdate.do?user_id=${loginUser.user_id}'">&nbsp;&nbsp; 
					<input type="submit" value="로그아웃" onclick="alert('로그아웃되었습니다.');"> 		
				</form>
				</c:if>																		<%-- 여기까지 --%>
      </div>

                
</header>


<!-- &&&&&&&&&&&&&&&&&찜목록 본분 영역&&&&&&&&&&&&&&&&&&&&&& -->
<br><br><br><br><br><br>
<legend style="color: #3c3c3c;">나의 찜목록</legend>


<!-- DB에 연동된 로우의 수를 보여주는 코드 -->
 ${fn:length(wish)} 개 
 

<!-- 한줄에 3개씩 찜목록 출력, DB에있는만큼 반복출력 forEach -->
 <div class="bookmark-container" style="font-family: 'Pretendard-Regular';">
  


 <div class="bookmark-container" style="font-family: 'Pretendard-Regular';">
	  <c:forEach items="${wish}" var="w" varStatus="loop">
	    <c:if test="${w.user_id eq loginUser.user_id }">
	    <div class="bookmark-item">
	      	<!-- WishDAO에는 쿼리문을통해 contentsdata테이블의 contents_img와 
	      	contents_name, contents_day1 day2도 가져오도록 설정하고 Wish.java 에 필드도만들어놨음 -->
			<a href="reviewController">	
				<img src="./resource/Images/jj1.jpg" alt="영화 포스터">
			</a>
		 	<p>${w.contents_name} <br>${w.contents_day1} ~ ${w.contents_day2}</p>	        
		    <form method="post" action="wishController?action=delete">
		    	<input type="hidden" name="wish_id" value="${w.wish_id}">
				<button type="submit" class="remove-button">삭제</button>
		    </form>	        
	      </div>
	      <c:if test="${loop.index % 3 == 2 or loop.last}">
	        <div style="clear: both;"></div> <!-- 세 번째 아이템이나 마지막 아이템 다음에 행 닫기 -->
	      </c:if>
	    </c:if>
	  </c:forEach>
</div>




  <!-- 추가 아이템을 이어서 넣으세요 -->
	
	
	

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