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
        height: 280px;

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
	
				<span>${battle.title}</span>
				
			</div>
	
			<hr>
	
			<div class="row px-5 mb-3" style="height: 400px">
	
				<c:if test="${ battle.changeName ne null}">
					<img src="${ battle.changeName }" width="100%" height="100%">
				</c:if>
				<c:if test="${ battle.changeName eq null }">
					<img src="resources/images/cntp_flamingo.png" width="100%" height="100%">
				</c:if>
			</div>
	
		</div>
	
	
		     <div class="row mb-5">
	
	
					<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
							<h6>배틀 포인트</h6>
							<p class="text-black-50 content mb-5">
							레벨, 종목, 성별 등을 꼭 확인해 주세요.
							</p>
	
							<div class="d-flex flex-row">
	
								<div class="mr-4">
									
									<span>레벨</span>
									<div class="mt-2">
										<span class="text-black-50">
										<c:choose>
											<c:when test="${battle.level eq 'A'}">무관</c:when>
											<c:when test="${battle.level eq 'B'}">초급</c:when>
											<c:when test="${battle.level eq 'M'}">중급</c:when>
											<c:otherwise>고급</c:otherwise>
										</c:choose>
										
										</span>
									</div>
	
								</div>
	
	
								<div class="mr-4">
									
									<span>종목</span>
									<div class="mt-2">
										<span class="text-black-50">
										<c:choose>
											<c:when test="${battle.style eq 'f4'}">4:4 자유형</c:when>
											<c:when test="${battle.style eq 'h4'}">4:4 혼영</c:when>
											<c:when test="${battle.style eq 'hg4'}">4:4 혼계영</c:when>
										</c:choose>
										</span>
										
									</div>
	
	
								</div>
	
	
								<div class="mr-4">
									
									<span>성별</span>
									<div class="mt-2">
										<span class="text-black-50">
										<c:choose>
											<c:when test="${battle.gender eq 'A'}">무관</c:when>
											<c:when test="${battle.gender eq 'M'}">남자만</c:when>
											<c:when test="${battle.gender eq 'F'}">여자만</c:when>
										</c:choose>
										</span>
									</div>
	
								</div>
	
	
							</div>
							
						</div>
						
	
					</div>
	
	
					<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 시간 및 지역</h6>
						<p class="text-black-50 content mb-5">
						배틀 시간 및 지역을 꼭 확인해 주세요.
						</p>
	
						<div class="d-flex flex-row">
	
							<div class="mr-4">
								
								<span>시간</span>
								<div class="mt-2">
									<span class="text-black-50">${battle.battleDate} ${battle.battleTime}</span>
								</div>
							</div>
	
	
							<div class="mr-4">
								
								<span>지역</span>
								<div class="mt-2">
									<span class="text-black-50">${battle.area}</span>
									
								</div>
	
	
							</div>
	
	
							<div class="mr-4">
								
								<span>장소</span>
								<div class="mt-2">
									<span class="text-black-50">${ poolInfo.poolName }</span>
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
						<!-- AJAX로 하고 싶은데 그냥 SELECT문 통해서 할 예정 : TEAM 테이블, RESULT_HISTORY -->
						<div class="d-flex flex-row">
	
					
	
							<div class="mr-4">
								
								<span>전적</span>
								<div class="mt-2">
									<span class="text-black-50">${homeTeamRecord.record}전  ${homeTeamRecord.victory}승  ${homeTeamRecord.defeat}패 승률(${homeTeamRecord.winRate}%)</span>
									
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
								<div class="mt-2">
									<span class="text-black-50">${ poolInfo.length }</span>
								</div>
	
							</div>
	
	
							<div class="mr-4">
								
								<span>폭</span>
								<div class="mt-2">
									<span class="text-black-50">${ poolInfo.width }</span>
								</div>
	
	
							</div>
	
							<div class="mr-4">
								
								<span>깊이</span>
								<div class="mt-2">
									<span class="text-black-50">${ poolInfo.depth }</span>
								</div>
	
	
							</div>
	
							<div class="mr-4">
								
								<span>레인</span>
								<div class="mt-2">
									<span class="text-black-50">${ poolInfo.lanes }개</span>
								</div>
	
	
							</div>
	
	
							<div class="mr-4">
								
								<span>수영복 대여</span>
								<div class="mt-2">
									<span class="text-black-50">
									<c:if test="${ poolInfo.yesNo eq 'Y' }">가능</c:if>
									<c:if test="${ poolInfo.yesNo eq 'N' }">불가능</c:if>
									</span>
								</div>
	
							</div>
							
	
						</div>
						
					</div>
					
	
			    	</div>
	
			    	<div class="col-md-6 mt-3">
	
						<div class="bg-white p-3 rounded border">
						<h6>배틀 규칙</h6>
						<p class="text-black-50 content mb-5">
							${ battle.battleRule }
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
								<div class="mt-2">
									<span class="alpha alpha-red show">신청</span>
								</div>
	
							</div>
	
	
							<div class="mr-4">
								
								<span>결과보기</span>
								<div class="mt-2">
									<span class="alpha alpha-green" onclick="location.href='battleResult.bt?battleNo=${battle.battleNo}&homeTeam=${battle.homeTeam}&awayTeam=${battle.awayTeam}'">결과보기</span>
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
					<form action="battleApply.bt" method="post">
						<input type="hidden" name="teamNo" value="${ loginMember.teamNo }">
						<input type="hidden" name="memNo" value="${ loginMember.memNo }">
						<input type="hidden" name="battleNo" value="${ battle.battleNo }">
						<textarea id="msgContent" rows="5" name="chatContent"
							style="width: 400px; resize: none;" placeholder="도발 멘트를 입력해 주세요."></textarea>
						<br> <br>
						<button type="submit">신청</button>
						<button type="button" id="close">취소</button>
					</form>
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