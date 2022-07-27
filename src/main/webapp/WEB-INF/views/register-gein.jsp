<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

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
   
   <!-- 개인 회원가입 css -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register-gein.css">
   
</head>
<body>

<%@ include file="include/header.jsp" %>
	   
	<div class="mainbox">
	
		<!-- 이곳에다가 div 생성해서 만드시면 될겁니다~~ -->
	    <div class="register-box">
	
	        <div class="top-msg">
	            *은 필수 항목입니다.
	        </div>
	
	        <div class="gein-giup">
	            <div class="gein" style=" cursor: pointer;" onclick="location.href='register_gein'">개인회원</div>
	            <div class="giup" style=" cursor: pointer;" onclick="location.href='register_giup'">기업회원</div>
	        </div>
	
	        <div class="register-input-box">
	            <br><br><br>
	            <div class="id all">
	                <p>ID *</p>
	                <input type="search" id="id" class="input-all input1-1" placeholder="영문/숫자 4~12자 조합" maxlength="12">
	                <input type="submit" id="id-check" class="input1-2" value="중복체크" style="cursor: pointer;" > 
	                <span id="span-id"></span>
	            </div>
	            <div class="pw all">
	                <p>PW *</p>
	                <input type="password" id="pw" class="input-all input1" placeholder="영문/숫자/특수문자 8~16자 조합" maxlength="16">
	                <span id="span-pw"></span>
	            </div>
	            <div class="pw-check all">
	            	<p>비밀번호 확인 *</p>
	                <input type="password" id="pw-check" class="input-all input1" placeholder="비밀번호를 입력해 주세요." maxlength="16">
	                <span id="span-pw-check"></span>
	            </div>
	            <div class="name all">
					<p>이름 *</p>
	                <input type="search" id="name" class="input-all input1" placeholder="이름을 입력해 주세요." maxlength="40">
	                <span id="span-name"></span>
	            </div>
	            <div class="e-mail all">
	                <p>이메일 *</p>
	                <input type="search" id="email1" class="input-all input2" placeholder="이메일을 입력해 주세요." maxlength="40">&nbsp;@
	                <select name="email" id="email2" class="regi-droup-down input3" >
	                    <option value="naver" selected>naver.com</option>
	                    <option value="google">gamil.com</option>
	                    <option value="daum">daum.com</option>
	                </select>
	                <input type="search" id="cer-number" class="input-all input2" placeholder="인증번호 6자리를 입력해주세요." maxlength="6">
	                <input type="submit" id="email-ok" class="email-submit-button" value="인증요청" style="cursor: pointer;" >
	                <span id="span-email"></span>
	            </div>
	            <div class="phone all">
	                <p>전화번호 *</p>
	                <select name="phone" id="phone1" class="regi-droup-down input4-1">
	                    <option value="010" selected>010</option>
	                    <option value="010" >011</option>
	                    <option value="010" >016</option>
	                </select>&nbsp;-
	                <input type="search" id="phone2" class="input-all input4-2" placeholder="전화번호 앞 4자" maxlength="4">&nbsp;-
	               	<input type="search" id="phone3" class="input-all input4-3" placeholder="전화번호 뒷 4자" maxlength="4">
	                <br><span id="span-phone"></span>
	            </div>
	            <div class="profile all">
	                <p>프로필사진</p>
	                <input type="file" name="profile_pt" id="profile" onchange="previewImage(this,'View_area')" accept="image/png, image/jpeg, image/jpg, image/gif" >
	                <div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; '></div>
	                <br><br>
	            </div>
	        </div>
	
	        <div class="regi-button">
	            <input type="submit" class="regi-button1" value="회원가입" style=" cursor: pointer;" id="btn-regist">
	            <input type="submit" class="regi-button2" value="취소" style=" cursor: pointer;" >
	        </div>
	
	    </div>

		  
<%@ include file="include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>

