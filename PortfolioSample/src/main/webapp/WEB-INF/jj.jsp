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
    
    .delbutton {
        border: 2px solid #b30909;
    	border-radius: 5px;
    	background-color: #b30909;
    	color: #fff;
    	font-weight: bolder;
    	width:70px;
    	height:40px;
    }
    
	.custom-footer {
	  position: absolute;
	  left : 0px;
	  background-color: #b30909;
	  color: white; 
	  padding: 100px 0; /* 위아래 패딩 설정 */
	  clear: both;
	  width : 100%;
	}
	
	.custom-footer p {
	  margin: 0; /* 기본 마진 제거 */
	}
	
	/* 푸터 텍스트 스타일 */
	.custom-footer p {
	  font-size: 14px;
	}
    
  </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 원래 css주소참조-->
	<link rel="stylesheet" href="./resource/CSS/index.css">
    <link rel="stylesheet" type="text/css" href="./resource/CSS/jj.css">    
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


<!-- &&&&&&&&&&&&&&&&&찜목록 본분 영역&&&&&&&&&&&&&&&&&&&&&& -->
<br><br><br><br><br><br>

<div class=wishbox style="display:block; width:1200px;">
	<legend style="color: #3c3c3c;">나의 찜목록</legend>


<!-- 한줄에 3개씩 찜목록 출력, DB에있는만큼 반복출력 forEach -->
	<div class="bookmark-container" style="font-family: 'Pretendard-Regular';">
		  <c:forEach items="${wish}" var="w" varStatus="loop">
		  <form method="post" action="wishController?action=delete">
		    <c:if test="${w.user_id eq loginUser.user_id }">
		    <div class="bookmark-item">
		      	<!-- WishDAO에는 쿼리문을통해 contentsdata테이블의 contents_img와 
		      	contents_name, contents_day1 day2도 가져오도록 설정하고 Wish.java 에 필드도만들어놨음 -->
				<a href="reviewController">	
					<img src="./resource/Images/${w.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px" alt="영화 포스터">
				</a>
			 	<p>${w.contents_name} <br>${w.contents_day1} ~ ${w.contents_day2}</p>	
			 	<input type="hidden" name="wish_id" value="${w.wish_id}">  
		    	<button type="submit" class="delbutton">삭제</button>        
		      </div>
		    </c:if>
		  </form>	
		  </c:forEach>
	</div>
</div>

	
	
	

   <!-- 푸터 영역 -->
 <footer class="custom-footer" style="font-family:'Pretendard-Regular';">  
  <div class="contain">
    <ul class="policy_list">
      <li>회사소개</li>
      <li>광고/제휴/출점문의</li>
      <li>이용약관</li>
      <li>편성기준</li>
      <li><strong>개인정보처리방침</strong></li>
      <li>법적고지</li>
      <li>이메일주소무단수집거부</li>
      <li>윤리경영</li>
      <li>사이버감사실</li>
  </ul>
  <hr>
  <article class="company_info_wrap">
      <section class="company_info">
          <address>(04377)경기도 수원시 영통구 </address>
          <dl class="company_info_list">
              <dt>대표이사</dt>
              <dd>허민회</dd>
              <dt>사업자등록번호</dt>
              <dd>104-81-45690</dd>
              <dt>통신판매업신고번호</dt>
              <dd>2023-수원시영통구-0662 사업자정보확인</dd>
          </dl>
          <dl class="company_info_list">
              <dt>호스팅사업자</dt>
              <dd>오늘뭐하지네트웍스</dd>
              <dt>개인정보보호 책임자</dt>
              <dd>도형구</dd>
              <dt>대표이메일</dt>
              <dd>mohh55@cj.net</dd>
              
          </dl>
          <p class="copyright">&copy; 오늘뭐하지? All Rights Reserved</p>
      </section>
      <section class="familysite_wrap">
        
</div>  
</body>
</footer>


</div>
</body>
</html>