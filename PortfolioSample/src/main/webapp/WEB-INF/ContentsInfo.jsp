<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>컨텐츠 정보</title>
<link rel="stylesheet" href="./resource/CSS/co.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	    $("#mypage-link").click(function(e) {
	        e.preventDefault();
	        $("#mypage-card").slideToggle();
	    });
	});
</script>
<style>

	<!-- 폰트영역 -->
 
	
	@font-face {
	    font-family: 'SOYOMapleBoldTTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'KCCMurukmuruk';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCMurukmuruk.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	
	#container2 {
		width:1200px;
		height:auto;
		margin:auto;
	}
	
	.locbox {
		float:left;
		width:1200px;
		height:auto;
		display:block;
	}
	
	
	<!-- 컨텐츠 박스 영역 -->
	
	.contents_box {
		display: block;
		width: 350px;
		height: 600px;
		margin: auto;
	}
	
	.contents_box ul {
		width:350px;
		height:600px;
		display:block;
		list-style:none;
		background-color:white;
		padding: 10px;
		float:left;
		border:1px solid black;
		border-radius:5px;
		margin-bottom:0;
	}
	
	.contents_box li {
		text-align:center;
		margin-top: 5px;
	}
	
	.img_box {
		margin:auto;
		display:block;
		width: 300px;
		height: 420px;
		background-color:blue;
	}
	.contents_box .cc_button {
		display:block;
		width:300px;
		height:150px;
		background-color:white;
		margin:auto;
		text-align:center;
	}
	
	.desc_box {
		display:block;
		width:300px;
		height:150px;
		background-color:white;
		margin:auto;
		text-align:center;
	}
	
	.desc_box table {
		font-family: 'KCCMurukmuruk';
		font-size: small;
		margin:auto;
	}
	
	.desc_box table td {
		padding:3px;
	}



	.datebox {
		text-align:center;
		display:flex;
		overflow-x:scroll;
		width:840px;
		height:180px;
		padding:0px;
		margin: 10px auto;
		transition: all 0.2s;
	}
	
	.datebox::-webkit-scrollbar {
		height: 15px;
		background-color:white;
		border-radius:15px;
		border: 2px solid #86a2bf;
	}
	
	.datebox::-webkit-scrollbar-thumb {
		background-color: #86a2bf;
		border-radius: 15px;
	}
	
	.typebox {
		text-align:center;
		display:block;
		width:720px;
		height:50px;
		padding:0px;
		margin: 20px auto;
		transition: all 0.2s;
	}
	
	.ctypebox {
		float:left;
		display:block;
		margin-left: 10px;
		margin-right: 10px;
	}
	
	.ctypebox button {
		border: 0px;
		width:100px;
		height:50px;
		background-color: rgb(67, 167, 180);
		color: #fff;
		border-radius: 5px;
		padding: 10px 20px;
		font-size: 16px;
	}
	

	.datebox2 {
		list-style:none;
		white-space: nowrap;
		display:flex;
		padding:0;
		transition: all 0.3s;
	}
	
	.datebox2 li {
		text-align: center;
	    float: left;
	    margin-right: 10px;
	    margin-left: 10px;
	    height: 150px;
	    width: 100px;
	    border: 2px solid #86a2bf;
	    border-radius: 5px;
	    white-space: nowrap;
	}
	
	.datebox2 li button {
		background-color: rgba(0,0,0,0);
		border:0;
		width:99px;
		height:149px;
	}
	
	@font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    .text-center {
    	text-align:center;
    }
    
    .custom-footer {
	  background-color: #b30909;
	  color: white; 
	  padding: 100px 0; /* 위아래 패딩 설정 */
	}
	
	.custom-footer p {
	  margin: 0; /* 기본 마진 제거 */
	}
	
	/* 푸터 텍스트 스타일 */
	.custom-footer p {
	  font-size: 14px;
	}
	    
	.datebox2 img {
		position:static;
		top: 0;
		left: 0;
		width:70px;
		height:70px;
	}
	

   	#contents_list_box{
	  background-color: rgb(233, 245, 244);
	  height: 700px;
	  width : 1200px;
	  margin : auto;
	  padding-left : 0px;
	  overflow-y: scroll; /* 세로 스크롤바만 표시합니다 */
	  overflow-x: hidden; /* 가로 스크롤바는 숨깁니다 */
	  border : none;
	  border-radius:15px;
	  margin-bottom:50px;
	}
	
	#contents_list_box::-webkit-scrollbar {
		width: 15px;
		background-color:white;
		border-radius:15px;
		border: 2px solid #86a2bf;
	}
	
	#contents_list_box::-webkit-scrollbar-thumb {
		background-color: #86a2bf;
		border-radius: 15px;
	}

	
	.contents_name{
		margin-left:30px;
		background-color: azure;
		width : 200px;
		height : 40px;
		text-align: center;
		font-size : 18px;
		font-weight: bold;
		padding : 7px;
		border-radius: 10px;
	}
	
	
	.contents_name_box{
	  margin : auto;
	  margin-bottom : 40px;
	  width : 1200px;
	  height : auto;
	  min-height: 100px; 
	  background-color: rgb(233, 245, 244);
	  border-radius: 0 3px 3px 3px;
	}
	
	.datep {
		margin-top: 20px;
	}
	
	.wkbtnbox {
	    margin: 20px;
	    width: 1200px;
	    height: 120px;
	    display: block;
	    text-align: center;
	}
	
	.weekbtn {
		text-align: center;
	    margin-left: 5px;
	    margin-right: 5px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    width: 116px;
	    height: 50px;
	    background-color: rgb(233, 245, 244);
	    border: 1px solid rgb(203, 215, 214);
	    border-radius: 5px;
	    float: left;
	}
