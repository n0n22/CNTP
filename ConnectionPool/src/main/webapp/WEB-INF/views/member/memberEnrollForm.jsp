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
                        <div><input type="text" id="userId" name="memId" maxlength="12" required placeholder="아이디를 입력해주세요"></div>
                        <label class="checkResult" id="idCheck">&nbsp;</label>
                    </div>

                    <div>
                        <!-- 비밀번호 -->
                        <div><input type="password" name="memPwd" id="userPwd" maxlength="15" required placeholder="비밀번호를 입력해주세요
                            8~15자 (영문/숫자/특수문자)"></div>
                        <label class="checkResult" id="pwdCheck">&nbsp;</label>
                    </div>

                    <div>
                        <!-- 비밀번호 확인 -->
                        <div style><input type="password" id="userPwd2" maxlength="15" required placeholder="비밀번호를 한번 더 입력해주세요"></div>
                        <label class="checkResult" id="pwdCheck2">&nbsp;</label>
                    </div>

                    <div>  
                        <!-- 닉네임 -->
                        <!-- ajax로 중복확인할것-->
                        <div><input type="text" id="userNickName" name="nickName" maxlength="12" required placeholder="닉네임 입력해주세요"></div>
                        <label class="checkResult" id="nickNameCheck">&nbsp;</label>
                    </div>
                  
                    <div>
                        <!-- 이름 -->
                        <div>
                            <input type="text" name="memName" id="userName" maxlength="5" required placeholder="이름을 입력해주세요" style="width: 293px;">
                            <select class="genderForm" name="gender">
                                <option value="성별" disabled="disabled" hidden="" selected="selected" >성별</option>
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
                        <div style="display: inline-block;"><input type="text" name="phone" maxlength="13" required oninput="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="핸드폰번호를 입력해주세요 - 포함"></div>
                        <!-- <div style="display: inline-block;"><button type="button" id="phoneCheck-btn" onclick="phoneCheck();">인증번호 발송</button></div> -->
                    </div>

                    <div>
                        <!-- 이메일 -->
                        <div>
                            <input type="text" name="email" required style="width: 140px;" placeholder="이메일을 입력해주세요"> @ 
                            <input type="text" name="emailSite" id="emailSite" required style="width: 130px;" disabled>
                            <select id="emailForm" name="emailForm" onchange="emailCheck()">
                                <option value="선택하세요" hidden="" disabled="disabled" selected="selected">선택하세요</option>
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
                        <div>
                            <input type="text" name="" placeholder="인증번호를 입력해주세요" style="width: 293px;">
                            <button type="button" id="emailCert-btn" onclick="emailCert();">인증번호 발송</button>
                        </div>
                        <div><label>&nbsp;</label></div>
                    </div>

                    <div>
                        <!-- 지역 선택 -->
                        <div>
                            <select id="addressForm" name="memArea">
                                <option value="시/도 선택" hidden="" selected="selected">시/도 선택</option>
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
                                <select class="levelForm" name="grade">
                                    <option value="등급" hidden="" disabled="disabled" selected="selected" >등급선택</option>
                                    <option value="B">초급</option>
                                    <option value="M">중급</option>
                                    <option value="S">고급</option>
                                </select>
                            </div>
                        </div>
                    </div>
                   


                    <div align="center">
                        <div><button type="submit" id="enroll-btn" onclick="checkForm();">가입하기</button></div>
                    </div>

                    <script>
                     
                        // 버튼 활성화 유무
                        function judgeBtn() {
                            // if($toggleId==1 && $togglePwd==1 && $toggleName==1) {
                            if($toggleId==1) {
                                // console.log($toggleId);
                                // 버튼 활성화
                                console.log('if문 안으로 들어옴');
                                console.log('if문: '+ $toggleId)
                                $('#enroll-btn').css('background-color', 'rgb(250,116,62)')
                                $('#enroll-btn').removeAttr('disabled');
                            } else {
                                // 버튼 비활성화
                                console.log('else문: ' + $toggleId);
                                $('#enroll-btn').css('background-color', 'rgb(250,116,62)');
                                $('#enroll-btn').attr('disabled', true);
                            }
                        };

                        function emailCheck() {
                            // console.log($('#emailForm option:selected').val());
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
                            } else {
                                $('#birthCheck').html('');
                            }
                        });

                        function checkForm() {

                        }
                    </script>
            </form>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
    

</body>
</html> 