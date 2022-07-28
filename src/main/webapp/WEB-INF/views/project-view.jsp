<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<%@ include file="include/header.jsp" %>
	   
	   
<div class="container">
  <div id="main-box">
    <div class="first-box">
      <p>(주) 성진하이텍</p>
    </div> <br>
    <div>
      <div class="project-name">
      <p>2022년 환경 푸르미 프로젝트 개발자 모집 </p>
      </div>
      <div class="project-user">
        <p>신청자 : 3명 </p>
      </div>
      <div class="project-heart">
        <button class="btn btn-like">
          <span class="btn-icon btn--icon-default">
              <span class="fa fa-heart"></span>
          </span>
          <span class="btn-icon btn--icon-liked">
              <span class="fa fa-heart"></span>
          </span>
          <span class="btn-content  btn-content--liked">
              Liked
          </span>
          <span class="btn-content btn-content--default">
              Like
          </span>
      </button>
      </div>
  </div>
  </div>
  <div class="project-img-box">
    <div class="image-intro"> 
      <img src="resources/img/main4.jpg" alt="사진">
      </div>
      <div class="project-name">
        <p>프로젝트 명</p>
      </div>
      <div class="project-name1">
        <p></p>
      </div>
    </div>
    
    
    
 
	<%@ include file="include/footer.jsp" %>
</div>   
</body>
</html>


<script>



</script>