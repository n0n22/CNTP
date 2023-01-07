<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool 마이페이지</title>
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

    *>a{
    text-decoration: none;
    color: black;
    }
    button {
        font-family: 'Pretendard-Regular';
    }
    #top-ul{
        list-style: none;
        margin: 0px;
        padding: 0px;
        height: 100%;
        width: 100%;
    }
    #top-ul>li {
        float: left;
        width: 120px;
        text-align: center;
        height: 100%; /* hover기능을 위해 부모요소에 꽉차게 설정 */
        display: block;
        line-height: 100px;
        font-size: 20px;
        font-weight: bold;
    }
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 100vh; */
        padding: 80px 0px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .top-bar {
        background-color: white;
        width: 1100px;
        height: 150px;
        border-radius: 20px;
        margin: 20px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main-area{
        background-color: white;
        width: 1100px;
        /* height: 800px; */
        border-radius: 20px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        padding: 30px;
    }
    .inline-block {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .inline-block>div {
        text-align: center;
        cursor: pointer;
        display: inline-block;
        /* margin: 30px; */
        /* margin-bottom: 50px; */
        width: 130px;
        font-size: 18px;
        /* border: 1px solid palevioletred; */
    }
    #name-area {
        font-size: 25px;
    }
    #userName {
        color: rgb(63, 72, 107);
        font-weight: bold;
    }
    #click {
        color: rgb(28,154,206);
    }
    #point-text {
        font-size: 18px;
    }
    #point {
        font-size: 21px;
        font-weight: bold;
        color: rgb(63, 72, 107);
    }

    #ingido{
        font-size: 21px;
        font-weight: bold;
        color: rgb(63, 72, 107);

    }

    #title {
        margin: 50px 0px 30px 80px;
        /* height: 100px; */
        font-size: 25px;
    }
    #title-line {
        width: 950px;
        margin: auto;
    }

    .info-area {
        margin-top: 30px;
    }
    #info-form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        height: 1000px;
        margin-bottom: 30px;
        margin-top: 80px;
    }
    #info-form input {
        height: 40px;
        width: 400px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 15px;

    }
   
    .info-area button {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
        background-color: RGB(28,154,206);
        color: white;
        /* width: 200px; */
        height: 40px;
        width: 77px;
        border-radius: 5px;
        border: none;
     }
    #info-text{
        margin-bottom: 60px;
        font-size: 30px;
    }
    #info-btn {
        margin-top: 50px;
        margin-bottom: 20px;
        font-size: 20px;
        width: 200px;
        height: 50px;
    }
    .info-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    #delete-btn > a{
        float: right;
        margin-right: 20px;
        color: rgb(113, 113, 113);
        margin-top: 10px;
        margin-bottom: 30px;
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
    }

    .subText {
        padding-left: 10px;
        font-size: 13px;
        color: rgb(70, 70, 70);
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
        
    }

    #addressForm .option {
        outline: 0 none;
        
    }

    #levelForm{
        height: 40px;
        width: 200px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;

    }
