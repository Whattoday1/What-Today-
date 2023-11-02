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
    <style>@font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    
    
    
    <!--제sp 스타일 즉각반영-->
    
    
 
    
    
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
<br>
<br>
<br>
<br>
<div class="post-container">
	<!-- 게시글(연결 : param.poid) -->
	<!--<c:set var="page_id" value="J08" />-->
	<c:forEach items="${post}" var="p" >
		<c:if test="${p.po_id eq param.poid}">
		    <h1 class="post-title">${p.po_title} </h1>
		    <c:forEach items="${users}" var="u">
		    	<c:if test="${p.user_id eq u.user_id}">
		    		<p class="post-info">작성자: ${u.user_nickname} | 작성일: ${p.po_date}</p>
		    	</c:if>
		    </c:forEach>
		    <c:set var="puid" value="${p.user_id}"/>
		    <c:set var="poid" value="${p.po_id}"/>
		    <p class="post-content">
			${p.po_contents}
			</p>
			<img src="./resource/Images/${p.po_file}" alt="${p.po_file}" width="500px" height="500px">
			<br>
		</c:if>
	</c:forEach>
<div class="like-button">
    <img src="./resource/Images/gg.png" alt="좋아요 버튼" style="width: 25px; height: 25px;" class="like-button-icon">
    <span class="like-count">0</span>
</div>
</div>
<div>
	<form action="postController2?action=delete" method="post" style="text-align:right">
	<c:if test="${puid == loginUser.user_id}">
		<span style="font-size:smaller; margin-right:20px; color:rgb(130,130,130);">게시글 삭제는 댓글이 없어야만 할 수 있어요!</span>
		<input type="hidden" name="po_id" value="${poid}">
		<button type="submit" style="background-color: #b30909; color:white; border: none; border-radius: 5px; padding: 10px 15px; margin-right:10px;">삭제</button>
	</c:if>
	</form>
</div>

<!-- ~~게시글 댓글 입력창~~ -->
<form method="post" action="/PortfolioSample/replyController?action=insert" onsubmit="return validateForm()">
	<div class="comment-input">
		<input type="hidden" name="reply_id" placeholder="게시글 일련번호 자동생성 sql시퀀스">
		<input type="hidden" name="po_id" placeholder="게시글 고유주소" value="${param.poid}">
    	<input type="hidden" name="reply_date" value="" placeholder="시간 : 하단에 JS로 현재시간 불러오기">
    	<input type="hidden" name="user_id" value="${loginUser.user_id}" placeholder="유저아이디 연동 : 중요 !">
 		<input type="hidden" name="poid" placeholder="게시글주소" value="${param.poid}">
	
	    <textarea name="reply_contents" placeholder="댓글을 입력하세요&#13;&#10;댓글은 댓글 작성자, 글 작성자가 삭제할 수 있어요!"></textarea>
	    
		<c:choose>													<%-- 수정부분 --%>
        	<c:when test="${loginUser.user_id != null}">
        		<span style="font-size:smaller; color:rgb(130,130,130);"></span>
				<button type="submit" class="comment-button">댓글 남기기</button>
            </c:when>
            <c:when test="${loginUser.user_id == null}">
            	<button id="login_required" class="comment-button">
            		<a href="login.do" style="color: white; text-decoration : none;">댓글 남기기</a>
            	</button>
            </c:when>
        </c:choose>													<%-- 여기까지 --%>

	</div>
</form>



<!-- 비로그인 접근시 예 아니오로 로그인창으로 갈지 남을지 선택 -->							
<script>
    var loginRequiredButtons = document.querySelectorAll("#login_required");
    loginRequiredButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            var confirmation = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
            if (!confirmation) {
                event.preventDefault(); // 기본 이벤트(링크 이동)를 중지
            } else {
                window.location.href = "login.do"; // "예"를 클릭하면 로그인 페이지로 이동
            }
        });
    });
</script>





<script>
	  // 현재 날짜 가져오기 
	  var currentDate = new Date();
	
	  // 날짜를 원하는 형식으로 변환 (예: "yyyy-MM-dd")
	  var year = currentDate.getFullYear();
	  var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 포맷팅
	  var day = String(currentDate.getDate()).padStart(2, '0'); // 날짜는 두 자리로 포맷팅
	  var currentDateStr = year + '-' + month + '-' + day;
	
	  // review_date 필드에 현재 날짜 값을 입력
	  document.querySelector('input[name="reply_date"]').value = currentDateStr;
</script>
    	  
	

<!-- ~~게시글 댓글창~~ -->


 <c:forEach items="${reply}" var="r"> <!-- forEach이하의 내용이 반복처리 -->
 	<c:if test="${r.po_id eq param.poid}">
	 		<div class="comment">
	        <div class="comment-info">
	        <c:set var="rplid" value="${r.reply_id}"/>
	        	<c:forEach items="${users}" var="u">
	        		<c:if test="${u.user_id eq r.user_id}">
	            		<img src="./resource/Images/${u.user_image}" alt="${u.user_image}" class="profile-image">
	            	</c:if>
            	</c:forEach>
            	<c:forEach items="${users}" var="u">
            		<c:if test="${u.user_id eq r.user_id}">
            			<p class="comment-username" style="margin-bottom:0;">${u.user_nickname}</p>
            		</c:if>
            	</c:forEach>
	            <p class="comment-date" style="margin-bottom:0;">${r.reply_date}</p>
	        </div>
	        <p class="comment-content">
	            ${r.reply_contents}
	        </p>
	        <div style="width:1230px; float:right;">
	        <form action="replyController?action=delete" method="post" style="float:right">
	        	<c:if test="${puid == loginUser.user_id or r.user_id == loginUser.user_id}">
	        		<input type="hidden" name="reply_id" value="${r.reply_id}">
	        		<input type="hidden" name="poid" placeholder="게시글주소" value="${param.poid}">
	        		<button type="submit" style="background-color: #b30909; color:white; border: none; border-radius: 5px; padding: 10px 15px; margin-right:10px;">댓글 삭제</button>
	        	</c:if>
	        </form>
	        </div>
    </div>
 	
	</c:if>
 </c:forEach>



<a href="postController">
    <button class="comment-button" style="background-color: #b30909; color:white; border: none; border-radius: 5px; padding: 10px 15px;">목록</button>
</a>
  
<script>
    // 좋아요 버튼 클릭 이벤트 처리
    const likeButton = document.querySelector('.like-button');
    const likeCount = document.querySelector('.like-count');
    
    let likes = 0; // 초기 좋아요 수
    
    likeButton.addEventListener('click', () => {
        likes++; // 좋아요 수 증가
        likeCount.textContent = likes; // 화면에 좋아요 수 업데이트
    });
    
	function validateForm() {
	    var content = document.getElementsByName('reply_contents')[0].value;
	
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