</style>
</head>
<header class="navbar navbar-expand-lg navbar-light fixed-top custom-navbar">
    <div class="container">
        <!-- 로고를 왼쪽에 배치 -->
		<a class="navbar-brand" href="main.do">
        	<img src="./resource/Images/3_ci_clear5.png" alt="로고 이미지" style="width: 300px; height: 60px;">
        </a>
        <!-- 나머지 요소들을 오른쪽에 배치 -->
        <div class="navbar-collapse justify-content-end" style="font-family: 'Pretendard-Regular'; font-weight:600;" id="navbarNav">
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
      <div id="mypage-card" class="card" style="text-align:center;">
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
              	<form action="logout.do" style="text-align:center;">
					<input style="background-color: #b30909; color:white; border: none; border-radius: 5px; padding: 10px 15px; font-weight:800;" 
					type="submit" value="로그아웃" onclick="alert('로그아웃되었습니다.');"> 		
				</form>
				</c:if>																		<%-- 여기까지 --%>
      </div>

                
</header>
<body>
	<%-- 필터가 적용되지 않은 컨텐츠 정보 테이블 --%>

	<c:set var="loc" value=""/>
	<%-- <c:if test="${s.contents_day1 <= param.day && s.contents_day2 >= param.day && s.contents_location.contains(loc)}"> --%>
    <h4><b style="color: #3c3c3c; font-family: 'Pretendard-Regular';">컨텐츠 정보&nbsp;</b></h4>
	<hr>
	 <br>
	<div id="container2" style="font-family:'Pretendard-Regular';">
	
		<form class="selectform" action="/PortfolioSample/contentsController" method="post">
			<div class="datebox">
				<ul class="datebox2">
					<li><button name="day" value="2023-08-01">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-01<p>
					</button></li>
					<li><button name="day" value="2023-08-02">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-02<p>
					</button></li>
					<li><button name="day" value="2023-08-03">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-03<p>
					</button></li>
					<li><button name="day" value="2023-08-04">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-04<p>
					</button></li>
					<li><button name="day" value="2023-08-05">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-05<p>
					</button></li>
					<li><button name="day" value="2023-08-06">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-06<p>
					</button></li>
					<li><button name="day" value="2023-08-07">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-07<p>
					</button></li>
					<li><button name="day" value="2023-08-08">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-08<p>
					</button></li>
					<li><button name="day" value="2023-08-09">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-09<p>
					</button></li>
					<li><button name="day" value="2023-08-10">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-10<p>
					</button></li>
					<li><button name="day" value="2023-08-11">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-11<p>
					</button></li>
					<li><button name="day" value="2023-08-12">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-12<p>
					</button></li>
					<li><button name="day" value="2023-08-13">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-13<p>
					</button></li>
					<li><button name="day" value="2023-08-14">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-14<p>
					</button></li>
					<li><button name="day" value="2023-08-15">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-15<p>
					</button></li>
					<li><button name="day" value="2023-08-16">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-16<p>
					</button></li>
					<li><button name="day" value="2023-08-17">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-17<p>
					</button></li>
					<li><button name="day" value="2023-08-18">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-18<p>
					</button></li>
					<li><button name="day" value="2023-08-19">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-19<p>
					</button></li>
					<li><button name="day" value="2023-08-20">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-20<p>
					</button></li>
					<li><button name="day" value="2023-08-21">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-21<p>
					</button></li>
					<li><button name="day" value="2023-08-22">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-22<p>
					</button></li>
					<li><button name="day" value="2023-08-23">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-23<p>
					</button></li>
					<li><button name="day" value="2023-08-24">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-24<p>
					</button></li>
					<li><button name="day" value="2023-08-25">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-25<p>
					</button></li>
					<li><button name="day" value="2023-08-26">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-26<p>
					</button></li>
					<li><button name="day" value="2023-08-27">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-27<p>
					</button></li>
					<li><button name="day" value="2023-08-28">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-28<p>
					</button></li>
					<li><button name="day" value="2023-08-29">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-29<p>
					</button></li>
					<li><button name="day" value="2023-08-30">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-30<p>
					</button></li>
					<li><button name="day" value="2023-08-31">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">08-31<p>
					</button></li>
					<li><button name="day" value="2023-09-01">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-01<p>
					</button></li>
					<li><button name="day" value="2023-09-02">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-02<p>
					</button></li>
					<li><button name="day" value="2023-09-03">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-03<p>
					</button></li>
					<li><button name="day" value="2023-09-04">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-04<p>
					</button></li>
					<li><button name="day" value="2023-09-05">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-05<p>
					</button></li>
					<li><button name="day" value="2023-09-06">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-06<p>
					</button></li>
					<li><button name="day" value="2023-09-07">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-07<p>
					</button></li>
					<li><button name="day" value="2023-09-08">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-08<p>
					</button></li>
					<li><button name="day" value="2023-09-09">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-09<p>
					</button></li>
					<li><button name="day" value="2023-09-10">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-10<p>
					</button></li>
					<li><button name="day" value="2023-09-11">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-11<p>
					</button></li>
					<li><button name="day" value="2023-09-12">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-12<p>
					</button></li>
					<li><button name="day" value="2023-09-13">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-13<p>
					</button></li>
					<li><button name="day" value="2023-09-14">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-14<p>
					</button></li>
					<li><button name="day" value="2023-09-15">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-15<p>
					</button></li>
					<li><button name="day" value="2023-09-16">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-16<p>
					</button></li>
					<li><button name="day" value="2023-09-17">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-17<p>
					</button></li>
					<li><button name="day" value="2023-09-18">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-18<p>
					</button></li>
					<li><button name="day" value="2023-09-19">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-19<p>
					</button></li>
					<li><button name="day" value="2023-09-20">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-20<p>
					</button></li>
					<li><button name="day" value="2023-09-21">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-21<p>
					</button></li>
					<li><button name="day" value="2023-09-22">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-22<p>
					</button></li>
					<li><button name="day" value="2023-09-23">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-23<p>
					</button></li>
					<li><button name="day" value="2023-09-24">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-24<p>
					</button></li>
					<li><button name="day" value="2023-09-25">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-25<p>
					</button></li>
					<li><button name="day" value="2023-09-26">
						<img src="./resource/Images/w-6.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-26<p>
					</button></li>
					<li><button name="day" value="2023-09-27">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-27<p>
					</button></li>
					<li><button name="day" value="2023-09-28">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-28<p>
					</button></li>
					<li><button name="day" value="2023-09-29">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-29<p>
					</button></li>
					<li><button name="day" value="2023-09-30">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">09-30<p>
					</button></li>
					<li><button name="day" value="2023-10-01">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-01<p>
					</button></li>
					<li><button name="day" value="2023-10-02">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-02<p>
					</button></li>
					<li><button name="day" value="2023-10-03">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-03<p>
					</button></li>
					<li><button name="day" value="2023-10-04">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-04<p>
					</button></li>
					<li><button name="day" value="2023-10-05">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-05<p>
					</button></li>
					<li><button name="day" value="2023-10-06">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-06<p>
					</button></li>
					<li><button name="day" value="2023-10-07">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-07<p>
					</button></li>
					<li><button name="day" value="2023-10-08">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-08<p>
					</button></li>
					<li><button name="day" value="2023-10-09">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-09<p>
					</button></li>
					<li><button name="day" value="2023-10-10">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-10<p>
					</button></li>
					<li><button name="day" value="2023-10-11">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-11<p>
					</button></li>
					<li><button name="day" value="2023-10-12">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-12<p>
					</button></li>
					<li><button name="day" value="2023-10-13">
						<img src="./resource/Images/w-3.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-13<p>
					</button></li>
					<li><button name="day" value="2023-10-14">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-14<p>
					</button></li>
					<li><button name="day" value="2023-10-15">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-15<p>
					</button></li>
					<li><button name="day" value="2023-10-16">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-16<p>
					</button></li>
					<li><button name="day" value="2023-10-17">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-17<p>
					</button></li>
					<li><button name="day" value="2023-10-18">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-18<p>
					</button></li>
					<li><button name="day" value="2023-10-19">
						<img src="./resource/Images/w-5.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-19<p>
					</button></li>
					<li><button name="day" value="2023-10-20">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-20<p>
					</button></li>
					<li><button name="day" value="2023-10-21">
						<img src="./resource/Images/w-1.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-21<p>
					</button></li>
					<li><button name="day" value="2023-10-22">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-22<p>
					</button></li>
					<li><button name="day" value="2023-10-23">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-23<p>
					</button></li>
					<li><button name="day" value="2023-10-24">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-24<p>
					</button></li>
					<li><button name="day" value="2023-10-25">
						<img src="./resource/Images/w-2.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-25<p>
					</button></li>
					<li><button name="day" value="2023-10-26">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-26<p>
					</button></li>
					<li><button name="day" value="2023-10-27">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-27<p>
					</button></li>
					<li><button name="day" value="2023-10-28">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-28<p>
					</button></li>
					<li><button name="day" value="2023-10-29">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-29<p>
					</button></li>
					<li><button name="day" value="2023-10-30">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-30<p>
					</button></li>
					<li><button name="day" value="2023-10-31">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">10-31<p>
					</button></li>
					<li><button name="day" value="2023-11-01">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">11-01<p>
					</button></li>
					<li><button name="day" value="2023-11-02">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">11-02<p>
					</button></li>
					<li><button name="day" value="2023-11-03">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">11-03<p>
					</button></li>
					<li><button name="day" value="2023-11-04">
						<img src="./resource/Images/w-4.png" alt="날씨아이콘" class="weather_icon">
						<p class="datep">11-04<p>
					</button></li>
				</ul>
			</div>
			<span>날씨 데이터는 서울지역을 기준으로 제공돼요</span><br>
		    <input type="text" name="loc" placeholder="지역을 입력해주세요. (미입력시 전국단위)" value="${param.loc}" style="width:720px; height:50px; border-radius:15px; text-align:center;">
		    <%-- 
		    <div class="typebox">
				<div class="ctypebox"><button name="type" value="영화">영화</button></div>
				<div class="ctypebox"><button name="type" value="축제">축제</button></div>
				<div class="ctypebox"><button name="type" value="스포츠">스포츠</button></div>
				<div class="ctypebox"><button name="type" value="공연">공연</button></div>
				<div class="ctypebox"><button name="type" value="전시회">전시회</button></div>
				<div class="ctypebox"><button name="type" value="비관람">비관람</button></div>
			</div>
			--%>
		    <input type="text" name="day" value="${param.day}" style="display:none;">
		    <input type="text" name="type" value="${param.type}" style="display:none;">
		    <input style="margin-top: 20px;"type="submit" value="조회"/>
		</form>
		
		<div class="wkbtnbox">
			<button class="b81 weekbtn">8월 1주차</button>
			<button class="b82 weekbtn">8월 2주차</button>
			<button class="b83 weekbtn">8월 3주차</button>
			<button class="b84 weekbtn">8월 4주차</button>
			<button class="b85 weekbtn">8월 5주차</button>
			<button class="b91 weekbtn">9월 1주차</button>
			<button class="b92 weekbtn">9월 2주차</button>
			<button class="b93 weekbtn">9월 3주차</button>
			<button class="b94 weekbtn">9월 4주차</button>
			<button class="b95 weekbtn">9월 5주차</button>
			<button class="b101 weekbtn">10월 1주차</button>
			<button class="b102 weekbtn">10월 2주차</button>
			<button class="b103 weekbtn">10월 3주차</button>
			<button class="b104 weekbtn">10월 4주차</button>
			<button class="b105 weekbtn">10월 5주차</button>
			<button class="b111 weekbtn">11월 1주차</button>
			<button class="b112 weekbtn">11월 2주차</button>
			<button class="b113 weekbtn">11월 3주차</button>
		</div>
		
		<c:choose>
			<c:when test="${param.loc == null}">
				<c:set var="locd" value=""/>
			</c:when>
			<c:when test="${param.loc != null }">
				<c:set var="locd" value="${param.loc}"/>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${param.day == null}">
				<c:set var="dayd" value="2023-08-01"/>
			</c:when>
			<c:when test="${param.day != null }">
				<c:set var="dayd" value="${param.day}"/>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${param.type == null}">
				<c:set var="typed" value=""/>
			</c:when>
			<c:when test="${param.type != null }">
				<c:set var="typed" value="${param.type}"/>
			</c:when>
		</c:choose>
		
		<div class="typebox">
			<div class="ctypebox" onclick="scrollToSection('영화')"><button name="type" value="영화">영화</button></div>
			<div class="ctypebox" onclick="scrollToSection('축제')"><button name="type" value="축제">축제</button></div>
			<div class="ctypebox" onclick="scrollToSection('스포츠')"><button name="type" value="스포츠 경기">스포츠</button></div>
			<div class="ctypebox" onclick="scrollToSection('공연')"><button name="type" value="연극">공연</button></div>
			<div class="ctypebox" onclick="scrollToSection('전시회')"><button name="type" value="전시회">전시회</button></div>
			<div class="ctypebox" onclick="scrollToSection('비관람')"><button name="type" value="비관람">비관람</button></div>
	</div>
		
	<div id="container3">
		<div class="locbox">
		<form action="/PortfolioSample/reviewController" method="post">
			<!--  <p>${fn:length(contents)}</p> -->
			
				<div id="contents_list_box"> <!-- 컨텐츠박스 스크롤 : forEach태그 바깥에 form태그 안에 -->
					<div class="contents_name"><p>영화</p></div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '영화'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>
					<div class="contents_name">축제</div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '축제'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>
					<div class="contents_name">스포츠</div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '스포츠 경기'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_img}" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>
					<div class="contents_name">공연</div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '연극'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>
					<div class="contents_name">전시회</div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '전시회'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>
					
					<div class="contents_name">비관람</div> <!-- 박스네임 : contents_type별 -->
					<div class="contents_name_box">
						<c:forEach items="${contents}" var="s" varStatus="vs">
							<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed) && s.contents_type eq '비관람'}">
								<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0; margin-left:21.5px; margin-right:21.5px;">
							
								<div class="contents_box">
									<ul>
										<li>
											<div class="img_box">
											<img src="./resource/Images/${s.contents_img}.jpg" onerror="this.onerror=null; this.src='./resource/Images/cdimg.jpg';" width="300px" height="420px">
											</div>
										</li>
										<li>
											
											<div class="desc_box">
												<table>
													<tr>
														<td>${s.contents_name}</td>
													</tr>
													<c:if test="${s.contents_type != '비관람'}">
													<tr>
														<td>${s.contents_day1} 부터</td>
													</tr>
													<tr>
														<td>${s.contents_day2} 까지</td>
													</tr>
													</c:if>
													<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
													<tr>
														<td>별점: ${s.contents_score}</td>
													</tr>
													</c:if>
													<tr>
														<td>${s.contents_genre}        ${s.contents_rt}</td>
													</tr>
												</table>
											</div>
											
										</li>
									</ul>
								</div>
								</button>
							</c:if>
						</c:forEach>
					</div>

				</div>
			</form>
		</div>
		<%-- 
			<form action="/PortfolioSample/reviewController" method="post" style="text-align:center;">
			<!--  <p>${fn:length(contents)}</p> -->
			<c:forEach items="${contents}" var="s" varStatus="vs">
				<c:if test="${s.contents_day1 <= dayd && s.contents_day2 >= dayd && s.contents_location.contains(locd) && s.contents_type.contains(typed)}">
					<button class="ccbtn" name="contentsid" value="${s.contents_id}" style="border:none; background-color:white; padding:0;">
					<div class="contents_box">
						<ul>
							<li>
								<div class="img_box">
								<img src="./resource/Images/${s.contents_img}" alt="${s.contents_img}" width="300px" height="420px">
								</div>
							</li>
							<li>
								
								<div class="desc_box">
									<table>
										<tr>
											<td>${s.contents_name}</td>
										</tr>
										<c:if test="${s.contents_type != '비관람'}">
										<tr>
											<td>${s.contents_day1} 부터</td>
										</tr>
										<tr>
											<td>${s.contents_day2} 까지</td>
										</tr>
										</c:if>
										<c:if test="${s.contents_score > 0.0 && s.contents_score < 5.0}">
										<tr>
											<td>별점: ${s.contents_score}</td>
										</tr>
										</c:if>
										<tr>
											<td>${s.contents_genre}        ${s.contents_rt}</td>
										</tr>
									</table>
								</div>
								
							</li>
						</ul>
					</div>
					</button>
				</c:if>
			</c:forEach>
			</form>
		</div>
	</div> 
	--%>
