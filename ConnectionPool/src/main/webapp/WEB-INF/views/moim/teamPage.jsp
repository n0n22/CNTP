<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 페이지</title>
<style>
	.teamInfoTable td{
		text-align: center;
	}

	.teamInfo, .teamMemberInfo{
		background-color: antiquewhite;
		border-radius: 10px;
		width: 80%;
		border : 1px solid black;
		padding-top: 5px;
		height : 400px;
	}
	
	.teamInfo{
		height : 400px;
	}

	table{
		border:1px solid black; 
	}

	.teamMemberInfo > div{
		float: left;
		width: 50%;
		height: 100%;
		padding-top: 5%;
	}

	.img-area{
		position:relative;
		z-index: 1;
	}

	.badge-img{
		border-radius: 50%;
		position:absolute;
		z-index:2;
		border : 1px solid black;
	}

	.teamImg{
		border-radius: 10px;
		border : 1px solid black;
	}
	
	.teamInfoTable th, .applyTable td, .applyTable th, .teamMemberInfo th, .teamMemberInfo td{
		text-align: center;
	}
</style>

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>

	<div class="outer" align="center">

		<div style="width:1300px;">
			
			<div>
				<div class="badge-area" style="width:20%; float:left">
					<!-- 팀 뱃지 -->
					<c:choose>
						<c:when test="${ empty team.badgeChangeName }">
							<img class="badge-img" width="200px" height="200px" src="${ pageContext.request.contextPath }/resources/images/noBadge.png">
						</c:when>
						<c:otherwise>
							<img class="badge-img" width="200px" height="200px"  src="${ team.badgeChangeName }">
						</c:otherwise>
					</c:choose>

				</div>

				<div class="img-area" style="width:80%; display:inline-block;">
					<!-- 팀 이미지 -->
					<img width="1040px" height="300px" class="teamImg" src="${ team.changeName }">
				</div>
				<c:if test="${ loginMember.teamGrade eq 'L' and loginMember.teamNo eq team.teamNo and team.badgeStatus eq 'N'}">
					<div class="badge-shop" align="left" style="width:80%;">
						<a class="btn" href="badgeShop.mo" class="btn btn-primary" style="width:200px">뱃지 구매하기</a>
					</div>
				</c:if>
			</div>
			
			<br><br>


			<div class="teamInfo" align="center">


				<br>
				<pre><h5>팀장 : <span class="teamLeaderNickname">${ teamMemberList[0].nickname }</span>			팀원(${ teamMemberList.size() } / ${ team.teamMember })</h5></pre>
				<table class="teamInfoTable">
					<tr>
						<th width="400">팀 소개</th>
						<th width="400">주요 활동 지역</th>
					</tr>
					<tr height="50">
						<td>${ team.teamIntro }</td>
						<td>${ team.korArea }</td>
					</tr>
					<tr>
						<th>현재 팀 인원</th>
						<th>주요 활동시간</th>
					</tr>
					<tr height="50">
						<td>${ team.teamMember }명</td>
						<td>${ team.teamTime }</td>
					</tr>
					<tr>
						<th>키워드</th>
						<th>배틀기록</th>
					</tr>
					<tr height="50">
						<td>${ team.keyword }</td>
						<td>
							${ resultHistory.winningStreak } 연승 ${ resultHistory.losingStreak } 연패<br>
							${ resultHistory.victory } 승 ${ resultHistory.defeat } 패
						</td>
					</tr>

				</table>

				<br>

				<!-- 팀장만 보이는 팀 정보 수정하기 내역 -->
				<c:if test="${ loginMember.teamNo eq team.teamNo and loginMember.teamGrade eq 'L' }">
					<div class="update-area" align="center">
						<form action="teamUpdateForm.mo" method="post">
							<input type="hidden" value="${ team.teamNo }" name="teamNo" id="hiddenTeamNo">
							<input type="hidden" value="${ teamMemberList.size() }" name="teamMemberCount" id="hiddenTeamNo">
							<button class="btn btn-primary" style="width:300px">수정하기</button>
						</form>
					</div>
				</c:if>

			</div>

			<br><br>
			
			<div class="teamMemberInfo" align="center">
				<div>
					<p>팀원</p>
					<table class="teamMemberInfoTable" border="1">
						<tr>
							<th width="100">직급</th>
							<th width="100">닉네임</th>
							<th width="100">가입일시</th>
						</tr>
						<c:forEach items="${ teamMemberList }" var="tm">
							<tr>
								<td>${tm.teamGrade}</td>
								<td class="nickname"><p ingido="${tm.memNo}" title="프로필 보기" onclick="showProfile(event)">${tm.nickname}</p></td>
								<td class>${tm.teamEnrollDate}</td>
							</tr>
						</c:forEach>
					</table>
					
					<br>

					<div class="memberUpdate-area" align="center">
						<!-- 팀장만 보이는 팀원 수정 버튼 -->
						<!-- <a href="teamMemberUpdateForm.mo?teamNo=${ teamNo }">팀장/부팀장 수정</a> -->
						<c:if test="${ loginMember.teamNo eq team.teamNo and loginMember.teamGrade eq 'L' }">
							<form action="teamMemberUpdateForm.mo" method="post">
								<input type="hidden" name="teamNo" value="${ team.teamNo }">
								<button class="btn btn-primary" style="width:300px;">팀장/부팀장 수정</button>
							</form>
						</c:if>
					</div>
				</div>

				<div>
					<!-- 팀장만 보여야 하는 신청 영역 -->
					<c:if test="${ loginMember.teamNo eq team.teamNo and loginMember.teamGrade eq 'L' }">
						<p>신청내역</p>
						<table class="applyTable" border="1">
							<tr>
								<th width="100">닉네임</th>
								<th width="100">신청일시</th>
								<th width="150">수락/거절</th>
							</tr>
							<c:choose>
								<c:when test="${ teamMemberList.size() >= team.teamMember }">
								<!-- 팀인원을 모두 모집했을 때 -->
									<td colspan="3">모두 모집되었습니다.</td>
								</c:when>
								<c:otherwise>
								<!-- 아직 모집중일 때 -->
								<c:choose>
									<c:when test="${ not empty applyList }">
										<c:forEach items="${ applyList }" var="ap">
											<tr>
												<td><p ingido="${ap.memNo}" title="프로필 보기" onclick="showProfile(event)">${ ap.nickname }</p></td>
												<td>${ ap.applyDate }</td>
												<td>
													<div style="display:inline-block;">
														<form action="insertTeamMember.mo" method="post">
															<input type="hidden" value="${ ap.applyNo }" name="applyNo">
															<input type="hidden" value="${ team.teamNo }" name="teamNo">
															<input type="hidden" value="${ ap.memNo }" name="memNo">
															<button onclick="return confirmBtn('수락')">수락</button>
														</form>
													</div>
													<div style="display:inline-block;">
														<form action="deleteApply.mo" method="post">
															<input type="hidden" value="${ ap.memNo }" name="memNo">
															<input type="hidden" value="${ team.teamNo }" name="moimNo">
															<button onclick="return confirmBtn('거절')">거절</button>
														</form>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3">신청 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</c:otherwise>
							</c:choose>
						</table>
						<br>
					</c:if>
					
					<c:choose>
						<c:when test="${ empty loginMember }">
							<!-- 로그인이 되어 있지 않을 때 -->
							<div style="height:150px"></div>
							<a href="loginForm.me" class="btn btn-primary" style="width:300px;">로그인 후 신청 가능</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${ loginMember.teamNo eq team.teamNo }">
								<!-- 로그인이 되어 있고, 해당 팀에 속해 있을 때 -->
									<c:choose>
										<c:when test="${ loginMember.teamGrade eq 'L' }">
											<!-- 팀장일 때 -->
											<form action="chattingRoom.mo" method="post">
												<input type="hidden" name="moimNo" value="${ team.teamNo }">
												<input type="hidden" name="memNo" value="${ loginMember.memNo }">
												<input type="hidden" name="moimMember" value="${ teamMemberList.size()}">
												<input type="hidden" name="moimTitle" value="${ team.teamName }">
												<button class="btn btn-primary" style="width:300px;">채팅하기</button>
											</form>
										</c:when>
										<c:otherwise>
											<!-- 팀원일 때 -->
											<div style="height:150px"></div>
											<div style="display:inline-block;">
												<form action="deleteTeamMember.mo">
													<input type="hidden" name="memNo" value="${ loginMember.memNo }">
													<input type="hidden" name="teamNo" value="${ team.teamNo }">
													<button class="btn btn-primary" style="width:150px;" onclick="return confirmBtn('탈퇴')">팀 탈퇴하기</button>
												</form>
											</div>
											<div style="display:inline-block;">
												<form action="chattingRoom.mo" method="post">
													<input type="hidden" name="moimNo" value="${ team.teamNo }">
													<input type="hidden" name="memNo" value="${ loginMember.memNo }">
													<input type="hidden" name="moimMember" value="${ teamMemberList.size()}">
													<input type="hidden" name="moimTitle" value="${ team.teamName }">
													<button class="btn btn-primary" style="width:150px;">채팅하기</button>
												</form>
											</div>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${ empty loginMember.teamGrade }">
									<!-- 로그인이 되어 있고 팀 소속이 없을 때 -->
									<c:choose>
										<c:when test="${ teamMemberList.size() < team.teamMember }">
										<!-- 모집중일 때 -->
											<c:choose>
												<c:when test="${ team.teamArea ne loginMember.memArea }">
													<div style="height:150px"></div>
													<p>지역 조건이 맞지 않습니다.</p>
													<button class="btn btn-primary" disabled>신청불가</button>
												</c:when>
												<c:otherwise>
													<div style="height:150px"></div>
													<form action="insertApply.mo" method="post" id="apply-form">
														<input type="hidden" name="memNo" value="${ loginMember.memNo }">
														<input type="hidden" name="teamNo" value="${ team.teamNo }">
														<input type="hidden" name="moimNo" value="${ team.teamNo }">
														<button id="apply-btn" class="btn btn-primary" style="width:300px;" onclick="return confirmBtn('신청')">신청하기</button>
													</form>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
										<!-- 모집 마감일 때 -->
											<div style="height:150px"></div>
											<button class="btn btn-primary" style="width:300px;" disabled>모집마감</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<!-- 다른 팀 소속일 때 -->
									<c:choose>
										<c:when test="${ teamMemberList.size() < team.teamMember }">
										<!-- 모집중일 때 -->
											<div style="height:150px"></div>
											<a class="btn btn-primary disabled" id="apply-a" style="width:300px;">이미 다른 팀에<br> 소속되어 있습니다.</a>
										</c:when>
										<c:otherwise>
										<!-- 모집 마감일 때 -->
											<div style="height:150px"></div>
											<button class="btn btn-primary" style="width:300px;" disabled>모집마감</button>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<c:choose>
		<c:when test="${ not empty loginMember and loginMember.teamNo ne team.teamNo and teamMemberList.size() < team.teamMember }">
			<script>
				$(function(){
					$.ajax({
						url : "selectApply.mo",
						data : {
							moimNo : '${ team.teamNo }',
							memNo : '${ loginMember.memNo }'
						},
						success : function(obj){
							if(obj != null){
								//console.log('들어왔다.');
								if(obj.moimNo == "${ team.teamNo }"){
									$('#apply-btn').css('width', '300px');
									$('#apply-btn').html('신청취소');
									$('#apply-btn').removeAttr('disabled');
									$('#apply-form').attr('action', 'deleteApply.mo');
								} else{
									$('#apply-btn').attr('disabled', 'true');
									$('#apply-btn').removeAttr('onclick');
									$('#apply-btn').css('width', '300px');
									$('#apply-btn').html('현재 다른 신청내역이 있습니다.');
								}
							}
							
						},
						error : function(){
							console.log('ajax 통신 실패');
						}
					})
				})
			</script>
		</c:when>
		<c:when test="${ not empty loginMember and loginMember.teamNo ne team.teamNo and teamMemberList.size() >= team.teamMember }">
			<script>
				$(function(){
					$.ajax({
						url : "selectApply.mo",
						data : {
							moimNo : '${ team.teamNo }',
							memNo : '${ loginMember.memNo }'
						},
						success : function(obj){
							if(obj != null && obj.moimNo == "${ team.teamNo }"){
								//console.log('들어왔다.');
								$('#apply-btn').css('width', '300px');
								$('#apply-btn').html('이미 모집 마감되었습니다.<br>신청취소');
								$('#apply-btn').removeAttr('disabled');
								$('#apply-form').attr('action', 'deleteApply.mo');
							}
							
						},
						error : function(){
							console.log('ajax 통신 실패');
						}
					})
				})
			</script>
		</c:when>
	</c:choose>	
	 
	 <script>
	 	function confirmBtn(keyword){
	 		if(confirm('정말 ' + keyword + '하시겠습니까?')){
	 			return true;
	 		} else{
	 			return false;
	 		}
	 	}
	 </script>
	
</body>
</html>