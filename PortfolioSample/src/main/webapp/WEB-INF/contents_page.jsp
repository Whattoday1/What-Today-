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
    
    #graph_box table {
    	position:absolute; 
    	top:11px; 
    	left:153.28px;
    }
    
    #graph_box tr {
    	padding:5px;
    }
    
    #graph_box tr th {
    	padding:10px;
    	border-bottom: 1px solid rgba(30,30,30,10);
    }
    
    #graph_box tr td {
    	padding:5px;
    }
    
    #store_box table {
    	position:absolute; 
    	top:11px; 
    	left:65px;
    }
    
    #store_box tr {
    	padding:5px;
    }
    
    #store_box tr th {
    	width:200px;
    	padding:10px;
    	border-bottom: 1px solid rgba(30,30,30,10);
    }
    
    #store_box tr td {
    	width:300px;
    	padding:5px;
    }
    
    .wishformbox form .wishbutton {
    	border: 2px solid #b30909;
    	border-radius: 10px;
    	background-color: #b30909;
    	color: #fff;
    	font-weight: bolder;
    	margin-top: 30px;
    	width:150px;
    	height:50px;
    }
    
    .custom-footer {
	  position: absolute;
	  top:1650px;
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
	
	#movie_synop::-webkit-scrollbar {
		height: 15px;
		background-color:white;
		border-radius:15px;
		border: 0px solid #b30909;
	}
	
	#movie_synop::-webkit-scrollbar-thumb {
		background-color: #b30909;
		border-radius: 15px;
	}
    
  </style>				<!--  스타일에 변경부분 있음. -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 원래 css주소참조-->
	<link rel="stylesheet" href="./resource/CSS/index.css">
	<link rel="stylesheet" href="./resource/CSS/co2.css">
    <!--  <link rel="stylesheet" type="text/css" href="./resource/CSS/style.css"> --> 

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


      <div id = "movie_bar">

		
		<!-- 
		<script>
			window.onload = function() {
				a
				for(int i=0 ; i<1 ; i++){ 
			    	var link = document.querySelector('a[href="/PortfolioSample/reviewController"]');
			    
				    
				    if (link && !link.hasAttribute('data-clicked')) {
				        link.click();
				        link.setAttribute('data-clicked', 'true');
				    }
				}	
				
			}
		</script>
      	-->
	      	
      	
        <div id="switch"><br>																		<%-- 수정부분 --%>
          <h3>컨텐츠 상세정보</h3><br><hr><br>
          <div id="poster" style="height:430px;">
          <c:forEach items="${contents}" var="c" >
			<c:if test="${c.contents_id eq param.contentsid}">
          		<img src="./resource/Images/${c.contents_name}.jpg" onerror="this.onerror=null; this.src='./resource/Images/${c.contents_img}.jpg';" width="300px" height="420px" style="margin-top:5px"/>
          	</c:if>
			</c:forEach>
          </div>		<!-- 이미지를 contents_img에 연동 -->
          <div id="movie_right">
            <div id="movie_name">

				<c:forEach items="${contents}" var="c" >
					<c:if test="${c.contents_id eq param.contentsid}">								<!-- Contentsinfo 에서 넘어온 contentsid를 통해 컨텐츠 식별 -->
					    <c:choose>
					    	<c:when test="${fn:length(c.contents_id) >= 20 }">
					    		<p style="font-size:small;">${c.contents_name}</p>
					    	</c:when>
					    	<c:when test="${fn:length(c.contents_id) < 20 }">
					    		<p>${c.contents_name}</p>
					    	</c:when>
					    </c:choose>
            		</c:if>
				</c:forEach>
				
            </div><br>
            <div id="movie_synop" style="overflow-y:scroll;">
            	설명<br>
            	<c:forEach items="${contents}" var="c" >
					<c:if test="${c.contents_id == param.contentsid}">	<!-- Contentsinfo에서 넘어온 contentsid와 일치하는 내용을 표시 -->
					       ${c.contents_desc}
	            	</c:if>
				</c:forEach>
            	
            </div><br>
            <div id="movie_score">
            	사이트 평점<br>
            	<span class="movie_score" id="movie_score_star">
            		<c:forEach items="${contents}" var="c" >
						<c:if test="${c.contents_id eq param.contentsid}">				<!--  Contentsinfo에서 넘어온 contentsid와 일치하는 내용을 표시 -->
						    <p>
					        	<c:choose>
					        		<c:when test="${c.contents_score < 1}">
								      ☆☆☆☆☆
								    </c:when>
								    <c:when test="${c.contents_score < 2}">
								      ★☆☆☆☆
								    </c:when>
								    <c:when test="${c.contents_score < 3}">
								      ★★☆☆☆
								    </c:when>
								    <c:when test="${c.contents_score < 4}">
								      ★★★☆☆
								    </c:when>
								    <c:when test="${c.contents_score < 5}">
								      ★★★★☆
								    </c:when>
								    <c:when test="${c.contents_score == 5}">
								      ★★★★★
								    </c:when>
								    <c:otherwise>
        							  별점없음
    								</c:otherwise>
								</c:choose>
					        </p>
	            		</c:if>
					</c:forEach>
            	</span>
            	<span class="movie_score" id="movie_number">
	            	<c:forEach items="${contents}" var="c" >
						<c:if test="${c.contents_id eq param.contentsid}">		<!--  Contentsinfo에서 넘어온 contentsid와 일치하는 내용을 표시 -->
						    <p>
					        	${c.contents_score}
					        </p>
	            		</c:if>
					</c:forEach>
				</span>	
			</div><br>
            <div id="movie_line" style="overflow:hidden;">
              한줄 리뷰 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <span id="more_line" onclick="return false;">더보기 +</span>
              <br><br>
              
              <ul id="review_preview">
              	<c:forEach items="${review}" var="s" varStatus="vs">
              	<c:if test="${s.contents_id eq param.contentsid}">				<!-- 여기도 -->
              	<li>
              		<table class="review_preview_box">
              			<tr>
              				<td class="review_preview_id" style="line-height:30px;">${s.user_id}</td>
              				<td class="review_preview_score" style="line-height:30px;">
							  <c:choose>
							  	<c:when test="${s.review_score == 0}">
							      ★☆☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 1}">
							      ★☆☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 2}">
							      ★★☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 3}">
							      ★★★☆☆
							    </c:when>
							    <c:when test="${s.review_score == 4}">
							      ★★★★☆
							    </c:when>
							    <c:when test="${s.review_score == 5}">
							      ★★★★★
							    </c:when>
							  </c:choose>
							</td>
              				<td class="review_preview_contents" style="line-height:30px;"> <!-- 9글자까지만 한줄리뷰 미리보기를 표시하고 그이상 넘어가면 ..처리 -->
              					${fn:substring(s.review_contents, 0, 7)}${fn:length(qs.review_contents) > 7 ? '..' : ''}
              				</td>
              			</tr>
              		</table>
              	
              	</li>
              	</c:if>
        		</c:forEach>
              </ul>
              
              <!-- 예시 
              김이박  ★★★ &nbsp;&nbsp;&nbsp;극이 너무길고 지루해..<br><br>
              박첨지  ★★★★ &nbsp;심금을 울리는 명연기
              -->
            </div>
          </div>
          <div id="graph_box" style="margin-top:50px;">
            <c:forEach items="${viewers}" var="v">
            <c:if test="${v.contents_id eq param.contentsid}">
            <table>
				<tr>
					<th>총 관람객</th>
					<th>여성 관람객</th>
					<th>남성 관람객</th>
					<th>관람객 평균 연령</th>
				</tr>
				<tr>
					<td>${v.total_viewer} 명</td>
					<td>${v.fcount} 명</td>
					<td>${v.mcount} 명</td>
					<td>${v.ageavg} 세</td>
				</tr>
				<tr>
					<th>10대 관람객</th>
					<th>20대 관람객</th>
					<th>30대 관람객</th>
					<th>40대 이상 관람객</th>
				</tr>
				<tr>
					<td>${v.age10count} 명</td>
					<td>${v.age20count} 명</td>
					<td>${v.age30count} 명</td>
					<td>${v.over40count} 명</td>
				</tr>
			</table>
			</c:if>
			</c:forEach>
          </div>
          <div id="store_box" style="height:200px;">
	          	<table>
					<tr>
						<th>티켓 가격</th>
						<th>장소</th>
					</tr>
					<tr>
						<td>
							<c:forEach items="${contents}" var="c" >
								<c:if test="${c.contents_id eq param.contentsid}">								<!-- Contentsinfo 에서 넘어온 contentsid를 통해 컨텐츠 식별 -->
								    ${c.contents_ticket}
		            			</c:if>
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${contents}" var="c" >
								<c:if test="${c.contents_id eq param.contentsid}">								<!-- Contentsinfo 에서 넘어온 contentsid를 통해 컨텐츠 식별 -->
					    			${c.contents_location}
            					</c:if>
							</c:forEach>
						</td>
					</tr>
				</table>
          </div>
          <br>
          <div class="wishformbox">
          <c:if test="${loginUser.user_id != null}">
	          <form action="/PortfolioSample/wishController?action=insert" method="post">
	          		<input type="hidden" name="contents_id" value="${param.contentsid}">
	          		<input type="hidden" name="user_id" value="${loginUser.user_id}">
	          		<button type="submit" class="wishbutton">찜 목록에 추가</button>
	          </form>
          </c:if>
          </div>
        </div>    
      </div>
      <div id = "hidden_bar">
        <span id="exit" onclick="return false;">x</span><br>
        <h2>한줄 리뷰</h2><br><br><br>
        <div class="reviews_container">
          <!-- 입력란 : insert -->
          <h4>별점을 선택해주세요</h4><br>
          <div id="star_rating">
            <span data-rating="1">☆</span>
            <span data-rating="2">☆</span>
            <span data-rating="3">☆</span>
            <span data-rating="4">☆</span>
            <span data-rating="5">☆</span>
            <!-- 입력값 1. 별점(review_score) -->
            <!--  <input type="hidden" name="review_score" id="rating_input"> -->
          </div>
	      <h2 id="selected_rating">☆☆☆☆☆</h2><br><br>
	    	

	    	  <form method="post" action="/PortfolioSample/reviewController?action=insert" class="review_form" >
	            <input type="hidden" class="movie_sentence" name="review_id" placeholder="리뷰 일련번호">
	            <input type="hidden" class="movie_sentence" name="contents_id" value="${param.contentsid}" placeholder="컨텐츠 일련번호">
	            <input type="hidden" class="movie_sentence" name="user_id" value="${loginUser.user_id}" placeholder="유저아이디" >
	            <input type="text" class="movie_sentence" name="review_contents" placeholder="감상평을 등록해주세요">
	            <input type="hidden" class="movie_sentence_star" name="review_score" placeholder="별점입력">
	            <input type="hidden" class="movie_sentence" name="review_rec" value="0" placeholder="추천수 기본값 0 "><br>
	            <input type="hidden" class="movie_sentence" name="contentsid" value="${param.contentsid}">
	            <input type="hidden" class="movie_sentence" name="review_date" value=""><br>
	            <button type="submit" class="movie_submit">등록</button>
	          </form>
          <br><br>  
        </div>
		
		<script>
			  // 현재 날짜 가져오기 
			  var currentDate = new Date();
			
			  // 날짜를 원하는 형식으로 변환 (예: "yyyy-MM-dd")
			  var year = currentDate.getFullYear();
			  var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 포맷팅
			  var day = String(currentDate.getDate()).padStart(2, '0'); // 날짜는 두 자리로 포맷팅
			  var currentDateStr = year + '-' + month + '-' + day;
			
			  // review_date 필드에 현재 날짜 값을 입력
			  document.querySelector('input[name="review_date"]').value = currentDateStr;
		</script>
     	  

        <!-- 리뷰박스 예시  
        <!--  
        <ul class="review_total_box">
          <li>
            <table class="review_box">  
              <tr class="review_upper">
                 <td class="review_upper_id">김촌배</td>
                 <td class="review_upper_score">★★★☆☆</td>
                <td class="review_upper_date">2023.10.17</td>
                 <td class="review_upper_alert">
                 	<a href="#"> 
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	                    <img src="./resource/Images/alert_button.png">
	                </a>
                </td>
              </tr>
              <tr class="review_bottom">
                <td class="review_bottom_content" colspan="3">별로에요. 보실분들은 곡 쿠폰써서 보세요. 두줄이넘어가면 어떻게될까실험</td>
                <td class="review_bottom_rec">
                  <a href="#">
	                  <img src="./resource/Images/thumb.png">
	                  <span class="rec_score">5</span>
                  </a>
                </td>
              </tr>
            </table>
          </li>
        </ul> 
        -->
        
        
        <!-- DB에 축적된정보만큼 반복되는 ul li -->
   		<ul class="review_total_box" id="reviewList">
  			<c:forEach items="${review}" var="s" varStatus="vs"> <!-- forEach이하의 내용이 반복처리 -->
  			<c:if test="${s.contents_id eq param.contentsid}">
    			<li>
      				<table class="review_box">
        				<tr class="review_upper">
          					<td class="review_upper_id">${s.user_id}</td>
							<td class="review_upper_score">
							  <!-- ${s.review_score} 컬럼중에 하나를 생략해도 잘 표현된다.-->
							  <c:choose>
							    <c:when test="${s.review_score == 0}">
							      ☆☆☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 1}">
							      ★☆☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 2}">
							      ★★☆☆☆
							    </c:when>
							    <c:when test="${s.review_score == 3}">
							      ★★★☆☆
							    </c:when>
							    <c:when test="${s.review_score == 4}">
							      ★★★★☆
							    </c:when>
							    <c:when test="${s.review_score == 5}">
							      ★★★★★
							    </c:when>
							  </c:choose>
							</td>

				         	<td class="review_upper_date">${s.review_date}</td>
				          	<td class="review_upper_alert">
				          		<a href="#">
				           		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				           		 	<img src="./resource/Images/alert_button.png">
				           		</a> 
				          	</td>
        				</tr>
				        <tr class="review_bottom">
				          <td class="review_bottom_content" colspan="3">${s.review_contents} <!-- ${s.contents_id} ${s.review_id} --></td>
				          <td class="review_bottom_rec">
				          	<a href="#">
				            	<img src="./resource/Images/thumb.png">
				            	<span class="rec_score">${s.review_rec}</span>
				            </a>
				          </td>
				        </tr>
				    </table>
				</li>
			</c:if>
			</c:forEach>
		</ul>  	

        <!-- 페이지 넘김버튼 -->
        <div id="pagination">
		    <button id="prevPage">◀ </button>
		    <button id="nextPage"> ▶</button>
		</div>
        
        
        <script>
        	//리뷰 페이지넘김처리
	        document.addEventListener("DOMContentLoaded", function () {
	            // 페이지 정보
	            var currentPage = 1;
	            var itemsPerPage = 6; // 한 페이지에 보여질 아이템 수
	
	            // UL 요소와 리뷰 아이템들
	            var reviewList = document.getElementById("reviewList");
	            var reviewItems = reviewList.querySelectorAll("li");
	
	            // 페이지 업데이트 함수
	            function updatePage() {
	                // 모든 리뷰 아이템 숨김
	                reviewItems.forEach(function (item) {
	                    item.style.display = "none";
	                });
	
	                // 현재 페이지에 해당하는 아이템들 표시
	                var startIndex = (currentPage - 1) * itemsPerPage;
	                var endIndex = Math.min(currentPage * itemsPerPage, reviewItems.length);
	
	                for (var i = startIndex; i < endIndex; i++) {
	                    reviewItems[i].style.display = "block";
	                }
	            }
	
	            // 초기 페이지 업데이트
	            updatePage();
	
	            // 이전 페이지 버튼 클릭 시
	            document.getElementById("prevPage").addEventListener("click", function () {
	                if (currentPage > 1) {
	                    currentPage--;
	                    updatePage();
	                }
	            });
	
	            // 다음 페이지 버튼 클릭 시
	            document.getElementById("nextPage").addEventListener("click", function () {
	                var totalPages = Math.ceil(reviewItems.length / itemsPerPage);
	                if (currentPage < totalPages) {
	                    currentPage++;
	                    updatePage();
	                }
	            });
	        });
	        
	        
	        
	        //더이상 리뷰를 이전 다음으로 넘길수 없을떄 옅은회색으로 표시해줌 
	        document.addEventListener("DOMContentLoaded", function () {
	            // 페이지 정보
	            var currentPage = 1;
	            var itemsPerPage = 6; // 한 페이지에 보여질 아이템 수

	            // UL 요소와 리뷰 아이템들
	            var reviewList = document.getElementById("reviewList");
	            var reviewItems = reviewList.querySelectorAll("li");

	            // 버튼 요소
	            var prevPageButton = document.getElementById("prevPage");
	            var nextPageButton = document.getElementById("nextPage");

	            // 페이지 업데이트 함수
	            function updatePage() {
	                // 모든 리뷰 아이템 숨김
	                reviewItems.forEach(function (item) {
	                    item.style.display = "none";
	                });

	                // 현재 페이지에 해당하는 아이템들 표시
	                var startIndex = (currentPage - 1) * itemsPerPage;
	                var endIndex = Math.min(currentPage * itemsPerPage, reviewItems.length);

	                for (var i = startIndex; i < endIndex; i++) {
	                    reviewItems[i].style.display = "block";
	                }

	                // 버튼 상태 업데이트
	                updateButtonState();
	            }

	            // 버튼 상태 업데이트 함수
	            function updateButtonState() {
	                var totalPages = Math.ceil(reviewItems.length / itemsPerPage);

	                // 이전 페이지 버튼 비활성화
	                if (currentPage === 1) {
	                    prevPageButton.style.color = "gray"; // 회색으로 변경
	                } else {
	                    prevPageButton.disabled = false;
	                    prevPageButton.style.color = "black"; // 원래 색으로 변경
	                }

	                // 다음 페이지 버튼 비활성화
	                if (currentPage === totalPages) {
	                    nextPageButton.disabled = true;
	                    nextPageButton.style.color = "gray"; // 회색으로 변경
	                } else {
	                    nextPageButton.disabled = false;
	                    nextPageButton.style.color = "black"; // 원래 색으로 변경
	                }
	            }

	            // 초기 페이지 업데이트
	            updatePage();

	            // 이전 페이지 버튼 클릭 시
	            prevPageButton.addEventListener("click", function () {
	                if (currentPage > 1) {
	                    currentPage--;
	                    updatePage();
	                }
	            });

	            // 다음 페이지 버튼 클릭 시
	            nextPageButton.addEventListener("click", function () {
	                var totalPages = Math.ceil(reviewItems.length / itemsPerPage);
	                if (currentPage < totalPages) {
	                    currentPage++;
	                    updatePage();
	                }
	            });
	        });
	        
        </script>
        
        
        
        
        <!-- 
        <div class="review_box"><br>김첨지 ★★★☆☆<br><br><br>별로에요. 보실분들은 곡 쿠폰써서 보세요.</div>
        <div class="review_box"><br>박희봉 ★★★★★<br><br><br>심금을 울리는 명연기, 풍부한 사운드</div>
        <div class="review_box"></div>
        <div class="review_box"></div>
        <div class="review_box">sdf</div>
        <div class="review_box">sdf</div>
        <div class="review_box">sdf</div>
        <div class="review_box">fgg</div>
        <div class="review_box"></div>
        <div class="reviews_container"></div> -->
      </div>  
 



		
		
		
		
		
		
		
		
		
		
		
      <script>
      
      	<!--더보기 버튼, X버튼 : 히든바 활성 /비활성화 -->
      	<!--별점버튼 : 별점누른 위치만큼 별점부여(form태그 연동)-->
        const moreLine = document.getElementById('more_line');
        const hiddenBar = document.getElementById('hidden_bar');
        const movieBar = document.getElementById('movie_bar');
        const exitButton = document.getElementById('exit');
        const reviewForm = document.getElementsByClassName('review_form');
        const starRating = document.getElementById('star_rating');
        const selectedRating = document.getElementById('selected_rating');
        const movieSentence = document.getElementById('movie_sentence');
        const reviewsContainer = document.querySelector('.reviews_container');

        moreLine.addEventListener('click', function() {
          hiddenBar.style.opacity = '1';
          movieBar.style.transform = 'translateX(-698px)';
        });

        exitButton.addEventListener('click', function() {
          hiddenBar.style.opacity = '0';
          movieBar.style.transform = 'translateX(-400px)';
        });
		
        
        var rating = 0;
        
        <!--별 불들어오기-->
        starRating.addEventListener('click', function(event) {
          if (event.target.tagName === 'SPAN') {
        	//rating은 클릭한 별의위치에따라서 정수값을 부여함 (클릭x : 0 / 1~5)
            rating = parseInt(event.target.getAttribute('data-rating'));
        	//rating에 입력된 수에따라 바깥 흰별(☆☆☆☆☆)의 내용이 변함 
            selectedRating.textContent = '★'.repeat(rating) + '☆'.repeat(5 - rating);
          }
        });
        
        
        

        
        <!--
        // review_score 클릭한 별수만큼 숨겨진 input태그에 전송
        starRating.addEventListener('click', function(event) {
      	  if (event.target.tagName === 'SPAN') {
      	    const rating = parseInt(event.target.getAttribute('data-rating'));
      	    selectedRating.textContent = '★'.repeat(rating) + '☆'.repeat(5 - rating);
      	    document.getElementsByClassName('movie_sentence_star').value = rating;
      	  }
         });   
   		-->
        
	   	// 폼 제출 시 review_score 필드에 현재 rating 값을 설정
	   	for (let i = 0; i < reviewForm.length; i++) {
	   	  reviewForm[i].addEventListener('submit', function() {
	   	    document.querySelector('input[name="review_score"]').value = rating;
	   	  });
	   	}
        
        

        reviewForm.addEventListener('submit', function(event) {
          event.preventDefault();

          const rating = selectedRating.textContent;
          const reviewText = movieSentence.value;

          if (reviewText.trim() === '') {
            alert('리뷰를 작성하세요.');
            return;
          }

          

<!--          // 새 리뷰를 맨 위에 추가합니다.
          const reviewContainer = document.createElement('div');
          reviewContainer.classList.add('review_box');
          reviewContainer.innerHTML = `<br>${rating}<br><br>${reviewText}<br><br>`;
          
          // 기존 리뷰 아래에 추가합니다.
          const firstReview = reviewsContainer.querySelector('.review_box');
          if (firstReview) {
            reviewsContainer.insertBefore(reviewContainer, firstReview);
          } else {
            reviewsContainer.appendChild(reviewContainer);
          }
-->
          
          

          
          
          // 입력 필드 초기화
          movieSentence.value = '';
          selectedRating.textContent = '☆☆☆☆☆';
        });
          
      </script>
      


<br>
<br>
<br>
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