<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
       <!-- 폰트 -->
    <style>@font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
  </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resource/CSS/gg.css">
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
      </div>
         
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
<!-- 메뉴항목 -->
  <title>고객센터</title>
<body>
    <div id="menu">
        <ul>
            <li><a href="sub.do?action=gg" style="color: black;">공지사항</a></li>
            <li><a href="sub.do?action=gg1"style="color: black;">개인정보처리방침</a></li>
            <li><a href="sub.do?action=gg2"style="color: black;">이용약관</a></li>
        </ul>
    </div>


     <!--공지사항 영역-->
<div class="container"style="font-family:'Pretendard-Regular';">  
  <br>

      <!--탐색탭-->
  <ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">공지사항</button>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0"> <div class="board_box">
      <table class="pc_board">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">구분</th>
            <th scope="col">조회</th>
            <th scope="col">작성일</th>
          </tr>
        </thead>
        <tbody>
            <tr>
            <td>1</td>
            <td>&nbsp;<a href="">LGU+ 시스템 점검 공지</a></td>
            <td>관리자</td>
            <td>4</td>
            <td>2023-10-09</td>
          </tr>
            <tr>
            <td>2</td>
            <td>&nbsp;<a href="sub.do?action=gg3"> 개인정보처리방침 개정 안내 (1/16 字 시행)</a></td>
            <td>관리자</td>
            <td>5</td>
            <td>2023-10-10</td>
          </tr>
          <tr>
            <td>3</td>
            <td>&nbsp;<a href="">2023년 10월 시스템점검 안내</a></td>
            <td>관리자</td>
            <td>5</td>
            <td>2023-10-12</td>
          </tr>
          <tr>
            <td>4</td>
            <td>&nbsp;<a href="">2022년 9월 VIP 선정일자 한시적 변경 안내</a></td>
            <td>관리자</td>
            <td>5</td>
            <td>2023-10-14</td>
          </tr>
          <tr>
            <td>5</td>
            <td>&nbsp;<a href="">2023년 10월 시스템점검 안내</a></td>
            <td>관리자</td>
            <td>55</td>
            <td>2023-10-15</td>
          </tr>
          <tr>
            <td>6</td>
            <td>&nbsp;<a href="">2023년 10월 시스템점검 안내</a></td>
            <td>관리자</td>
            <td>42</td>
            <td>2023-10-17</td>
          </tr>
          <tr>
            <td>7</td>
            <td>&nbsp;<a href="">2023년 10월 시스템점검 안내</a></td>
            <td>관리자</td>
            <td>22</td>
            <td>2023-10-19</td>
          </tr>
          <tr>
            <td>8</td>
            <td>&nbsp;<a href="">2023년 10월 시스템점검 안내</a></td>
            <td>관리자</td>
            <td>15</td>
            <td>2023-10-22</td>
          </tr>
    				</tbody>
      </table>
      </div>
      </div>
      </div>
    </div>
  </div>
  
      <br>
      <br>
      <br>
      

      </body>
      </html>
