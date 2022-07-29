<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head> <!-- 관리자화면:개발자 통계 (슬라이드) -->
<meta charset="UTF-8">
<title>오신것을 환영합니다</title>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
	
	<!-- 여기다가 나만의 새로운 css 만들기 -->
	
	<!-- 관리자:프로젝트 통계 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin-giup-chart.css">
   
</head>
<body>
<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
		
		<div class="admin-project-chart">
			
			<div class="box1">
				개발자 통계
			</div>	<br><br>
			
			
			<div class="box2">
			  	<ul class="nav nav-tabs">
			  		<li class="btn1 active"><a href="#project1" data-toggle="tab"> 기업 신규가입/탈퇴 현황 </a></li>
			  		<li class="btn2"><a href="#project2" data-toggle="tab"> 개발자 및 프로젝트 지원 수 통계 </a></li>
			  	</ul>
			</div>
			
			
			<!-- 내용 -->
			<div class="content-box">
			
				<div class="tab-content">
			  		<div class="tab-pane fade in active" id="project1"><!-- 1번째--------------------------------------- -->
			  			
			  			<div class="top-box">
							<span class="text1">[기업 가입/탈퇴 현황 통계]</span>
							<select class="dropdown">
								<option value="1" selected>10명씩</option>
								<option value="2">20명씩</option>
							</select>
							<span class="text2">기간: &nbsp;</span>
						</div>	<br>
			  			
			  			<div class="chart-box">
							<canvas id="line-chart" width="200" height="150"></canvas> <!-- 꺾은선 -->
						</div>
						
						<div class="right-box">
							<div class="in">
								<div class="day">2022-07-28</div>
								<div class="top-text" style="color:#3A62BA;">오늘 가입자 수</div>
								<div class="count">7명</div>
								<div class="bef">전일대비 <span style="color:#3A62BA;">▲3</span>명</div>
							</div>
							<div class="total-in">
								<div class="day">2022-01-01 ~ 2022-07-28</div>
								<div class="top-text" style="color:#3A62BA;">총 가입자 수</div>
								<div class="count">504명</div>
								<div class="bef">전일대비 <span style="color:#3A62BA;">▲7</span>명</div>
							</div>
							<hr><br><br><br><br><br><br><br><br>
							<div class="out">
								<div class="day">2022-07-28</div>
								<div class="top-text" style="color: #BB2F2C;">오늘 탈퇴자 수</div>
								<div class="count">1명</div>
								<div class="bef">전일대비 <span style="color:#BB2F2C;">▼1</span>명</div>
							</div>
							<div class="total-out">
								<div class="day">2022-01-01 ~ 2022-07-28</div>
								<div class="top-text" style="color:#BB2F2C;">총 탈퇴자 수</div>
								<div class="count">29명</div>
								<div class="bef">전일대비 <span style="color:#BB2F2C;">▲1</span>명</div>
							</div>
						</div>
						
						<div style="margin: 550px 5% 0px 5%;"><!-- 전체 테이블 margin -->
						<div class="table-box1">
							<label>2022-01-5</label>
							<table border="0" class="table">
								<tr>
									<th rowspan="1">2022</th>
									<th colspan="2">가입자</th>
									<th colspan="2">탈퇴자</th>
									<th rowspan="2">일일가입자-일일탈퇴자</th>
									<th rowspan="2">누적가입자-누적탈퇴자</th>
								</tr>
								<tr>
									<th></th>
									<th>일일</th>
									<th>누적</th>
									<th>일일</th>
									<th>누적</th>
								</tr>
								<c:forEach var="i" begin="1" end="31">
									<tr>
										<td>01/${i}</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
								</c:forEach>
							</table>
						</div> <br>
						
						<div class="table-box2">
							<label>2022년 기업 월간 가입/탈퇴 수</label>
							<table border="0" class="table">
								<tr>
									<th>2022년</th>
									<c:forEach var="i" begin="1" end="12"> <th>${i}월</th> </c:forEach>
								</tr>
								<tr>
									<th>가입자</th>
									<c:forEach var="i" begin="1" end="12"> <td>0</td> </c:forEach>
								</tr>
								<tr>
									<th>탈퇴자</th>
									<c:forEach var="i" begin="1" end="12"> <td>0</td> </c:forEach>
								</tr>
								<tr>
									<th>총 회원 수</th>
									<c:forEach var="i" begin="1" end="12"> <td>0명</td> </c:forEach>
								</tr>
							</table>
						</div> <br>
			  			
			  			<div class="table-box3">
			  				<label>년도별 기업 회원 수</label>
			  				<table border="0" class="table">
			  					<tr>
			  						<th></th>
			  						<th>총 개발자(개인) 회원</th>
			  					</tr>
			  					<tr>
			  						<th>2022</th>
			  						<td>100</td>
			  					</tr>
			  				</table>
			  			</div>
			  			</div><!-- 전체 테이블 margin -->
			  			
			  		</div>
			  		<div class="tab-pane fade" id="project2"><!-- 3번째--------------------------------------- -->
			  		
			  			<div class="top-box">
							<span class="text1">[기업 별 프로젝트 지원 현황 통계]</span>
							<select class="dropdown">
								<option value="1" selected>one</option>
								<option value="2">two</option>
								<option value="3">three</option>
							</select>
							<span class="text2">기간: &nbsp;</span>
						</div>	<br><br>
			  			
			  		</div>
			  	</div>
			  	
			</div>
			<!-- 내용 -->
			
			
		</div>
		  
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>

<!-- 이상한 꺾 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
new Chart(document.getElementById("line-chart"), {
	width: 1300, /*크기조정: 원래는 900x500*/
	height: 300,
	type: 'line',
	data: {
	    labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 ,25, 26, 27, 28, 29, 30, 31],
	    datasets: [{ 
	        data: [5,2,3,7,5,4,8,6,7,8,5,2,3,7,5,12,8,6,7,8,5,2,3,7,5,4,8,6,7,8,2],
	        label: "가입자 수",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
			data: [1,4,2,3,1,0,2,0,0,1,1,2,2,3,1,0,2,0,0,1,0,1,1,0,2,0,1,0,2,0,1],
			label: "탈퇴자수",
			borderColor: "#c45850",
			fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '2022년 n월 n일'
	    }
	  }
	});
</script>


