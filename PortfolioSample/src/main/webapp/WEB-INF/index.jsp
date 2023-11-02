<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
       <!-- 폰트 -->
    <style>@font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
 
    .section-boxx a{
      text-decoration: none; /* 밑줄 제거 */
        color: #1d237a; /* 글씨색을 검정색으로 설정 */
    }
 

  </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resource/CSS/index.css">
    <title>오늘 뭐하지?</title>
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
       <!-- 슬라이드쇼 영역 -->
       <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="./resource/Images/im1.webp" class="d-block w-100" alt="포스터1">
          </div>
          <div class="carousel-item">
            <img src="./resource/Images/im2.webp" class="d-block w-100" alt="포스터2">
          </div>
          <div class="carousel-item">
            <img src="./resource/Images/im3.webp" class="d-block w-100" alt="포스터3">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <br>
      <br>
      <div class="contain" >
        <h4>
        <img src="./resource/Images/star2.png" alt="대체 텍스트" style="width: 45px; height: 45px;">
          <b style="color: #3c3c3c;">&nbsp;오늘뭐하지? PLAY&nbsp;
            <img src="./resource/Images/star2.png" alt="수정 아이콘" style="width: 45px; height: 45px;">
          </b>
        </h4>
      <br>
      <div class="content-section">
        <figure class="snip1273">
          <img src="./resource/Images/cc1.png" alt="영화" />
          <figcaption>
            <h3 style="font-family:'Pretendard-Regular';">영화</h3>
          </figcaption>
          <a href="contentsController?type=영화"></a>
        </figure>
      
        <figure class="snip1273">
          <img src="./resource/Images/ccc2.png" alt="전시회" />
          <figcaption>
            <h3 style="font-family:'Pretendard-Regular';">전시회</h3>
          </figcaption>
          <a href="contentsController?type=전시회"></a>
        </figure>
      
        <figure class="snip1273">
          <img src="./resource/Images/cc3.png" alt="공연" />
          <figcaption>
            <h3 style="font-family:'Pretendard-Regular';">공연</h3>
          </figcaption>
          <a href="contentsController?type=공연"></a>
        </figure>
      
        <figure class="snip1273">
          <img src="./resource/Images/cc4.png" alt="스포츠 경기" />
          <figcaption>
            <h3 style="font-family:'Pretendard-Regular';">스포츠 경기</h3>
          </figcaption>
          <a href="contentsController?type=스포츠 경기"></a>
        </figure>
        <figure class="snip1273">
          <img src="./resource/Images/cc5.png" alt="공연" />
          <figcaption>
            <h3 style="font-family:'Pretendard-Regular';">공연</h3>
          </figcaption>
          <a href="contentsController?type=공연"></a>
        </figure>
     </div>
  
    <div class="section-box">
        <!-- 게시글 아이템들 -->
    <section class="content">
      <h4><b style="color: #3c3c3c;">오늘의 TALK&nbsp;
        <img src="./resource/Images/qq.png" alt="수정 아이콘" style="width: 30px; height: 30px;">
    </b></h4>
      <br>
        <div class="event-section">
            <div class="event-items1" style="background-color: #faf1dd; border:2px solid #ffc341; border-radius: 10px; color: rgb(0, 0, 0); width: 650px; " >
              <table class="pc_board">
                <br>
              <thead>
                <tr>
                	<th>번호</th>
                	<th>제목</th>
                	<th>작성자</th>
                	<th>추천수</th>
                	<th>조회수</th>
                	<th>작성일</th>
                </tr>
              </thead>
              
              <tbody>
              
              <c:forEach items="${post}" var="s" varStatus="vs">
              <c:if test="${vs.index<=5}">

                <tr>
                    <td>${s.po_id}</td> <!-- 번호 -->
                    <td>&nbsp;<a href="postController2?poid=${s.po_id}">${fn:substring(s.po_title, 0, 14)}${fn:length(s.po_title) > 14 ? '..' : ''}</a></td> <!-- 게시글 제목 -->
   			            <c:forEach items="${users}" var="uc">
			            	<c:if test="${s.user_id eq uc.user_id}">
			            		<td class="user_id" style="text-align:center;">${uc.user_nickname}</td> <!-- 닉네임 -->
			            	</c:if>
			            </c:forEach>
                    <td>${s.po_rec}</td> <!-- 추천수 -->
                    <td>${s.po_count}</td> <!-- 조회 -->
                    <td>${s.po_date}</td> <!-- 작성일 -->
                </tr>
               </c:if>
               </c:forEach>
            </tbody>
          </table>
    </section>


        <!-- 비관람 컨텐츠 슬라이드쇼 -->
        <div id="carouselExampleIndicators" class="carousel slide">
            <h4><b style="color: #3c3c3c;">이건어때?&nbsp;
              
              <img src="./resource/Images/q.png" alt="수정 아이콘" style="width: 30px; height: 30px;">
            <br>
            <br>
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                    class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./resource/Images/game.png" class="d-block w-100" alt="보드게임">
                </div>
                <div class="carousel-item">
                    <img src="./resource/Images/HBC.jpg" class="d-block w-100" alt="방탈출">
                </div>
                <div class="carousel-item">
                    <img src="./resource/Images/FC.jpg" class="d-block w-100" alt="만화카페">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
            </div>
            <br>
            <br>
            <br>
