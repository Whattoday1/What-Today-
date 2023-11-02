<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head> <!-- 폰트 -->
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        
          /*회원정보수정*/
		.contain {
		  width: 500px;
		  margin: 0 auto;
		  background-color: #fff;
		  padding: 20px;
		  border-radius: 8px;
		  box-shadow: 0 0 5px rgba(0, 0, 0, 0.8);
		}
		
		form {
		  text-align: left;
		}
		
		.form-group {
		  margin: 10px 0;
		}
		
		label {
		  display: block;
		  color: #555;
		}
		
		input[type="text"],
		input[type="password"] {
		  width: 100%;
		  padding: 5px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		}
		
		input[type="date"],
		input[type="email"] {
		  width: 100%;
		  padding: 5px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		}
		
		.image-preview {
		  display: flex;
		  align-items: center;
		}
		
		.image-preview img {
		  width: 50px;
		  height: 50px;
		  border-radius: 50%;
		  margin-right: 10px;
		}
		
		#profile-image-upload {
		  display: none;
		}
		
		.image-preview label {
		  cursor: pointer;
		}
		
		.image-text {
		  color: #3c3c3c;
		}
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="./resource/CSS/event.css">
     
         
     <c:set var="path" value="${pageContext.request.contextPath}"/>
     
     <!-- path로 수정된 css참조 -->
     <!-- <link rel="stylesheet" href="${path}/resource/CSS/hh.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/CSS/hh.css">-->	
    
    <title>로그인</title>
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
    <script type="text/javascript" src="./script/member.js"></script>
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
<br>
<br>
    
  <div class="contain">
    <legend>회원 정보 수정</legend>
	<form action="./memberUpdate.do" method="post" name="frm">
        <div class="form-group">
        	<label for="user_id">아이디</label>
        	<input type="text" name="user_id" size="20" value="${mVo.user_id}" readonly style="color:rgb(180,180,180);">
        </div>
        <div class="form-group">
            <label for="user_pw">새로운 비밀번호</label>
            <input type="password" class="new-password" name="user_pw" required>
        </div>
        <div class="form-group">
            <label for="user_pw_check">새로운 비밀번호 확인</label>
            <input type="password" class="confirm-new-password" name="user_pw_check" required>
        </div>
        <div class="form-group">
        	<label for="user_name">이름</label>
        	<input type="text" name="user_name" size="20" value="${mVo.user_name}" readonly style="color:rgb(180,180,180);">
        </div>
        <div class="form-group">
            <label for="user_nickname">닉네임 변경</label>
            <input type="text" class="nickname" name="user_nickname" value="${mVo.user_nickname}" required>
        </div>
        <div class="form-group">
            <label for="nickname">성별</label>
            <input type="text" class="gender" name="user_gender" value="${mVo.user_gender}" readonly style="color:rgb(180,180,180);">
        </div>
        <div class="form-group">
            <label for="user_birth">생년월일</label>
            <input type="date" name="user_birth" size="20" value="${mVo.user_birth}" required>
        </div>
        <div class="form-group">
            <label for="user_mail">이메일</label>
            <input type="email" name="user_mail" size="20" value="${mVo.user_mail}">
        </div>
        <div class="form-group">
            <!--<label for="user_image">이미지</label>-->
            <input type="hidden" name="user_image" size="20" value="${mVo.user_image}">
        </div>
        <div class="form-group">
            <label for="user_mailing">이메일 수신동의 여부</label>
            <input type="text" name="user_mailing" size="20" value="${mVo.user_mailing}" readonly style="color:rgb(180,180,180);">
        </div>
        <div class="form-group" style="text-align:center;">
        <button type="submit" class="btn" style="text-align:center; width:200px; height:50px; background-color:#b30909; color:rgb(255, 255, 255);">
        	저장
        </button>
        </div>
        
    </form>
</div>
</body>
</html>