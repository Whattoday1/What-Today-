<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
    <!-- 폰트 -->
    <!-- 폰트 -->
           <style>@font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"]
        select {
       
            margin-bottom: 10px;
            border: 1px solid #b30909;
            border-radius: 5px;
        }

        select {
            height: 33px;
        }

        button {
            background-color: #b30909;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #b30909;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="./resource/CSS/hh.css">
     <link rel="stylesheet" type="text/css hreh" href="./resource/CSS/hh.css">
     
         <!-- path로 수정된 css참조 
      <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/resource/CSS/hh.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/CSS/hh.css">-->	
    <title>회원가입폼</title>

    <!-- 슬라이드쇼 영역 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <!-- jQuery 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#mypage-link").click(function (e) {
                e.preventDefault();
                $("#mypage-card").slideToggle();
            });
        });
    </script>
    <!-- 아이디 중복체크 함수 idCheck()가 들어있는 js경로 -->
    <script type="text/javascript" src="./resource/script/member.js"></script>
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
    <br>
    
    
    <div class="form-container">
     <!-- 회원가입입입 -->
      <h4 style="color: #3c3c3c;"><b>회원가입</b></h4>
      
      <hr>
 	 <form method="post" action="./join.do" name='frm'>
      <label>유저 id</label><br>
      <input type="text" name="user_id" style="width: 190px;" required>
      <input type="hidden" name="reid" size="20">
      <!-- 중복체크 현재 사용불가 -->
      <input type="button" value="중복 체크" onclick="idCheck()" ><br>
      
      <script>
	      function idCheck() {
	      	if (document.frm.user_id.value == "") {
	      		alert('아이디를 입력하여 주십시오.');
	      		document.formm.user_id.focus();
	      		return;
	      	}
	      	var url = "idCheck.do?user_id=" + document.frm.user_id.value;
	      	window.open(url, "_blank_1",
	      					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	      } 
      </script>
      
      
      
      <label>이름</label><br>
      <input type="text" name="user_name" required><br>
      <label>닉네임</label><br>
      <input type="text" name="user_nickname" required><br>
      <label>비밀번호</label><br>
      <input type="password" name="user_pw" required><br>
      <label>성별</label><br>
      <select class="user_gender" name="user_gender" style="height:44px; margin-bottom:10px;" required>
        <option value="M" style="text-align: center;">M</option>
        <option value="F" style="text-align: center;">F</option>
      </select><br>
      <label>생년월일</label><br>
      <input type="date" name="user_birth" value="2010-01-01" required><br>
     <label>이메일</label><br>
        <input type="text" class="email1" name="user_mail" required>
      <input type="hidden" name="user_image" value="udimg.jpg"><br>
      <label>메일 수신 동의여부</label>
      <input type="radio" name="user_mailing" value="Y" checked>Y
      <input type="radio" name="user_mailing" value="N">N<br>
      <br>
      <button type="submit" onclick="return joinCheck()">등록</button>
    </form>
    </div>
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
</body>
</html>

<script>
  document.getElementById("email").addEventListener("change", function() {
	var emailInput = document.getElementById("email1");
    var selectedDomain = this.value;
    emailInput.value = emailInput.value.replace(/@.*$/, "") + "@" + selectedDomain;
  });
</script>