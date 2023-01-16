<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/css/battle/battlePoolDetail.css">
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
									<span id="time" class="text-black-50">${battle.battleDate} ${battle.battleTime}</span>
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
								<!-- 1. 신청은 팀장만 보임  / 2. 신청하면 신청이 아니라 취소 버튼이 보임  / 3. 작성팀의 팀장은 보이지 않음  / 4. 배틀결과가 확정되면 보이지 않음-->
								<c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo ne battle.awayTeam) and (loginMember.teamNo ne battle.homeTeam) and (empty battle.awayTeam)}">
									<div class="mr-4">
										<span>신청</span>
											<div class="mt-2">
												<span class="alpha alpha-red show" id="apply">신청</span>
											</div>
									</div>
									<!-- 메시지 모달 -->
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
														<textarea id="msgContent" rows="5" name="chatContent" maxlength="150"
															style="width: 400px; resize: none;" placeholder="도발 멘트를 입력해 주세요." required="required"></textarea>
														<br> <br>
														<button type="submit">신청</button>
														<button type="button" id="close">취소</button>
													</form>
												</div>
											</div>
										</div>
								    </div>
																		
									<script>
							            // 배틀 시간 6시간 전(60 * 60 * 6) 신청을 마감하는 함수 
										$(function(){
											let today = new Date();
											let battleDate = new Date($('#time').text());
											
											if((battleDate - today) < (60 * 60 * 6)){ // 배틀 시간 6시간 보다 안남음
												$('#apply').text('마감');
												$('#apply').attr('class', 'alpha alpha-green');
											}
											// 메시지 모달 실행 조건 => 신청이면 모달 정상 작동 / 마감이면 모달 작동 안함
								        	if($('#apply').attr('class') != 'alpha alpha-green'){
									            document.querySelector(".show").addEventListener("click", messageShow);
									            document.querySelector("#close").addEventListener("click", messageClose);
								        	}
										})
										// 메시지 모달 실행 및 종료 함수
								        function messageShow() {
							            document.getElementById("msgContent").value = '';
							            document.querySelector(".message-background").className = "message-background message-show";
							            }
							        
							            function messageClose() {
							                document.querySelector(".message-background").className = "message-background";
							            }
									
									</script>
								</c:if>
								<!-- 팀 직급이 팀장 && 배틀을 신청한 팀장 && (배틀 결과가 없거나  배틀 결과 승인 전이거나) -->
								<c:if test="${ (loginMember.teamGrade) eq 'L' and (loginMember.teamNo eq battle.awayTeam) and (empty battleResult or battleResult eq 'N')}">
									<div class="mr-4">
										<span>취소</span>
											<div class="mt-2">
												<span class="alpha alpha-red" onclick="cancel()">취소</span>
											</div>
									</div>
									<form action="cancelBattle.bt" method="post" id="cancelBattleSubmit">
										<input type="hidden" name="battleNo" value="${battle.battleNo}">
										<input type="hidden" name="memNo" value="${loginMember.memNo}">
									</form>
									<div class="mr-4">
										<span>채팅방 입장</span>
										<div class="mt-2">
											<span class="alpha alpha-red" onclick="chat()">채팅방</span>
										</div>
										<form action="chattingRoom.mo" method="post" id="chat">
											<input type="hidden" name="moimNo" value="">
											<input type="hidden" name="memNo" value="">
											<input type="hidden" name="moimMember" value="">
											<input type="hidden" name="moimTitle" value="">
										</form>
			
									</div>
									<script>
										function cancel(){
											if(confirm('신청을 취소하시겠습니까?')){
												$('#cancelBattleSubmit').submit();
											}
										}
										function chat(){
											location.href = 'chattingRoom.mo';
										}
									</script>
								</c:if>
							<c:if test="${(loginMember.teamNo eq battle.homeTeam) and (empty battleResult) }">
								<div class="mr-4">
									
									<span>글 삭제</span>
									<div class="mt-2">
										<span class="alpha alpha-red" onclick="deleteBattle();">글 삭제</span>
									</div>
									<!-- 글 삭제 -->
									<form action="deleteBattlePool.bt" method="post" id="deleteBattlePoolSubmit">
										<input type="hidden" name="battleNo" value="${battle.battleNo}">
									</form>
									<script>
										function deleteBattle(){
											if(!confirm('게시글을 삭제하시겠습니까?')){
												return;
											}
											$('#deleteBattlePoolSubmit').submit();
										}
									</script>
									
								</div>
							</c:if>
							
							<div class="mr-4">
								
								<span>결과보기</span>
								<div class="mt-2">
									<span class="alpha alpha-green" onclick="showResult()">결과보기</span>
								</div>
							</div>
						</div>
					</div>
			    	</div>
			</div>
	</div>
</div>
		<!-- 배틀 결과 상세 보기 페이지 post방식으로 전송 : get 방식으로 전송했더니 url 가지고 조작이 가능 -->
		<form action="battleResult.bt" method="post" id="battleResultSubmit">
			<input type="hidden" name="battleNo" value="${battle.battleNo}">
			<input type="hidden" name="homeTeam" value="${battle.homeTeam}">
			<input type="hidden" name="awayTeam" value="${battle.awayTeam}">
		</form>
	<script>
		function showResult(){
			$('#battleResultSubmit').submit();
		}
	
	</script>
     
     <jsp:include page="../common/footer.jsp"/>



</body>
</html>