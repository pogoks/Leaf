<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- 개인 로그인의 모달창 입니다. -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
	
	<!-- 여기다가 나만의 새로운 css 만들기 -->

	<!-- 개인 회원가입 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-gein.css">

<!-- 모달 CSS -->
<style>

    /* 모달 배경 */
    .modal {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    display: none;
	    background-color: rgba(0, 0, 0, 0.4);
    }
    
    /* 모달 전체 박스 */
    .modal-box {
        margin: 100px auto;
        background-color: white;
        width: 400px;
        height: 400px;
        border-radius: 20px;
        border: 1px solid rgb(190, 190, 190);
    }
    
    /* 모달 위에 남색 박스 */
    .modal-top-box {
        background-color: rgb(20, 59, 81);
        width: 100%;
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        color: white;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        border-bottom: 1px solid rgb(190, 190, 190);
    }
    /* 모달위 텍스트 */
    .modal-top-text {
        align-items: center;
        position: relative;
        top: 10px;
        font-size: 15px;
    }
    
    /* 모달 삭제 버튼 */
    .modal-delete {
        float: right;
        top: -15px;
        right: 10px;
        position: relative;
        font-size: 10px;
    }
    /* 모달 삭제 버튼 크기 */
    svg.delete-x {
        width: 30px;
        height: auto;
    }

    .modal-delete:hover {
        background-color: rgb(24, 71, 98);
    }
    /* 모달 삭제 버튼 X박스 */
    .modal-xbox {
        background-color: none;
        width: 40px;
        height: auto;
    }

    /* 모달 내용 */
    .modal-content {
        padding: 10px;
        height: 360px;
    }

</style>
</head>
<body>
	
	    <!-- 모달창띄우는 버튼 -->
    <button class="modal-btn-open-popup">Modal 띄우기</button>

    <!-- 모달창 -->
    <div class="modal">
        
        <!-- 모달창 휜색남색 -->
        <div class="modal-box">
            
            <!-- 모달 위에 남색박스 -->
            <div class="modal-top-box">
                <div class="modal-top-text">LOGIN</div>
                <div class="modal-delete">
                    <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" fill="currentColor" class="bi bi-x-lg modal-xbox delete-x" viewBox="0 0 16 16">
                        <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                </div>
            </div>
            
            <!-- 개인 모달 내용 시작-->
            <div class="modal-content gein-content">
                
                <!-- 개인 / 기업 버튼 -->
                <!-- 
                <div class="gein-giup" style="cursor: pointer;">
                	<button id="gein-btn" style="background: red;">개인로그인</button>
                	<button id="giup-btn">기업로그인</button>
                </div>
                -->
                <div class="gein-giup" style="cursor: pointer;">
                    <div class="gein">개인회원</div>
                    <div class="giup" style="cursor: pointer;" style=" cursor: pointer;" >기업회원</div>
                </div>
                

                <!-- 아이디/비번 입력-->
                <div class="id-pw-login">
                    <input type="submit" value="로그인" class="login-btn" style=" cursor: pointer;" style="background-color: red;">
                    <input type="search" id="gein-id" class="input-id" placeholder="아이디를 입력하세요.">
                    <input type="password" id="gein-pw" class="input-pw" placeholder="비밀번호를 입력하세요.">
                </div>

                <!-- 로그인유지 체크박스 -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gein-login-go" style='zoom:1.5;' >로그인유지
                </div>

                <!--회원가입 / ID와PW 찾기-->
                <div class="register-id-pw">
                    <input type="submit" class="register-btn" value="회원가입 하러가기" style="cursor: pointer;">
                    <input type="submit" class="find-id-pw" value="ID/PW 찾기" style="cursor: pointer;">
                </div>
				
                <div style="border-bottom: 2px solid rgb(176, 176, 196); margin-right:2%; margin-left:2%"></div>

                <!-- 도움말 / 관리 -->
                
                <div class="help-manage">
                    <div class="help" style="cursor: pointer;">도움말</div>
                    <div class="manage" style="cursor: pointer;">관리</div>
                </div>
                

            </div>
            <!-- 개인모달 내용 끝 -->
            
        </div>

    </div>
	
</body>
</html>
<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.modal-btn-open-popup');
    const mdelete = document.querySelector('.modal-delete');

    btnOpenPopup.addEventListener('click', () => { /* class가 modal-btn-open-popup인 버튼을 클릭하면 이벤트가 발생한다. */
        modal.style.display = 'block'; /* 클래스가 modal의 display거 block으로 변경된다. */
    });

    mdelete.addEventListener('click', () => { /* class가 modal-delete인 버튼을 클릭하면 이벤트가 발생한다. */
        modal.style.display = 'none'; /* 클래스가 modal의 display거 hidden으로 변경된다. */
    });
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	const geinbtn = document.getElementById("gein-btn");
	const giupbtn = document.getElementById("giup-btn");
	
	giupbtn.addEventListener('click', function(event) {
		giupcon.style.display = 'block';
		geincon.style.display = 'none';
	});
	geinbtn.addEventListener('click', function(event) {
		giupcon.style.display = 'none';
		geincon.style.display = 'block';
	});
	
	
	

</script>