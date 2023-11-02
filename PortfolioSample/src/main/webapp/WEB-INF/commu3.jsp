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
	  <style>
	    a {
	        text-decoration: none; /* 밑줄 제거 */
	        color:black;
	    }
	    .profile {
	        text-align: center;
	    }
	    .profile img {
	        width: 100px;
	        height: 100px;
	        border-radius: 50%;
	    }
	    .profile h2 {
	        margin: 10px 0;
	    }
	    .buttons {
	        text-align: center;
	        margin: 20px;
	    }
	    .buttons button {
	        background-color: #b30909;
	        color: #fff;
	        border: none;
	        padding: 10px 20px;
	        margin: 10px;
	        cursor: pointer;
	    }
	    .content {
	        max-width: 800px;
	        margin: 0 auto;
	        background-color: #f5f2f2;
	        padding: 20px;
	        border: 2px solid #8a8888; 
	    }
	    .content h3 {
	        margin: 20px 0;
	    }
	    .content ul {
	        list-style: none;
	        padding: 0;
	    }
	    .content li {
	        margin: 10px 0;
	        padding: 10px;
	        border: 1px solid #ccc;
	    }
	    /* 숨겨진 요소 */
	    .hidden {
	        display: none;
	    }
	    #profile-image-upload {
	        display: none;
	    }
	    .image-preview {
	        text-align: center;
	    }
	    .image-preview img {
	        max-width: 100px;
	        max-height: 100px;
	    }
	    
    	.btn_box{
			border-radius: 5px;
		    width: 100px;
		    height: 50px;
		    font-size: 20px;
		    background-color: #b30909;
		    border: none;
	
		    margin : auto;
		    padding-top : 10px;
		}
	    
	    .btn_box a{
	    	text-decoration : none;
	    }
	    
		.pc_board tr .po_id{
	    	width : 70px;
	    	text-align : center;
	    }
		    
	    .pc_board tr .po_category{
	    	width : 100px;
	    	text-align : center;
	    }
	    
	    .pc_board tr .po_title{
	    	width : 500px;
	    }
	    .pc_board tr .user_id{
	    	width : 130px;
	    	text-align : center;
	    }
	    .pc_board tr .po_rec{
	    	width : 50px;
	    	text-align : center;
	    }
	    .pc_board tr .po_count{
	    	width : 50px;
	    	text-align : center;
	    }
	    .pc_board tr .po_date{
	    	width : 200px;
	    	text-align : center;
	    }
	        
	    
	    
	    .pc_board td{
	    	height : 43px;
	    }
		    
		.board_box th {
		    background-color: #b30909;
		    color: #fff;
		    height : 35px;
		}
		
		
	    
		#pagination {
		    display: flex;
		    align-items: center;
		    justify-content: center; 
		}
		
		#prevPage,
		#nextPage {
		    padding: 5px 10px; /* 버튼의 패딩 설정 (크기 조절 가능) */
		    margin: 5px; /* 버튼 사이의 간격 설정 (조절 가능) */
		    border-top-right-radius: var(--bs-pagination-border-radius);
	    	border-bottom-right-radius: var(--bs-pagination-border-radius);
		}
		
		#pageNumbers {
		    display: flex;
		}
		
		.pageNumber {
		    padding: 5px 10px; /* 페이지 숫자 박스의 패딩 설정 (크기 조절 가능) */
		    margin: 0px; /* 페이지 숫자 박스 사이의 간격 설정 (조절 가능) */
		    border: 1px solid black; /* 페이지 숫자 박스 테두리 설정 (선택적) */
		    cursor: pointer;
		}
		
		.pageNumber:hover {
		    background-color: #f0f0f0; /* 페이지 숫자 박스에 마우스를 올렸을 때 배경색 변경 (선택적) */
		}
		    
	    
	    
	    .category_select{
	    	border: none; 
	    	outline: none; 
	    	background-color: inherit ;
	    	cursor: pointer; 
	    	font-weight:bold;
	    
	    }
	    
	    .post_box {
	    	min-width:1200px;
	    	width:1200px;
	    	border: 2px solid #b30909;
	    }
	</style>	
         
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

	   <!--게시판 영역-->
	<div class="container"style="font-family:'Pretendard-Regular'; ">  
	  <br>
	  </div>
	     <!--탐색탭-->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<h2 style="font-family:'Pretendard-Regular'; font-weight:600;">내가 쓴 글</h2>
		<br>
		<br>
		<div class="post_box">
	      <table class="pc_board" style="margin-top:10px;">
	        <thead>
	          <tr>
	            <th class="po_id" scope="col">번호</th>
	            <th class="po_category" scope="col">카테고리</th>
	            <th class="po_title" scope="col">제목</th>
	            <th class="user_id" scope="col">닉네임</th>
	            <th class="po_rec" scope="col">추천</th>
	            <th class="po_count" scope="col">조회</th>
	            <th class="po_date" scope="col">작성일</th>
	          </tr>
	        </thead>
	        </table>
	        <form action="/PortfolioSample/postController2" method="post">
	        <table class="pc_board" id="postList" style="margin-top:10px;">
	          <tbody>
			  <c:forEach items="${post}" var="p"> <!-- forEach이하의 내용이 반복처리 -->
			  <c:if test="${p.user_id == loginUser.user_id}">
			  	<tr>
			  		<td class="po_id">${p.po_id}</td> <!-- 번호 -->
				    <td class="po_category">${p.po_category}</td> <!-- 카테고리 -->
		            <td class="po_title"><button name="poid" value="${p.po_id}" style="border: none; outline: none; background-color: inherit ;cursor: pointer; font-weight:bold;">${p.po_title}</button></a></td> <!-- 게시글 제목 -->
		            <td class="user_id">${p.user_id}</td> <!-- 닉네임 -->
		            <td class="po_rec">${p.po_rec}</td> <!-- 추천수 -->
		            <td class="po_count">${p.po_count}</td> <!-- 조회-->
		            <td class="po_date">${p.po_date}</td> <!-- 작성일 -->
			  	</tr>
			  </c:if>
			  </c:forEach>
	        </tbody>
	      </table>
	      </form>
		</div>
	
	<!--페이지 넘김 버튼-->
	<div id="pagination">
	    <button id="prevPage">≪ </button>
		<div id="pageNumbers"></div>
	    <button id="nextPage"> ≫</button>
	</div><br><br>
	<script>	
		document.addEventListener("DOMContentLoaded", function () {
		    var currentPage = 1;
		    var itemsPerPage = 10;
		    var postList = document.getElementById("postList");
		    var postItems = postList.querySelectorAll("tr");
		    var prevPageButton = document.getElementById("prevPage");
		    var nextPageButton = document.getElementById("nextPage");
		    var pageNumbers = document.getElementById("pageNumbers");
		
		    function updatePage() {
		        postItems.forEach(function (item) {
		            item.style.display = "none";
		        });
		
		        var startIndex = (currentPage - 1) * itemsPerPage;
		        var endIndex = Math.min(currentPage * itemsPerPage, postItems.length);
		
		        for (var i = startIndex; i < endIndex; i++) {
		            postItems[i].style.display = "block";
		        }
		
		        updateButtonState();
		        updatePageNumbers();
		    }
		
		    function updateButtonState() {
		        var totalPages = Math.ceil(postItems.length / itemsPerPage);
		
		        if (currentPage === 1) {
		            prevPageButton.style.color = "gray";
		        } else {
		            prevPageButton.disabled = false;
		            prevPageButton.style.color = "black";
		        }
		
		        if (currentPage === totalPages) {
		            nextPageButton.disabled = true;
		            nextPageButton.style.color = "gray";
		        } else {
		            nextPageButton.disabled = false;
		            nextPageButton.style.color = "black";
		        }
		    }
		
		    function updatePageNumbers() {
		        var totalPages = Math.ceil(postItems.length / itemsPerPage);
		        var pageNumbersHTML = "";
		        for (var i = 1; i <= totalPages; i++) {
		            pageNumbersHTML += '<button class="pageNumber" data-page="' + i + '">' + i + '</button>';
		        }
		        pageNumbers.innerHTML = pageNumbersHTML;
		
		        // 이전 페이지 버튼 클릭 시
		        prevPageButton.addEventListener("click", function () {
		            if (currentPage > 1) {
		                currentPage--;
		                updatePage();
		            }
		        });
		
		        // 다음 페이지 버튼 클릭 시
		        nextPageButton.addEventListener("click", function () {
		            var totalPages = Math.ceil(postItems.length / itemsPerPage);
		            if (currentPage < totalPages) {
		                currentPage++;
		                updatePage();
		            }
		        });
		
		        // 페이지 숫자 버튼 클릭 시
		        var pageNumberButtons = document.querySelectorAll(".pageNumber");
		        pageNumberButtons.forEach(function (button) {
		            button.addEventListener("click", function () {
		                currentPage = parseInt(button.getAttribute("data-page"));
		                updatePage();
		            });
		        });
		    }
		
		    updatePage();
		});
	</script>
   
	<script>
	  document.addEventListener("DOMContentLoaded", function() {
	    // 각 링크를 가져옵니다.
	    const reviewLink = document.getElementById("review-link");
	    const foodLink = document.getElementById("food-link");
	    const activityLink = document.getElementById("activity-link");
	    const ticketingTipLink = document.getElementById("ticketing-tip-link");
	    const ticketingBuySellLink = document.getElementById("ticketing-buy-sell-link");
	  
	    // 각 링크의 클릭 이벤트를 처리합니다.
	    reviewLink.addEventListener("click", function(event) {
	      event.preventDefault();
	      // 영화리뷰 게시글을 보이도록 클래스를 추가.
	      hideAllCategories();
	      showCategory("영화리뷰");
	    });
	  
	   // 나머지 링크에 대한 클릭 이벤트 처리
	foodLink.addEventListener("click", function(event) {
	  event.preventDefault();
	  hideAllCategories();
	  showCategory("맛집");
	});
	
	activityLink.addEventListener("click", function(event) {
	  event.preventDefault();
	  hideAllCategories();
	  showCategory("놀거리정보");
	});
	
	ticketingTipLink.addEventListener("click", function(event) {
	  event.preventDefault();
	  hideAllCategories();
	  showCategory("티켓팅팁");
	});
	
	ticketingBuySellLink.addEventListener("click", function(event) {
	  event.preventDefault();
	  hideAllCategories();
	  showCategory("티켓판매 및 구매");
	});
	
	  
	    // 모든 카테고리를 숨기는 함수
	    function hideAllCategories() {
	      const categories = document.querySelectorAll(".pc_board tbody tr");
	      categories.forEach(category => {
	        category.style.display = "none";
	      });
	    }
	  
	    // 특정 카테고리를 보이도록 하는 함수
	    function showCategory(categoryName) {
	      const category = document.querySelectorAll(".pc_board tbody tr");
	      category.forEach(row => {
	        const categoryCell = row.querySelector("td:nth-child(2)"); // 카테고리 열
	        if (categoryCell.textContent.trim() === categoryName) {
	          row.style.display = "table-row";
	        }
	      });
	    }
	  });
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