</div>

   <div class="content-container">
    
       <!-- 추천 아이템들 -->
    <section class="content2">
      <div class="cc">
        <h4><b style="color: #3c3c3c;">MD Pick! 추천&nbsp;
          <img src="./resource/Images/c.png" alt="수정 아이콘" style="width: 25px; height: 25px;">
      </b></h4>
        
        <p>
          <a href="#" id="review-link" class="category-link" data-category="영화" style="text-decoration: none; color: #3c3c3c;">영화</a> | 
          <a href="#" id="food-link" class="category-link" data-category="전시회" style="text-decoration: none; color: #3c3c3c;">전시회</a> | 
          <a href="#" id="activity-link" class="category-link" data-category="뮤지컬" style="text-decoration: none; color: #3c3c3c;">뮤지컬</a> | 
          <a href="#" id="ticketing-tip-link" class="category-link" data-category="운동경기" style="text-decoration: none; color: #3c3c3c;">운동경기</a> | 
          <a href="#" id="ticketing-buy-sell-link" class="category-link" data-category="연극" style="text-decoration: none; color: #3c3c3c;">연극</a>
      </p>  
      <img id="category-image" src="./resource/Images/r1.PNG" alt="추천">
    </div>
  </section>
      <!-- 공지사항 컨텐츠-->
      <div class="section-box4">
        <h4><b style="color: #3c3c3c;">공지사항&nbsp;
          <img src="./resource/Images/pep.png" alt="수정 아이콘" style="width: 23px; height: 23px;">
      </b></h4>

        <br>
        <div class="event-items2" style="background-color: #fdf1e5; border:2px solid #cf3333; border-radius: 10px; color: rgb(0, 0, 0);" >
        <table class="gg"  >
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
        </tbody>
      </table>
    </div>
  </section>
</div>
</div>
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
  document.addEventListener("DOMContentLoaded", function() {
    const categoryLinks = document.querySelectorAll(".category-link");
    const categoryImage = document.getElementById("category-image");

    categoryLinks.forEach(link => {
        link.addEventListener("click", function(event) {
            event.preventDefault(); // 기본 링크 동작 방지

            const category = link.getAttribute("data-category");
            // 카테고리에 따라 이미지를 변경
            if (category === "영화") {
                categoryImage.src = "./resource/Images/r1.PNG";; // 영화에 해당하는 이미지 경로로 변경
            } else if (category === "전시회") {
                categoryImage.src = "./resource/Images/r2.PNG"; // 전시회에 해당하는 이미지 경로로 변경
            } else if (category === "뮤지컬") {
                categoryImage.src = "./resource/Images/r3.PNG"; // 뮤지컬에 해당하는 이미지 경로로 변경
            } else if (category === "운동경기") {
                categoryImage.src = "./resource/Images/r4.PNG"; // 운동경기에 해당하는 이미지 경로로 변경
            } else if (category === "연극") {
                categoryImage.src = "./resource/Images/r5.PNG"; // 연극에 해당하는 이미지 경로로 변경
            }
        });
    });
});

</script>
  </body>
  </html>

