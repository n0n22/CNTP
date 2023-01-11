<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
    *>a {
        text-decoration: none;
        color: rgb(47, 54, 82);
    }
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 800px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .find-pwd-area{
        background-color: white;
		width: 450px;
		padding: 100px 50px;

		border-radius: 10px;
		box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
    }
    
    .find-pwd-area div{
        margin: 20px;
    }
    .find-pwd-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        text-align: left;
		border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
        
        
    }
    #main-text {
        font-size: 27px;
    }
    .find-pwd-area button {
        background-color: RGB(28,154,206);
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 16px;
        font-family: 'Pretendard-Regular';
    }
    .find-pwd-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
	
    #emailCert-btn {
        background-color: rgb(28,154,206);
        width: 57px;
        margin-left: 8px;
        margin-top: 0px;
        font-size: 12px;
    }
    
    #emailCert-btn:hover {
    	background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    
    #checkResult{
    	font-size : 14px;
    	color: red;
    	
    }
    
    #CertNum-btn{
     	background-color: rgb(28,154,206);
        width: 57px;
        margin-left: 8px;
        margin-top: 0px;
        font-size: 12px;
    }
    #CertNum-btn:hover{
      	background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
     
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
    <div class="outer" align="center">
        
        <div class="find-pwd-area">

            <form action="findPwdCert.me" method="post" class="find-pwd-form">
                <h1 id="main-text">비밀번호 찾기</h1>
                <div>
                    <div><input id="checkId" type="text" name="memId" placeholder="아이디를 입력해주세요"></div>
                    
                </div>
                <div>
                    <div id="emailForm">
	                     <input id="checkEmail" type="text" name="email" placeholder="등록한 이메일을 입력해주세요" style="width: 183px;">
                         <button type="button" id="emailCert-btn" onclick="emailCert();">인증 요청</button>
                         <!-- ajax로 요청시 인증번호 입력받을 수 있는 인풋태그만들것-->
                    	 <div id="checkResult"></div>
                    </div>
                </div>
                
                <div>
                	
                	<button type="submit" id="submit" disabled>본인인증</button>
               	</div>

                <div>
                    <div><a href="loginForm.me">로그인</a></div>
                    <div><a href="findIdForm.me" id="find-pwd">아이디 찾기</a></div>
                </div>
            </form>
            
            <script>
            	
            	function emailCert(){
            		
            		const $idInput = $('#checkId').val();
            		const $emailInput = $('#checkEmail').val();
            	
            		
            		if($emailInput != ''){ // 이메일 입력했다면 
            			
            			$('#checkResult').hide();
            			$('#emailCert-btn').html('재요청');	
            			
            			
            			$.ajax({
            				method : 'post',
                			url : 'findPwdCert.me', 
                			data : { checkId : $idInput,
                					 checkEmail : $emailInput },
                			success : function(result){
                				if(result == 'successEmail'){
                					$('#emailForm').append(
									'<input id="checkCertNum" type="text" name="checkCertNum" placeholder="인증번호를 입력해주세요" style="width: 183px; margin-top:8px;">'+
									'<button type="button" id="CertNum-btn" onclick="CertNum();" style="margin-left:13px;">확인</button>'+
									'<div style="font-size : 11px; color: red; margin: 5px;">남은시간 : 05:00<div>'
									);
                					
                				}
                				else {
                					$('#checkResult').show();
                					$('#checkResult').html('일치하는 회원이 없습니다');
                				}
                			},
                			error : function(){
                				console.log("실패임");
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
            		
            		if($certNum != ''){
            			
            		}
            		else {
            			console.log('입력하라로')
            			
            		}
            		
            	}
            
            </script>
        </div>
    </div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>