</body>
       
<script>
	document.querySelector('.b81').addEventListener('click',function(){
		document.querySelector('.datebox2').style.transform = 'translate(-0px)';
		  currentIndex--;
		})
  
	document.querySelector('.b82').addEventListener('click',function(){
		  document.querySelector('.datebox2').style.transform = 'translate(-840px)';
		  currentIndex++;
		})
		
	document.querySelector('.b83').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-1680px)';
	  currentIndex++;
	})
	
	document.querySelector('.b84').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-2520px)';
	  currentIndex++;
	})
	
	document.querySelector('.b85').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-3360px)';
	  currentIndex++;
	})
	
	document.querySelector('.b91').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-3710px)';
	  currentIndex++;
	})
	
	document.querySelector('.b92').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-4550px)';
	  currentIndex++;
	})
	
	document.querySelector('.b93').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-5390px)';
	  currentIndex++;
	})

	document.querySelector('.b94').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-6230px)';
	  currentIndex++;
	})		
	
	document.querySelector('.b95').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-7070px)';
	  currentIndex++;
	})

	document.querySelector('.b101').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-7320px)';
	  currentIndex++;
	})	

	document.querySelector('.b102').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-8160px)';
	  currentIndex++;
	})

	document.querySelector('.b103').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-9000px)';
	  currentIndex++;
	})	
	
	document.querySelector('.b104').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-9840px)';
	  currentIndex++;
	})
	
	document.querySelector('.b105').addEventListener('click',function(){
	  document.querySelector('.datebox2').style.transform = 'translate(-10680px)';
	  currentIndex++;
	})	
	
	          //클릭된 요소의 텍스트에 해당하는 contents_name으로 스크롤 이동
          function scrollToSection(sectionName) {
            var contentsNameElements = document.querySelectorAll('.contents_name');

            for (var i = 0; i < contentsNameElements.length; i++) {
                var element = contentsNameElements[i];
                if (element.textContent === sectionName) {
                    element.scrollIntoView({ behavior: 'smooth' });
                    break;

                }
            }
          }
	
</script>


</html>