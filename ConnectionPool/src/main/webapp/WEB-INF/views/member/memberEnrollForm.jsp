<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    body{
        font-family: 'Pretendard-Regular';
    }

    .outer {
        background-color: rgb(244, 244, 244);
        height: 1200px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .enroll-area {
        background-color: white;

        width: 770px;
        height: 1100px;
        padding: 90px 50px;
        border-radius: 10px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .enroll-form>div {
        margin: 10px;
    }
    .enroll-form input {
        height: 40px;
        width: 400px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }
    .enroll-form button {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
        background-color: #9b9b9b;
        color: white;
        /* width: 200px; */
        height: 40px;
        width: 77px;
        border-radius: 5px;
        border: none;
        margin-top: 20px;
     }
    .enroll-form button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    #enroll-text{
        /* margin-top: 70px; */
        margin-bottom: 30px;
        font-size: 30px;
    }
    #enroll-btn {
        margin-top: 20px;
        margin-bottom: 50px;
        font-size: 20px;
        width: 300px;
        height: 50px;
    }
    .checkResult {
        height: 5px;
        font-size: 13px;
        margin-left: 10px;
        color: rgb(47, 54, 82);
    }
    #emailForm {
        font-family: 'Pretendard-Regular';
        width: 110px;
        height: 40px;
        padding: 5px;
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }
    #emailCert-btn {
        background-color: rgb(28,154,206);
        width: 100px;
        margin-left: 8px;
        margin-top: 0px;
    }

    #emailCert-btn:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
        width: 100px;
        margin-left: 8px;
        margin-top: 0px;
    }

    #birth-select-area > select {
        font-family: 'Pretendard-Regular';
        height: 40px;
        padding: 5px;
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }
    .birthdate {
        padding-left: 10px;
        font-size: 13px;
        color: RGB(117,117,117);
    }

    #addressForm {
        height: 40px;
        width: 200px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }

    #addressForm > select {
        font-size: 13px;
    }


    #addressForm .option {
        outline: 0 none;
        
    }

    .genderForm{
        font-family: 'Pretendard-Regular';
        width: 110px;
        height: 40px;
        padding: 5px;
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }

    .levelForm{
        font-family: 'Pretendard-Regular';
        width: 110px;
        height: 40px;
        padding: 5px;
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;

    }

    .swimLevel{
        padding-left: 10px;
        font-size: 13px;
        color: RGB(117,117,117);
    }
    