</style>
</head>
<body>

	<jsp:include page="../../common/menubar_nosearch.jsp"/>

    <div class="outer">
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName">커풀</span> 님
                    <br>🤔<span>무소속</span>
                </div>
                <div>
                    <div id="point-text">포인트&nbsp;<span id="point">180</span></div>
                    <div id="ingido-text">인기도&nbsp;<span id="ingido">13</span></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a id="click" href="myPageInfo.me">회원정보</a></li>
                    <li><a href="">출석체크</a></li>
                    <li><a href="">작성글 보기</a></li>
                    <li><a href="">수영일기</a></li>
                    <li><a href="">나의팀 보기</a></li>
                    <li><a href="">소모임 보기</a></li>
                    <li><a href="">포인트 조회</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">회원 정보 관리</div>
                <div id="title-line"><hr></div>
            <div class="info-area">
                <form action="" method="post" id="info-form">

                    <input type="hidden" name="userNo" value="\">
                    
                    <div>
                        <div class="subText">아이디</div>
                        <div><input type="text" id="userId" name="userId" value="" maxlength="12" required readonly></div>
                        <!-- <td><button type="button" id="idCheck-btn">중복확인</button></td> -->
                        <label class="checkResult" id="idCheck">&nbsp;</label>
                    </div>
                                     
                    <div>
                        <div class="subText">이름</div>
                        <div><input type="text" name="userName" id="userName2" value="" maxlength="5" required readonly></div>
                        <label class="checkResult" id="nameCheck">&nbsp;</label>
                    </div>


                    <div>  
                        <!-- 닉네임 -->
                        <!-- ajax로 중복확인할것-->
                        <div class="subText">닉네임</div>
                        <div><input type="text" id="userNickName" name="" maxlength="12" value="커풀" required placeholder=""></div>
                        <label class="checkResult" id="nickNameCheck">&nbsp;</label>
                    </div>
                  

                    <div>
                        <div class="subText">휴대전화</div>
                        <div style="display: inline-block;"><input type="text" name="phone" value="" maxlength="13" required value="" oninput="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="-를 포함해서 입력해주세요"></div>
                        <!-- <div style="display: inline-block;"><input type="text" name="phone" maxlength="13" oninput="this.value=this.value.replace(/^01[016789]-\d{3,4}-\d{4}$/g,'');" placeholder="-를 포함해서 입력해주세요" style="width: 223px;"></div> -->
                        <div><label>&nbsp;</label></div>
                    </div>
					
					
                    <div>
                        <div class="subText">이메일</div>
                        <div>
                            <input type="text" name="email" value="" required style="width: 140px;"> @ 
                            <input type="text" name="emailSite" id="emailSite" value="" required style="width: 130px;" disabled>
                            <select id="emailForm" name="emailForm" onchange="emailCheck()">
                                <option value="선택하세요" >선택하세요</option>
                                <option value="직접입력" >직접입력</option>
                                <option value="naver.com" >naver.com</option>
                                <option value="hanmail.net" >hanmail.net</option>
                                <option value="daum.net" >daum.net</option>
                                <option value="nate.com" >nate.com</option>
                                <option value="gmail.com" >gmail.com</option>
                            </select>
                        </div>
                        <div><label>&nbsp;</label></div>
                    </div>
                    
                    <div>  
                        <div class="subText">생년월일</div>
                        <div><input type="text" id="birthdate" name="" maxlength="12" value="2009-09-09" required readonly></div>
                        <div><label>&nbsp;</label></div>
                    </div>

                    <div>
                        <div class="subText">활동지역</div>
                        <div>
                            <select name="address" id="addressForm">
                                <option value="시/도 선택" hidden="" disabled="disabled" selected="selected" >시/도 선택</option>
                                <option value="Seoul">서울</option>
                                <option value="Gyeonggi">경기도</option>
                                <option value="Gangwon">강원도</option>
                                <option value="Chungbuk">충청북도</option>
                                <option value="Chungnam">충청남도</option>
                                <option value="Jeonabuk">전라북도</option>
                                <option value="Jeonnam">전라남도</option>
                                <option value="Gyeongbuk">경상북도</option>
                                <option value="Gyeongnam">경상남도</option>
                            </select>
                            <input type="text" name="detailAddress" placeholder="상세 지역 (읍,면,동)" required style="width: 200px;">
                        </div>
                        <div><label>&nbsp;</label></div>
                    </div>

                    
                    <div>
                        <div class="subText">수영 등급</div>
                        <div>
                            <input type="text" name="swimLevel" value="초급" required style="width: 200px;">

                            <select name="levelForm" id="levelForm">
                                <option value="등급" hidden="" disabled="disabled" selected="selected" >등급변경</option>
                                <option value="B">초급</option>
                                <option value="M">중급</option>
                                <option value="S">고급</option>
                            </select>
                            
                        </div>
                        <div><label>&nbsp;</label></div>
                    </div>
               

					<br><br>
					<div>
						<div class="subText">개인정보 수정을 위해서는 본인 확인이 필요합니다.</div>
						<div class="subText">비밀번호를 다시 한번 입력해주세요.</div>
					</div>
					<br><br>
                    <div>
                        <div class="subText">비밀번호</div>
                        <div><input type="password" name="userPwd" id="userPwd" maxlength="15" placeholder=""></div>
                        <label class="checkResult" id="pwdCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div class="subText">비밀번호 확인</div>
                        <div><input type="password" id="userPwd2" maxlength="15"  placeholder=""></div>
                        <label class="checkResult" id="pwdCheck2">&nbsp;</label>
                    </div>

                    <div align="center">
                        <div><button type="submit" id="info-btn" style="margin-top: 0px;">수정하기</button></div>
                    </div>
                </form>
				<br><br>
                <div><hr></div>
                <div id="delete-btn"><a href="deleteForm.me">탈퇴하기</a></div>
                <div id="delete-btn"><a href="findPwdCert.me">비밀번호 변경 </a></div>
            </div>
        </div>

    </div>

    <script>
        // 비밀번호 유효성 검사
        $('#userPwd').focusout(function(){
            var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
            var $checkPwd = $('#userPwd').val();

            if($checkPwd=="") {
                // 비밀번호 입력된거 지우면 -> input태그 1,2랑 라벨 입력값 날리고, readonly로
                $('#pwdCheck').html('&nbsp;');
                $('#pwdCheck2').html('&nbsp;');
                $('#userPwd2').val('')
                $('#userPwd2').attr('disabled', true);
                $('#userPwd2').attr('placeholder', '');
            } else if(!regExp.test($checkPwd)) {
                $('#userPwd2').attr('disabled', false);
                $('#userPwd2').attr('placeholder', '비밀번호를 한번 더 입력해주세요');
                $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
                $togglePwd = 0;
            } else {
                $('#userPwd2').attr('disabled', false);
                $('#userPwd2').attr('placeholder', '비밀번호를 한번 더 입력해주세요');
            }
            // judgeBtn()
        });

        // 비밀번호 일치 검사
        $('#userPwd2').focusout(function(){
            var $checkPwd = $('#userPwd').val();
            var $checkPwd2 = $('#userPwd2').val();

            // 비밀번호 수정시에만 체크
            if($checkPwd != '') {
                $('#userPwd2').attr('disabled', false);

                if($checkPwd2=="") {
                    $('#pwdCheck2').html('필수 입력사항입니다.');
                    $('#pwdCheck2').css('color','rgb(47, 54, 82)');
                    
                } else if(!($checkPwd2==$checkPwd)) {
                    $('#pwdCheck2').html('비밀번호가 일치하지 않습니다.');
                    $('#pwdCheck2').css('color','red');
                }
            }
            // judgeBtn()
        });

        // 이름 유효성 검사
        $('#userName2').focusout(function(){
            var regExp = /^[가-힣]{2,}$/;
            var $userName = $('#userName2').val();

            if($userName=="") {
                $('#nameCheck').html('필수 입력사항입니다.');
            } else if (!regExp.test($userName)) {
                $('#nameCheck').html('이름을 다시 입력해주세요.');
            } else {
                $('#nameCheck').html('');
            }
            // judgeBtn()
        });

        // 이메일
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
                console.log($('#emailSite').val());
            }
        }
    </script>
    
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>