//파일업로드시 이미지 보여줌//////////////////////////////////////////////////////////////////////////////////////////////////////////
    function previewImage(targetObj, View_area) {
        var preview = document.getElementById(View_area); //div id
        var ua = window.navigator.userAgent;

    //ie일때(IE8 이하에서만 작동)
        if (ua.indexOf("MSIE") > -1) {
            targetObj.select();
            try {
                var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


                if (ie_preview_error) {
                    preview.removeChild(ie_preview_error); //error가 있으면 delete
                }

                var img = document.getElementById(View_area); //이미지가 뿌려질 곳

                //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
            } catch (e) {
                if (!document.getElementById("ie_preview_error_" + View_area)) {
                    var info = document.createElement("<p>");
                    info.id = "ie_preview_error_" + View_area;
                    info.innerHTML = e.name;
                    preview.insertBefore(info, null);
                }
            }
    //ie가 아닐때(크롬, 사파리, FF)
        } else {
            var files = targetObj.files;
            for ( var i = 0; i < files.length; i++) {
                var file = files[i];
                var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                if (!file.type.match(imageType))
                    continue;
                var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
                if (prevImg) {
                    preview.removeChild(prevImg);
                }
                var img = document.createElement("img"); 
                img.id = "prev_" + View_area;
                img.classList.add("obj");
                img.file = file;
                img.style.width = '150px'; 
                img.style.height = '150px';
                img.style.borderRadius = '1000px';
                img.style.margin = '10px 0px';
                preview.appendChild(img);
                if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                    var reader = new FileReader();
                    reader.onloadend = (function(aImg) {
                        return function(e) {
                            aImg.src = e.target.result;
                        };
                    })(img);
                    reader.readAsDataURL(file);
                } else { // safari is not supported FileReader
                    //alert('not supported FileReader');
                    if (!document.getElementById("sfr_preview_error_"
                            + View_area)) {
                        var info = document.createElement("p");
                        info.id = "sfr_preview_error_" + View_area;
                        info.innerHTML = "not supported FileReader";
                        preview.insertBefore(info, null);
                    }
                }
            }
        }
    }
//파일업로드시 이미지 보여줌 끝--////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//jQuery 시작///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(function() {
		
		//아이디 중복체크 클릭이벤트 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		$('#id-check').click(function() {
			const id = $('#id').val();
			
			if(id == '') {
				alert('ID를 먼저 입력해 주세요.')
				$('#span-id').text('ID를 입력하세요!');
				$('#span-id').css('color', 'red');
				return;
			} 
			
			//아이디조건: 영문+숫자 4~12 조합
			var regex = /^[A-Za-z0-9+]{4,12}$/; 
			
			//위 아이디조건 만족 시,
			if(regex.test($('#id').val())) {
				//비동기 시작
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/idCheck" />', //userController에 user/userIDCheck 만들기
					contentType: 'application/json',
					data: id,
					dataType: 'text',
					
					success: function(result) { //성공시
						if(result == 'checkSuccess') {
							$('#span-id').text('사용 가능한 아이디입니다.');
							$('#span-id').css('color', 'green');
							$('#id').css('border-color', 'green');
							$('#id').attr('readonly', true);
						} else {
							$('#span-id').text('이미 사용중인 아이디입니다.');
							$('#span-id').css('color', 'red');
							$('#user_ID').css('border-color', 'red');
						}
					},
					error: function() { //실패시
						alert('중복체크중 오류가 발생했습니다.');
						return;
					}
				});//비동기 끝
				
			} else {//불만족시,
				alert('ID를 형식에 맞게 작성해 주세요!');
				$('#span-id').text('영문 포함 4 ~ 12자 형식으로 작성해주세요.');
				$('#span-id').css('color', 'red');
				return;
			}
			
		});//아이디 중복체크 끝~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		
		//회원가입 버튼클릭 이벤트 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
		$('#btn-regist').click(function() {
			if(confirm('회원가입 하시겠습니까?')) { //'예'일 경우
				
				//ID중복체크 여부 체크 //컨트롤러가 필요하므로 나중에@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//				if(!$('#id').attr('readonly')) { //아이디 중복여부가 되지 않았을 경우
//					alert('ID를 확인해 주세요.');
//					$('#span-id').text('ID를 확인해주세요.');
//					$('#span-id').css('color', 'red');
//					return;
//				}
			
				//비밀번호 유효성 체크
				if($('#span-pw').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해 주세요!');
					$('#span-pw').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw').css('color', 'red');
					return;
				}
				
				//비밀번호 확인 체크
				if($('#pw').val() != $('#pw-check').val() ) {
					alert('비밀번호가 서로 일치하지 않습니다. ');
					$('#span-pw-check').text('비밀번호를 확인해주세요.');
					$('#span-pw-check').css('color', 'red');
					return;
				}
				
				//이름 입력 여부 체크
				if($('#name').val() == '') { //이름칸이 비어있을경우
					alert('이름은 필수 항목입니다.');
					$('#span-name').text('이름을 입력해주세요.');
					$('#span-name').css('color', 'red');
					return;
				}
				
				//이메일 여부 체크
				if($('#email1').val() == '') { //이메일칸이 비어있을경우
					alert('이메일은 필수 항목입니다.');
					$('#span-email').text('이메일을 입력해주세요.');
					$('#span-email').css('color', 'red');
				}
				
				//전화번호 유효성 체크
				if($('#span-phone').html() != '전화번호를 알맞게 입력하셨습니다.') {
					alert('전화번호를 형식에 맞게 작성해 주세요!');
					$('#span-phone').text('전화번호를 형식에 맞게 작성해주세요.');
					$('#span-phone').css('color', 'red');
					return;
				}
				
				//전화번호 입력 여부 체크1
				if($('#phone2').val() == '') {  //전화번호칸이 비어있을경우
					alert('전화번호는 필수 항목입니다.');
					$('#span-phone').text('전화번호를 입력해주세요.1');
					$('#span-phone').css('color', 'red');
					return;
				}
				
				//전화번호 입력 여부 체크2
				if($('#phone3').val() == '') {  //전화번호칸이 비어있을경우
					alert('전화번호는 필수 항목입니다.2');
					$('#span-phone').text('전화번호를 입력해주세요.');
					$('#span-phone').css('color', 'red');
					return;
				}
				
				// 필수 사항이 적절하게 들어갔다면 UserController의 userRegist 메소드로 데이터를 보낸다.
				document.registForm.submit();
				
				// 필수 사항이 적절하게 들어갔다면 사용자가 등록한 프로필 사진 정보를 저장한다. UserController의 userProfile 메소드로 데이터를 보낸다.
				if($('#profile').val() == '') { //프로필사진이 공백이면.
					const id = $('#user_ID').val();
					$.ajax({//ajax시작.
						type: 'POST',
						url: '<c:url value="/user/userProfileNO/" />' + id,
						contentType: false,
						processData: false,
						success: function(result) {
							if(result == 'NO') {
								console.log('프로필사진 없이 가입 성공');
							} else {
								alert('프로필 사진 없이 가입 중 오류가 발생했습니다!');
								return;
							}
						},
						error: function() {
							alert('프로필 사진 없이 가입 중 서버오류가 발생했습니다.');
							return;
						}
					});//ajax끝.
				} else { //프로필사진이 공백이 아니면.
					alert('프사사사사사사사ㅏㅅ');
				}
				
				
			} else { //'회원가입 하시겠습니까?'에 '아니요'를 눌렀을 경우 
				return;
			}
		});
		//회원가입 버튼클릭 이벤트 끝~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
		
		
	});
