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
    
    
    
    
    <!--제sp 스타일 즉각반영-->

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
	
	

/*페이지넘기기 서식*/

	#pagination {
	    display: flex;
	    align-items: center;
	    justify-content: center; 
	    border : 1px solid;
	    margin : auto;
	    padding : 0px;
	}
		
	#pageNumbers {
	    display: flex;
	    margin : 0px;
	    cursor: pointer;
	    padding : 0px;
	}
	
	

	.page-link{
		height : 38px;
	}
    
    
    
    .category_select{
    	border: none; 
    	outline: none; 
    	background-color: inherit ;
    	cursor: pointer; 
    	font-weight:bold;
    
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
	
	   <!--게시판 영역-->
	<div class="container"style="font-family:'Pretendard-Regular';">  
		<br><br><br><br>	
	  <legend style="color: #3c3c3c;">게시판</legend>
	  <br>
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel"">
        <div class="carousel-inner" style="border-radius:20px;">
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
	     <!--탐색탭-->
	     <form action="postController" method="post">
	    		<button class="category_select" name="pocat" value="">전체</button> ㅣ
	    		<button class="category_select" name="pocat" value="잡담">잡담</button> ㅣ
	          	<button class="category_select" name="pocat" value="리뷰">리뷰</button> ㅣ
	          	<button class="category_select"name="pocat" value="맛집 추천">맛집 추천</button> ㅣ
	          	<button class="category_select" name="pocat" value="명소 정보">명소 정보</button> ㅣ
	          	<button class="category_select" name="pocat" value="티켓팅">티켓팅</button>
		</form>
	  <ul class="nav nav-tabs" id="myTab" role="tablist">
	    <li class="nav-item" role="presentation">
	      <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">
		      전체글
	      </button>
	    </li>
	    <li class="nav-item" role="presentation">
	      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">
	      	인기글
	      </button>
	    </li>
	  </ul>
	  <div class="tab-content" id="myTabContent">
	    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0"> <div class="board_box">
        <!-- 게시글 제목클릭시 해당 게시글로 이동시키는 주소연결 :form태그의 method post를 통해 -->
        <form action="/PortfolioSample/postController2" method="post">
        <table class="pc_board" id="postList" style="margin:0 auto;">
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
	          <tbody>
	          	
	          		<c:choose>
	          			<c:when test="${param.pocat == null}">
	          				<c:set var="pcat" value=""/>
	          			</c:when>
	          			<c:when test="${param.pocat != null}">
	          				<c:set var="pcat" value="${param.pocat}"/>
	          			</c:when>
	          		</c:choose>

				  <c:forEach items="${post}" var="p"> <!-- forEach이하의 내용이 반복처리 -->
				  <c:if test="${p.po_category.contains(pcat)}">
				  	<tr>
				  		<td class="po_id">${p.po_id}</td> <!-- 번호 -->
					    <td class="po_category">${p.po_category}</td> <!-- 카테고리 -->
			            <td class="po_title">
			            	<!-- 버튼 아닌척하는 스타일주기 -->
			            	<button name="poid" value="${p.po_id}" style="border: none; outline: none; background-color: inherit ;cursor: pointer; font-weight:bold;">
			            		${p.po_title}
			            	</button> </td> <!-- 게시글 제목 -->
			            <c:forEach items="${users}" var="uc">
			            	<c:if test="${p.user_id eq uc.user_id}">
			            		<td class="user_id">${uc.user_nickname}</td> <!-- 닉네임 -->
			            	</c:if>
			            </c:forEach>
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
	    <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
 


	    	asdf
	    
	    </div>
	    <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">123...</div>
	    <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">..6546456.</div>
	  </div>
	


	<div class="pagebox" style="width:400px; margin:auto;">
	   <ul class="pagination" >
	    <li class="page-item">
	      <a class="page-link" href="#" id="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" id="pageNumbers" style="border:none"></a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" id="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
  </div>
  <br>
  
    
  <script>
    document.addEventListener("DOMContentLoaded", function () {
    var currentPage = 1;
    var itemsPerPage = 10; // 변경 가능
    var postList = document.getElementById("postList"); // 수정이 필요한 요소
    var postItems = postList.querySelectorAll("tr"); // 수정이 필요한 요소
    var prevPageButton = document.getElementById("Previous");
    var nextPageButton = document.getElementById("Next");
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
            prevPageButton.classList.add("disabled");
        } else {
            prevPageButton.classList.remove("disabled");
        }

        if (currentPage === totalPages) {
            nextPageButton.classList.add("disabled");
        } else {
            nextPageButton.classList.remove("disabled");
        }
    }

    function updatePageNumbers() {
        var totalPages = Math.ceil(postItems.length / itemsPerPage);
        var pageNumbersHTML = "";

        for (var i = 1; i <= totalPages; i++) {
            pageNumbersHTML += '<a class="page-link pageNumber" data-page="' + i + '">' + i + '</a>';
        }

        pageNumbers.innerHTML = pageNumbersHTML;

        prevPageButton.addEventListener("click", function (event) {
            event.preventDefault();
            if (currentPage > 1) {
                currentPage--;
                updatePage();
            }
        });

        nextPageButton.addEventListener("click", function (event) {
            event.preventDefault();
            var totalPages = Math.ceil(postItems.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                updatePage();
            }
        });

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
    

    <%-- 글쓰기버튼 조건부 : 로그인여부 --%>    
    <c:choose>													
		<c:when test="${loginUser.user_id != null}">
			<div class="btn_box">
		            <a href="postController4" style="color: white;"><button style="color:white;">글쓰기</button></a>
		    </div>
		</c:when>
		<c:when test="${loginUser.user_id == null}">
			<div class="btn_box">
		            <a href="login.do" style="color: white;"><button class="login_required" style="color:white;">글쓰기</button></a>
		    </div>
		</c:when>
	</c:choose>
		
	

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