</style>
</head>
<body>

  	<jsp:include page="../common/menubar_nosearch.jsp"/>
  	
    <div class="outer">
        
        <div class="enroll-area">

            <h1 align="center" id="enroll-text">회원가입</h1>
    
            <form action="memberInsert.me" method="post" class="enroll-form">
                    <div>  
                        <!-- 아이디 -->
                        <!-- ajax로 중복확인할것-->
                        <div><input type="text" id="memId" name="memId" maxlength="12" required placeholder="아이디를 입력해주세요"></div>
                        <label class="checkResult" id="idCheck">&nbsp;</label>
                    </div>

                    <div>
                        <!-- 비밀번호 -->
                        <div><input type="password" name="memPwd" id="memPwd" maxlength="15" required placeholder="비밀번호를 입력해주세요
                            8~15자 (영문/숫자/특수문자)"></div>
                        <label class="checkResult" id="pwdCheck">&nbsp;</label>
                    </div>

                    <div>
                        <!-- 비밀번호 확인 -->
                        <div><input type="password" id="memPwd2" maxlength="15" required placeholder="비밀번호를 한번 더 입력해주세요"></div>
                        <label class="checkResult" id="pwdCheck2">&nbsp;</label>
                    </div>

                    <div>  
                        <!-- 닉네임 -->
                        <!-- ajax로 중복확인할것-->
                        <div><input type="text" id="memNickName" name="nickName" maxlength="12" required placeholder="닉네임 입력해주세요"></div>
                        <label class="checkResult" id="nickNameCheck">&nbsp;</label>
                    </div>
                  
                    <div>
                        <!-- 이름 -->
                        <div>
                            <input type="text" name="memName" id="memName" maxlength="5" required placeholder="이름을 입력해주세요" style="width: 293px;">
                            <select class="genderForm" name="gender" id="genderForm" required>
                                <option value="" hidden="" selected="selected" disabled>성별</option>
                                <option value="M">남자</option>
                                <option value="S">여자</option>
                            </select>
                        </div>
                        <label class="checkResult" id="nameCheck">&nbsp;</label>
                    </div>
                    
                    <div>
                        <!-- 생년월일 -->
                        <div class="birthdate">생년월일을 입력해주세요</div>
                        <div id="birth-select-area" style="margin-top: 8px;">
                            <select name="birthDay" id="year" style="width: 150px;"></select>
                            <select name="birthDay" id="month" style="width: 125px;"></select>
                            <select name="birthDay" id="day" style="width: 125px;"></select>
                        </div>
                        <div><label class="checkResult" id="birthCheck">&nbsp;</label></div>
                    </div>
                    
                    <div>
                        <!-- 휴대전화 -->
                        <div style="display: inline-block;"><input type="text" name="phone" maxlength="11" required oninput="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="핸드폰번호를 입력해주세요 - 포함"></div>
                    </div>
					
					<div>
                        <!-- 이메일 -->
                        <div>
                            <input type="text" name="email" required style="width: 140px;" placeholder="이메일을 입력해주세요"> @ 
                            <input type="text" name="emailSite" id="emailSite" required style="width: 130px;" disabled>
                            <select id="emailForm" name="emailForm" onchange="emailCheck()" >
                                <option value="" disabled hidden="" selected="selected">선택하세요</option>
                                <option value="직접입력" >직접입력</option>
                                <option value="naver.com" >naver.com</option>
                                <option value="hanmail.net" >hanmail.net</option>
                                <option value="daum.net" >daum.net</option>
                                <option value="nate.com" >nate.com</option>
                                <option value="gmail.com" >gmail.com</option>
                            </select>
                        </div>
                    </div>

                    <div>
                        <!-- 이메일 인증 -->
                        <div id="CertForm">
                            <input type="text" id="checkCertNum" name="checkCertNum" placeholder="인증번호를 입력해주세요" style="width: 293px;">
                            <button type="button" id="emailCert-btn" onclick="emailCert();">인증번호 발송</button>
                        </div>
                         <div id="checkResult" align="left" style="font-size:13px; color:red; padding: 4px 0px 0px 11px;"></div>
                    </div>

                    <div>
                        <!-- 지역 선택 -->
                        <div>
                            <select id="addressForm" name="memArea" required>
                                <option value="" hidden="" selected="selected" disabled>시/도 선택</option>
                                <option value="Seoul">서울특별시</option>
                                <option value="Gyeonggi">경기도</option>
                                <option value="Gangwon">강원도</option>
                                <option value="Chungbuk">충청북도</option>
                                <option value="Chungnam">충청남도</option>
                                <option value="Jeonbuk">전라북도</option>
                                <option value="Jeonnam">전라남도</option>
                                <option value="Gyeongbuk">경상북도</option>
                                <option value="Gyeongnam">경상남도</option>
                            </select>
                            <input type="text" name="detailArea" placeholder="활동 지역을 입력하세요(읍,면,동)" required style="width: 200px;">
                        </div>
                    </div>

                    <div>
                        <!-- 등급 -->
                        <div>
                            <div class="swimLevel">수영 실력을 선택해주세요. 팀가입과 소모임에 나타나요
                                <select class="levelForm" name="grade" id="levelForm" required>
                                    <option value="" disabled hidden="" selected="selected" >등급선택</option>
                                    <option value="B">초급</option>
                                    <option value="M">중급</option>
                                    <option value="S">고급</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div align="center">
                        <div><button type="submit" id="enroll-btn" disabled onclick="checkForm();">가입하기</button></div>
                    </div>

                    <script>
	                    
	                    var $toggleId = 0;
	                    var $togglePwd = 0;
	                    var $toggleName = 0;
	
	                    // 아이디 중복체크, 유효성 검사
	                    $('#memId').focusout(function() {
	                        var regExp = /^[a-zA-Z][a-zA-Z0-9]{4,11}$/;
	                        var $checkId = $('#memId').val();
	                                    
	                        if($checkId=="") {
	                            $('#idCheck').html('필수 입력사항입니다.');
	                            $('#idCheck').css('color','rgb(47, 54, 82)');
	                            $toggleId = 0;
	
	                        } else if(!regExp.test($checkId)) {
	                            $('#idCheck').html('5~12자의 영문과 숫자로 입력해주세요.');
	                            $('#idCheck').css('color','rgb(47, 54, 82)');
	                            $toggleId = 0;
	
	                        } else {
	                            $.ajax({
	                                url: 'idCheck.me',
	                                data: {'checkId': $checkId},
	                                type: 'get',
	                                success: function(result) {
	                                    if(result == 'unavailable'){ // 사용불가능할때
	                                        $('#idCheck').html('이미 존재하거나 탈퇴한 아이디입니다.');
	                                        $('#idCheck').css('color','red');
	                                        $toggleId = 0;
	                                    } else {
	                                        $('#idCheck').html('사용가능한 아이디입니다.');
	                                        $('#idCheck').css('color','rgb(47, 54, 82)');
	                                        $toggleId = 1;
	                                    }
	                                }
	                            })
	                        }
	                    });
	
	                    // 비밀번호 유효성 검사
	                    $('#memPwd').focusout(function(){
	                        var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
	                        var $checkPwd = $('#memPwd').val();
	
	                        if($checkPwd=="") {
	                            $('#pwdCheck').html('필수 입력사항입니다.');
	                            $togglePwd = 0;
	
	                        } else if(!regExp.test($checkPwd)) {
	                            $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
	                            $togglePwd = 0;
	                        } else {
	                            $('#pwdCheck').html('');
	                            $togglePwd = 1;
	                        }
	                    });
	
	                    // 비밀번호 일치 검사
	                    $('#memPwd2').focusout(function(){
	                        var $checkPwd = $('#memPwd').val();
	                        var $checkPwd2 = $('#memPwd2').val();
	
	                        if($checkPwd2=="") {
	                            $('#pwdCheck2').html('필수 입력사항입니다.');
	                            $('#pwdCheck2').css('color','rgb(47, 54, 82)');
	                        } else if(!($checkPwd2==$checkPwd)) {
	                            $('#pwdCheck2').html('비밀번호가 일치하지 않습니다.');
	                            $('#pwdCheck2').css('color','red');
	                        } else {
	                        	$('#pwdCheck2').css('color','rgb(47, 54, 82)');
	                            $('#pwdCheck2').html('비밀번호가 일치합니다');
	                        }
	                    });
	                    
	                    // 닉네임 중복체크
	                    $('#memNickName').focusout(function(){
	                    	var $memNickName = $('#memNickName').val();
	                    	
	                    	if($memNickName==""){
	                    		$('#nickNameCheck').html('필수 입력사항입니다.');
	                            $('#nickNameCheck').css('color','rgb(47, 54, 82)');
	                    	} else{
	                    		$.ajax({
	                    			url : 'nickNameCheck.me',
	                    			data : {'checkNickName' : $memNickName },
	                    			success : function(result){
	                    				if(result == 'unavailable'){
	                    					$('#nickNameCheck').html('이미 존재하거나 탈퇴한 닉네임 입니다.');
	                                        $('#nickNameCheck').css('color','red');
	                    				} else {
	                    					$('#nickNameCheck').html('사용가능한 닉네임입니다.');
	                                        $('#nickNameCheck').css('color','rgb(47, 54, 82)');
	                    				}
	                    				
	                    			}
	                    			
	                    		})
	                    	}
	                    });
	
	                    // 이름 유효성 검사
	                    $('#memName').focusout(function(){
	                        var regExp = /^[가-힣]{2,}$/;
	                        var $memName = $('#memName').val();
	
	                        if($memName=="") {
	                            $('#nameCheck').html('필수 입력사항입니다.');
	                            $toggleName = 0;
	                        } else if (!regExp.test($memName)) {
	                            $('#nameCheck').html('이름을 다시 입력해주세요. (한글 2~5글자)');
	                            $toggleName = 0;
	                        } else {
	                            $('#nameCheck').html('');
	                            $toggleName = 1;
	                        }
	                    });
	                     
                       	   // 버튼 활성화 유무
	                       function judgeBtn() {
	                           if($toggleId==1) {
	                               $('#enroll-btn').css('background-color', 'rgb(250,116,62)')
	                               $('#enroll-btn').removeAttr('disabled');
	                           } else {
	                               $('#enroll-btn').css('background-color', 'rgb(250,116,62)');
	                               $('#enroll-btn').attr('disabled', true);
	                           }
	                       };
	
	                       function emailCheck() {
	                           if($('#emailForm option:selected').val() == "선택하세요") {
	                               $('#emailSite').attr('disabled', true);
	                               $('#emailSite').val('');
	                           }
	
	                           if($('#emailForm option:selected').val() == "직접입력") {
	                               $('#emailSite').attr('disabled', false);
	                               $('#emailSite').val('');
	                               $('#email').focus();
	                           } else {
	                               $('#emailSite').attr('disabled', true);
	                               $('#emailSite').val($('#emailForm').val());
	                           }
	                       }; 
	
	                       // 생년월일
	                       $(document).ready(function(){            
	                           var now = new Date();
	                           var year = now.getFullYear();
	                           var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	                           var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
	                           //년도 selectbox만들기               
	                           for(var i = 1900 ; i <= year ; i++) {
	                               $('#year').append('<option value="' + i + '">' + i + '년</option>');    
	                           }
	
	                           // 월별 selectbox 만들기            
	                           for(var i=1; i <= 12; i++) {
	                               var mm = i > 9 ? i : "0"+i ;            
	                               $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
	                           }
	                           
	                           // 일별 selectbox 만들기
	                           for(var i=1; i <= 31; i++) {
	                               var dd = i > 9 ? i : "0"+i ;            
	                               $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
	                           }
	                           $("#year  > option[value="+year+"]").attr("selected", "true");        
	                           $("#month  > option[value="+mon+"]").attr("selected", "true");    
	                           $("#day  > option[value="+day+"]").attr("selected", "true");       
	
	                       });
	                       
	                       $('#year').focusout(function(){
	                           var $year = $('#year').val();
	
	                           if($year > 2009) {
	                               $('#birthCheck').html('만 14세 이상부터 가입가능합니다.');
	                               $('#birthCheck').css('color','red');
	                               $('#enroll-btn').attr('disabled', true);
	                           } else {
	                               $('#birthCheck').html('');
	                           }
	                       });
	
	                       function checkForm() {
	                    	   
                    	   
							   $gender = $('#genderForm').val();
							   $emailSite = $('#emailForm').val();
							   $area = $('#addressForm').val();
							   $level = $('#levelForm').val();
	                    	   
							   if($gender==""){
								   alert('성별을 입력해주세요.');
								   $('#genderForm').focus();
								   return false;
							   }
							   
							   if($area==""){
								   alert('지역을 입력해주세요.');
								   $('#addressForm').focus();
								   return false;
							   }
							   
							   if($level==""){
								   alert('등급을 입력해주세요.');
								   $('#levelForm').focus();
								   return false;
							   }
		                    	
	                       }  
	                       
	                   	function emailCert(){
	                   		
	                   		const $emailId = $('input[name=email]').val();
	                   		const $emailSite = $('input[name=emailSite]').val();
	                   	
	                   		
	                   		if($emailId != '' && emailSite != ''){ // 이메일 입력했다면 
	                   			
	                   			$('#checkResult').hide();
	                   			$('#emailCert-btn').html('확인');	
	                   			
	                   			
	                   			$.ajax({
	                   				method : 'post',
	                       			url : 'insertMailRequest.me', 
	                       			data : { checkId : $emailId,
	                       					 checkEmail : $emailSite },
	                       			success : function(result){
	                       				if(result == 'successEmail'){
	                       					$('#checkResult').show();
	                       					$('#checkResult').html('인증메일이 전송되었습니다');
	                       					$('#emailCert-btn').attr('onclick', 'CertNum()');       					
	                       				}
	                       				else {
	                       					$('#checkResult').show();
	                       					$('#checkResult').html('일치하는 회원이 없습니다');
	                       				}
	                       			},
	                       			error : function(){
	                       				console.log("실패");
	                       			}
	                       			
	                       		});
	                   		}
	                   		else { // 이메일을 입력안했다면
	                   			$('#checkResult').html('이메일을 입력해주세요');
	           					$('.find-pwd-form :submit').attr('disabled', true);
	                   		}
	                   		
	                   	}
	                   	
	                   	function CertNum(){
	                   		
	                   		const $certNum = $('#checkCertNum').val();
	                   		
	                   		if($certNum != ''){ // 인증번호 입력시	
	                   			$('#checkResult').hide();
	                   			$.ajax({
	                   				method : 'post',
	                   				url : 'certNum.me',
	                   				data : { certNum : $certNum },
	                   				success : function(certYN){
	                   					
	                   					if (certYN == true){ // 성공
	                   						$('#checkResult').show();
	                   						$('#checkResult').html('메일인증 완료');
	                   						$('#emailCert-btn').attr('disabled', false);
	                   						$('#enroll-btn').css('background-color', 'rgb(29, 172, 233)');
	                   						$('#enroll-btn').attr('disabled', false);
	                   					}
	                   					else{
	                   						$('#checkResult').show()
	                   						$('#checkResult').html('인증번호가 맞지않습니다');
	                   						$('#enroll-btn').attr('disabled', true);
	                   					}
	                   					
	                   				},
	                   				error : function(){
	                   					console.log('실패');
	                   				}
	                   				
	                   			})
	                   		}
	                   		else { // 인증번호 미입력시 
	                   			$('#checkResult').html('인증번호를 입력하세요');
	                   		}
	                   		
	                   	}
	                   	
	                   
	                   	
	                   
                    </script>
            </form>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
    

</body>
</html> 