<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>

   <meta charset="UTF-8">

   <title>나뭇잎 홈페이지</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-view.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
  


</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	   
<div class="container">
  
  <div id="main-box">
   
   
    <div class="first-box">
      <p>(주) 성진하이텍</p>
    </div> <br>
    <div class="container-top-icons">
      <div class="project-name">
      <p>2022년 환경 푸르미 프로젝트 개발자 모집 </p>
      </div>
      <div class="project-user">
        <p>신청자 : 3명 </p>
      </div>
      <div class="project-heart">
        <a href="#"><span href="#" class="fa fa-heart"></a>3</span>
      </div>
      <div class="project-seen">
        <p>조회수 : 12</p>
      </div>
      <div class="project-jiwon">
        <button type="button" id="jiwon-btn1" class="btn btn-success">지원하기</button>
      </div>
      <div class="mojibjung">
        <p>현재 모집중</p>
      </div>
    </div>
  </div>
  
  <form action="<c:url value='/project/projectview'/>"  method="post">
  
  <div class="project-img-box">
    <div class="image-intro"> 
      <img src="../resources/img/main4.jpg" alt="사진">
      </div> <br>
      <div class="project-myeng">
        프로젝트 명
        <input type="hidden" value="${projectview.projectNO}" name="projectNO">
      </div>
      <div class="project-myeng1">
        <p>${projectview.projectName}</p>
      </div>
      <div class="project-dt">
        프로젝트 기간
      </div>
      <div class="project-dt1">
      	<c:set var="date1" value="${projectview.projectRequireDate1}" />
      	<c:set var="date2" value="${projectview.projectRequireDate2}" />
        <p>${fn:substring(date1, 0, 10)} ~ ${fn:substring(date2, 0, 10)}</p>
      </div>
      <div class="project-friend">
       협력사 
      </div>
      <div class="project-friend1">
        <p>${projectview.companyName}</p> 
      </div>
      <div class="project-phone">
       협력사 전화번호 
      </div>
      <div class="project-phone1">
        <p>${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</p> 
      </div>
      <div class="project-fr-lo">
        협력사 위치 
      </div>
      <div class="project-fr-lo1">
        <p>${projectview.companyAddress1} ${projectview.companyAddress2} ${projectview.companyAddress3}</p> 
      </div>
      <div class="project-container-right">
        <button type="button" class="btn btn-primary" href="../project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no');">
          지도
          </button>
      </div> <br>
      
      
      
      <div class="project-int">
        프로젝트 설명 
      </div>
      <div class="project-int1">
       <p>${projectview.projectDesc}
        </p>
      </div>
        <div class="damdang-master">
          <div class="damdang">
           담당자 
          </div>
          <div class="damdang1">
            <p>${projectview.projectManager}</p> 
          </div>
          <div class="damdang-phone">
           담당자 번호 
          </div>
          <div class="damdang-phone1">
           <p>${projectview.projectManagerPhone}</p> 
          </div>
      </div>
      <div class="damdang-email">
        담당자 이메일 
      </div>
      <div class="damdang-email1">
        <p>${projectview.projectManagerEmail}</p> 
      </div>
      <div class="skills">
        지원 자격
      </div>
      <div class="skills1">
        <p>
          ${projectview.projectRequireLicense}
        </p>
      </div>
      <div class="mojib-master">
        <div class="mojib">
          모집 역할
        </div>
        <div class="mojib1">
         <p>${projectview.projectRequireRole}</p> 
        </div>
        <div class="mojib-user">
          모집 인원
        </div>
        <div class="mojib-user1">
          <p>
            ${projectview.projectRequirePeople}
          </p>
        </div>
      </div> <br>
      <div class="below-but">
      <div class="singo">
        <a href="#" id="singo-modal">신고하기</a>
      </div>
      <div class="project-container-bottom">
        <button type="button" id="jiwon-btn" class="btn btn-success">지원하기</button>
        <button type="button" id="mokrok-btn" class="btn btn-primary">목록</button>
      </div>
      </div>
    </div>

    
    </form>
    
 
	<%@ include file="../include/footer.jsp" %>
</div>


</body>
</html>
<script>
$(function() {
	$('#mokrok-btn').click(function() {
		location.href='<c:url value="/project/project" />';
	})
	
});

$(function() {
	$('#jiwon-btn').click(function() {
		location.href='<c:url value="/project/projectapply" />';
	})
	
});

$(function() {
	$('#jiwon-btn1').click(function() {
		location.href='<c:url value="/project/projectapply" />';
	})
	
});
</script> 
                 






