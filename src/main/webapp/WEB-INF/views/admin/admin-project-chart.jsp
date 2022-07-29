<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head> <!-- 관리자화면:신규프로젝트 통계 (슬라이드 64) -->

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin-project-chart.css">
   
</head>
<body>
<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
		
		<div class="admin-project-chart">
			
			<div class="box1">
				프로젝트 통계
			</div>	<br><br>
			
			
			<div class="box2">
			  	<ul class="nav nav-tabs">
			  		<li class="btn1 active"><a href="#project1" data-toggle="tab"> 프로젝트 등록 빈도 통계 </a></li>
			  		<li class="btn2"><a href="#project2" data-toggle="tab"> 기업별 프로젝트 등록 현황 </a></li> 
			  		<li class="btn3"><a href="#project3" data-toggle="tab"> 프로젝트별 지원자 현황 </a></li>
			  	</ul>
			</div>
			
			
			<!-- 내용 -->
			<div class="content-box">
			
				<div class="tab-content">
			  		<div class="tab-pane fade in active" id="project1"><!-- 1번째--------------------------------------- -->
			  			
			  			<div class="top-box">
							<span class="text1">[프로젝트 신규 등록 통계]</span>
							<select class="dropdown">
								<option value="1" selected>one</option>
								<option value="2">two</option>
								<option value="3">three</option>
							</select>
							<span class="text2">기간: &nbsp;</span>
						</div>	<br><br>
			  			
			  			<div class="content-box">
							<!-- 선 차트입니다. -->
							<div class="chart-box1">
								  <button id="change-chart">Change to Classic</button>
								  <br><br>
								  <div id="chart_div"></div>
							</div>
							<!-- 막대기 차트입니다. -->
							<div class="chart-box2">
								<div id="barchart_material" style="width: 900px; height: 500px;"></div>
							</div>
							
							<div class="table-box">
								ㅇㅇ
							</div>
						</div>
			  			
			  		</div>
			  		<div class="tab-pane fade" id="project2"><!-- 2번째--------------------------------------- -->
			  		
			  			<div class="top-box">
							<span class="text1">[기업별 프로젝트 등록 통계]</span>
							<select class="dropdown">
								<option value="1" selected>one</option>
								<option value="2">two</option>
								<option value="3">three</option>
							</select>
							<span class="text2">기간: &nbsp;</span>
						</div>	<br><br>
						
						<div class="content-box">
							ㅇ
						</div>
			  			
			  		</div>
			  		<div class="tab-pane fade" id="project3"><!-- 3번째--------------------------------------- -->
			  		
			  			<div class="top-box">
							<span class="text1">[프로젝트 별 지원자 현황 통계]</span>
							<select class="dropdown">
								<option value="1" selected>one</option>
								<option value="2">two</option>
								<option value="3">three</option>
							</select>
							<span class="text2">기간: &nbsp;</span>
						</div>	<br>
						
						<div class="content-box">
							<div class="applicant">
								<div class="appli1">
									<div class="day">2022-07-28</div>
									<div class="top-text" style="color:#3A62BA;">일일 프로젝트 지원 수</div>
									<div class="count">17명</div>
								</div>
								<div class="appli3">
									막대차트
									<div id="chart_div"></div>
								</div>
								<div class="appli2">
									<div class="day">2022-07-28</div>
									<div class="top-text" style="color:#39721B;">총 프로젝트 지원 수</div>
									<div class="count">17명</div>
								</div>
							</div>
							<table border="0">
								<tr>
									<th>ㅇ</th>
								</tr>
								<tr>
									<td>ㄹ</td>
								</tr>
							</table>
						</div>
			  			
			  		</div>
			  	</div>
			  	
			</div>
			<!-- 내용 -->
			
			
		</div>
		  
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>