//jQuery 끝///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	// 비밀번호 형식 검사
    var PW = document.getElementById("pw");
    PW.onkeyup = function() {
    	// 영문과 숫자 조합, 8 ~ 16길이
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        // 형식에 만족한다면
        if(regex.test(document.getElementById("pw").value)) {
            document.getElementById("pw").style.borderColor = "green";
            document.getElementById("span-pw").innerHTML = "사용 가능한 비밀번호입니다.";
            document.getElementById("span-pw").style.color = "green";
        } else { // 형식에 만족하지 않는다면
            document.getElementById("pw").style.borderColor = "red";        
            document.getElementById("span-pw").innerHTML = "";
        }
    }
    
	// 전화번호 형식 검사
    var Phone2 = document.getElementById("phone2");
    Phone2.onkeyup = function() {
    	// 숫자 4자
        var regex = /^[0-9]{4}$/; 
        // 형식에 만족한다면
        if(regex.test(document.getElementById("phone2").value)) {
			
        } else { // 형식에 만족하지 않는다면
            alert('전화번호를 4자 입력하세요!');
        }
    }
    
    
    // 이름 입력 시 기존 경고 메세지 삭제
    var Name = document.getElementById("name");
    Name.onkeyup = function() {
    	document.getElementById("span-name").innerHTML = "";
    }
    
    // 비밀번호 확인란에 다시 입력 시 기존 경고 메세지 삭제
    var PWCheck = document.getElementById("pw-check");
    PWCheck.onkeyup = function() {
    	document.getElementById("span-pw-check").innerHTML = "";
    }
    
    // 이메일 확인란에 다시 입력 시 기존 경고 메세지 삭제
    var Email1 = document.getElementById("email1");
    Email1.onkeyup = function() {
    	document.getElementById("span-email").innerHTML = "";
    }
    
    // 전화번호 확인란에 다시 입력 시 기존 경고 메세지 삭제2
    var Phone2 = document.getElementById("phone2");
    Phone2.onkeyup = function() {
    	document.getElementById("span-phone").innerHTML = "";
    }
    // 전화번호 확인란에 다시 입력 시 기존 경고 메세지 삭제3
    var Phone3 = document.getElementById("phone3");
    Phone3.onkeyup = function() {
    	document.getElementById("span-phone").innerHTML = "";
    }
  	

</script>
