<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	body{

	background-color: #eee;
	}
	
	.project{
		font-size: 18px;
	}
	
	.totals{
	
		font-size: 10px;
	}
	
	.fs-10{
	
		font-size: 10px;
	}
	
	.content{
	
		font-size: 13px;
	}
	
	.alpha{
	
		padding:6px;
	    font-size: 10px;
		
		border-radius: 50%;
		height: 10px;
		width: 10px;
	}
	
	.alpha-red{
	    
	    color:#D50000;
	    background-color: #EF9A9A;
	    border: 1px solid #EF9A9A;
	
	}
	
	.alpha-green{
	    
	    color:#4A148C;
	    background-color: #E1BEE7;
	    border: 1px solid #E1BEE7;
	
	}

    /* 배틀 모달 스타일 */
    .message-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1000;

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
    }

    .message-show {
        opacity: 1;
        z-index: 1000;
        transition: all 0.5s;
    }

    .message-window {
        position: relative;
        width: 100%;
        height: 100%;
    }

    .message-popup {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
        font-family: 'Pretendard-Regular';
        border-radius: 3%;

        /* 임시 지정 */
        width: 480px;
        height: 480px;

        /* 초기에 약간 아래에 배치 */
        transform: translate(-50%, -50%);
        padding: 7px;
        
        /* padding-block-start: 30px; */
    }

    .message-show .message-popup {
        transform: translate(-50%, -50%);
        transition: all 0.5s;
    }
    /* 모달 스타일 끝 */
    
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
<div class="outer">

	<div class="container mt-5">
	
		<div class="d-flex justify-content-between">
	
			<div>
	
				<span class="font-weight-bold project">배틀풀 상세보기</span>
				
			</div>
	
			
		</div>
	
	
		<div class="bg-white border rounded mt-2">
	
			<div class=" px-3 mt-3 d-flex flex-row justify-content-between">
	
				<span>제목 입력하는 곳</span>
				
			</div>
	
			<hr>
	
			<div class="row px-5 mb-3" style="height: 400px">
	
				
	
				<img src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg" width="100%" height="100%">
				
	
	
				
	
	
				
				
			</div>
	
		</div>
	
	
		     <div class="row mb-5">
	
	
					<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
							<h6>배틀 포인트</h6>
							<p class="text-black-50 content mb-5">
							레벨, 종목, 성별응 꼭 확인해 주세요.
							</p>
	
							<div class="d-flex flex-row">
	
								<div class="mr-4">
									
									<span>레벨</span>
									<div class="mt-1">
										<span class="text-black-50">무관</span>
									</div>
	
								</div>
	
	
								<div class="mr-4">
									
									<span>종목</span>
									<div class="mt-2">
										<span class="text-black-50">4:4 혼영</span>
										
									</div>
	
	
								</div>
	
	
								<div class="mr-4">
									
									<span>성별</span>
									<div class="mt-2">
										<span class="text-black-50">무관</span>
									</div>
	
								</div>
	
	
							</div>
							
						</div>
						
	
					</div>
	
	
					<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 시간 및 장소</h6>
						<p class="text-black-50 content mb-5">
						배틀 시간 및 장소를 꼭 확인해 주세요.
						</p>
	
						<div class="d-flex flex-row">
	
							<div class="mr-4">
								
								<span>시간</span>
								<div class="mt-1">
									<span class="text-black-50">2023년 1월 3일 11:00</span>
								</div>
							</div>
	
	
							<div class="mr-4">
								
								<span>지역</span>
								<div class="mt-2">
									<span class="text-black-50">서울</span>
									
								</div>
	
	
							</div>
	
	
							<div class="mr-4">
								
								<span>장소</span>
								<div class="mt-2">
									<span class="text-black-50">서울 특별시 영등포구 선유로 138</span>
								</div>
	
							</div>
							
	
						</div>
						
					</div>
					
	
			    	</div>
	
	
			    	<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 팀 정보</h6>
						<p class="text-black-50 content mb-5">
						배틀 팀 정보를 확인하세요.
						</p>
	
						<div class="d-flex flex-row">
	
							<div class="mr-4">
								
								<span>팀명</span>
								<div class="mt-1">
									<span class="text-black-50">어벤져스</span>
								</div>
	
							</div>
	
	
							<div class="mr-4">
								
								<span>전적</span>
								<div class="mt-2">
									<span class="text-black-50">16전 13승 3패(승률 81.5%)</span>
									
								</div>
	
	
							</div>
	
							
	
						</div>
						
					</div>
					
	
			    	</div>
	
	
			    	<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 경기장</h6>
						<p class="text-black-50 content mb-5">
							경기장 길이, 폭, 깊이, 레인, 수영복 대여 여부를 확인하세요.
						</p>
	
						<div class="d-flex flex-row">
	
							<div class="mr-4">
								
								<span>길이</span>
								<div class="mt-1">
									<span class="text-black-50">50미터</span>
								</div>
	
							</div>
	
	
							<div class="mr-4">
								
								<span>폭</span>
								<div class="mt-2">
									<span class="text-black-50">21미터</span>
								</div>
	
	
							</div>
	
							<div class="mr-4">
								
								<span>길이</span>
								<div class="mt-2">
									<span class="text-black-50">2미터</span>
								</div>
	
	
							</div>
	
							<div class="mr-4">
								
								<span>레인</span>
								<div class="mt-2">
									<span class="text-black-50">8게</span>
								</div>
	
	
							</div>
	
	
							<div class="mr-4">
								
								<span>수영복 대여</span>
								<div class="mt-2">
									<span class="text-black-50">가능</span>
								</div>
	
							</div>
							
	
						</div>
						
					</div>
					
	
			    	</div>
	
			    	<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 규칙</h6>
						<p class="text-black-50 content mb-5">
						                        SW 4.1 자유형, 평영, 접영 그리고 개인혼영에서 출발은 다이브로 한다. 심판장이 호각을 길게 불면(SW2.1.5) 선수들은 출발대 위에 올라 서 있는다. 스타터가 “차렷(take your marks)"하고 구령하면 곧 선수들은 출발대 앞에 적어도 한 발을 두고 출발 자세를 취한다. 손의 위치는 상관없다. 모든 선수들의 자세가 정지 하였을 때 스타터는 출발신호를 한다.
    SW 4.2 배영 및 혼계영에서의 출발은 물속에서 한다. 심판장의 첫 번째 긴 호각소리에 따라(SW2.1.5) 선수들은 즉각 물 속으로 들어가야 한다. 심판장의 두 번째 긴 호각 소리에 지체하지 말고 출발 자세로 들어가야 한다.(SW6.1) 모든 선수들이 출발 자세를 취했다고 인정되면 스타터는 “차렷(take your marks)”라는 구령을 한다. 모든 선수들의 자세가 정지하면 스타터는 출발 신호를 한다.
    
    SW 4.3 어느 선수든지 출발 신호전에 출발을 하면 실격을 당한다. 출발 신호 후 선수의 부정 출발이 확인되어도 역영은 계속되며 그 선수는 역영을 끝내고 실격을 당한다. 만약에 출발신호 전에 실격이 선언되면 스타터는 출발 신호를 해서는 안 되며 남은 선수들을 불러서 다시 시작한다.
						</p>
						
					</div>
					
	
			    	</div>
	
	
			    	<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 신청 및 결과보기</h6>
						<p class="text-black-50 content mb-5">
							신청은 팀장만 할 수 있습니다.
						</p>
	
						<div class="d-flex flex-row">
	
							<div class="mr-4">
								
								<span>신청</span>
								<div class="mt-1">
									<span class="alpha alpha-red show">신청</span>
								</div>
	
							</div>
	
	
							<div class="mr-4">
								
								<span>결과보기</span>
								<div class="mt-2">
									<span class="alpha alpha-green" onclick="location.href='battleResult.bt'">결과보기</span>
								</div>
	
	
							</div>
	
	
							<div class="mr-4">
								
								<span>채팅방 입장</span>
								<div class="mt-2">
									<span class="alpha alpha-red">채팅방</span>
								</div>
	
							</div>
							
	
						</div>
						
					</div>
					
	
			    	</div>
				
	
	
			</div>
		
	</div>



</div>
     
     <jsp:include page="../common/footer.jsp"/>

     <div class="message-background">
		<div class="message-window">
			<div class="message-popup">
				<div class="message-area" align="center">
					<h3>배틀 신청</h3>
					<br>
					<textarea id="msgContent" rows="10"
						style="width: 400px; resize: none;" placeholder="도발 멘트를 입력해 주세요."></textarea>
					<br> <br>
					<button onclick="insertMessage();">신청</button>
					<button id="close">취소</button>
				</div>
			</div>
		</div>
	 </div>

     <script>
        function messageShow() {
        document.getElementById("msgContent").value = '';
        document.querySelector(".message-background").className = "message-background message-show";
        }
    
        function messageClose() {
            document.querySelector(".message-background").className = "message-background";
        }
    
        document.querySelector(".show").addEventListener("click", messageShow);
        document.querySelector("#close").addEventListener("click", messageClose);
     </script>


</body>
</html>