<!-- project3 막대기차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
		var data = new google.visualization.DataTable();
		data.addColumn('timeofday', 'Time of Day');
		data.addColumn('number', 'Motivation Level');
		data.addColumn('number', 'Energy Level');
		
		data.addRows([
		  [{v: [8, 0, 0], f: '8 am'}, 1, .25],
		  [{v: [9, 0, 0], f: '9 am'}, 2, .5],
		  [{v: [10, 0, 0], f:'10 am'}, 3, 1],
		  [{v: [11, 0, 0], f: '11 am'}, 4, 2.25],
		  [{v: [12, 0, 0], f: '12 pm'}, 5, 2.25],
		  [{v: [13, 0, 0], f: '1 pm'}, 6, 3],
		  [{v: [14, 0, 0], f: '2 pm'}, 7, 4],
		  [{v: [15, 0, 0], f: '3 pm'}, 8, 5.25],
		  [{v: [16, 0, 0], f: '4 pm'}, 9, 7.5],
		  [{v: [17, 0, 0], f: '5 pm'}, 10, 10],
		]);
		
		var options = {
		  title: 'Motivation and Energy Level Throughout the Day',
		  hAxis: {
		    title: 'Time of Day',
		    format: 'h:mm a',
		    viewWindow: {
		      min: [7, 30, 0],
		      max: [17, 30, 0]
		    }
		  },
		  vAxis: {
		    title: 'Rating (scale of 1-10)'
		  }
		};
		
		var chart = new google.visualization.ColumnChart(
		  document.getElementById('chart_div'));
		
		chart.draw(data, options);
	}
</script>

<!-- 선 차트 -->
<script>
	google.charts.load('current', {'packages':['line', 'corechart']});
	google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var button = document.getElementById('change-chart');
      var chartDiv = document.getElementById('chart_div');

      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "오른쪽빨강");
      data.addColumn('number', "오른쪽파랑");

      data.addRows([
        [new Date(2014, 0),  -.5,  5.7],
        [new Date(2014, 1),   .4,  8.7],
        [new Date(2014, 2),   .5,   12],
        [new Date(2014, 3),  2.9, 15.3],
        [new Date(2014, 4),  6.3, 18.6],
        [new Date(2014, 5),    9, 10.9],
        [new Date(2014, 6), 10.6, 19.8],
        [new Date(2014, 7), 10.3, 16.6],
        [new Date(2014, 8),  7.4, 13.3],
        [new Date(2014, 9),  4.4,  9.9],
        [new Date(2014, 10), 1.1,  6.6],
        [new Date(2014, 11), -.2,  4.5]
      ]);

      var materialOptions = {
        chart: {
          title: 'Average Temperatures and Daylight in Iceland Throughout the Year'
        },
        width: 600, /*크기조정: 원래는 900x500*/
        height: 500,
        series: {
          // Gives each series an axis name that matches the Y-axis below.
          0: {axis: 'Temps'},
          1: {axis: 'Daylight'}
        },
        axes: {
          // Adds labels to each axis; they don't have to match the axis names.
          y: {
            Temps: {label: 'Temps (Celsius)'},
            Daylight: {label: 'Daylight'}
          }
        }
      };

      var classicOptions = {
        title: 'Average Temperatures and Daylight in Iceland Throughout the Year',
        width: 600,
        height: 500,
        // Gives each series an axis that matches the vAxes number below.
        series: {
          0: {targetAxisIndex: 0},
          1: {targetAxisIndex: 1}
        },
        vAxes: {
          // Adds titles to each axis.
          0: {title: 'Temps (Celsius)'},
          1: {title: 'Daylight'}
        },
        hAxis: {
          ticks: [new Date(2014, 0), new Date(2014, 1), new Date(2014, 2), new Date(2014, 3),
                  new Date(2014, 4),  new Date(2014, 5), new Date(2014, 6), new Date(2014, 7),
                  new Date(2014, 8), new Date(2014, 9), new Date(2014, 10), new Date(2014, 11)
                 ]
        },
        vAxis: {
          viewWindow: {
            max: 30
          }
        }
      };

      function drawMaterialChart() {
        var materialChart = new google.charts.Line(chartDiv);
        materialChart.draw(data, materialOptions);
        button.innerText = 'Change to Classic';
        button.onclick = drawClassicChart;
      }

      function drawClassicChart() {
        var classicChart = new google.visualization.LineChart(chartDiv);
        classicChart.draw(data, classicOptions);
        button.innerText = 'Change to Material';
        button.onclick = drawMaterialChart;
      }

      drawMaterialChart();

    }
</script>


<!-- 막대기 차트 -->
<script>
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Year', 'Sales', 'Expenses', 'Profit'],
      ['2014', 1000, 400, 200],
      ['2015', 1170, 460, 250],
      ['2016', 660, 1120, 300],
      ['2017', 1030, 540, 350]
    ]);

    var options = {
      width: 500,
      height: 500,
      chart: {
        title: 'Company Performance',
        subtitle: 'Sales, Expenses, and Profit: 2014-2017',
      },
      bars: 'horizontal' // Required for Material Bar Charts.
    };

    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
  }
</script>
