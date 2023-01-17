<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
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
        width: 950px;
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
    
    #pagination{
        display: flex;
        justify-content: center;
        align-items: center;
   }

   .noTitle{
        font-size: 16px;
        color: rgb(113, 113, 113);
   }

   .teamInfoTable{
		text-align: center;
	}

   .teamInfo, .teamMemberInfo{
		font-family: 'Pretendard-Regular';
		background-color: antiquewhite;
		border-radius: 10px;
		width: 80%;
		border : 1px solid black;
		padding-top: 5px;
		height : 380px;
	}
	
	.teamInfo{
		height : 400px;
		font-family: 'Pretendard-Regular';
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

	<jsp:include page="../../common/menubar_nosearch.jsp"/>

    <div class="outer">
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName">${sessionScope.loginMember.nickName}</span> 님
                    <br>
                    <c:if test="${ sessionScope.loginMember.badgeChangeName == null }">
                    	노뱃지
                   	</c:if>
                   	<img src="${ sessionScope.loginMember.badgeChangeName }" width="30px">
                   	<c:if test="${ sessionScope.loginMember.teamName == null }">
                   		무소속	
                   	</c:if>
                   		<span>${ sessionScope.loginMember.teamName }</span>
                </div>
                <div>
                    <div id="point-text">포인트&nbsp;<span id="point">${sessionScope.loginMember.memPoint}</span></div>
                    <div id="ingido-text">인기도&nbsp;<span id="ingido">${sessionScope.loginMember.ingido}</span></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a  href="myPageInfo.me">회원정보</a></li>
                    <li><a href="myPageAtCheckForm.me">출석체크</a></li>
                    <li><a href="myPageBoard.me">작성글 보기</a></li>
                    <li><a id="click" href="myPageTeam.me">나의팀 보기</a></li>
                    <li><a href="myPageMoim.me">소모임 보기</a></li>
                    <li><a href="myPagePoint.me">포인트 조회</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">나의 팀 조회</div>
                <div id="title-line"><hr></div>
            <div class="info-area" style="margin: auto;">
               <!-- 없을때-->
               <c:choose>
               		<c:when test="${ empty team }">
		               <div align="center">
		                   <br><br><br><br>
		                   <p class="noTitle">소속된 팀이 없어요</p>
		                   <a href="teamList.mo">팀 페이지로 이동하기</a>
		                   <br><br><br><br><br><br>
		               </div>
               		</c:when>
               		<c:otherwise>
               		
               	

                <div style="width:100%" align="center">
                    
                <div>
				<div class="img-area" style="width:80%; display:inline-block;">
					<!-- 팀 이미지 -->
					<img width="100%" height="200px" class="teamImg" src="${ team.changeName }">
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
						<pre style="font-family: 'Pretendard-Regular';"><h5>팀장 : <span class="teamLeaderNickname">${ teamMemberList[0].nickname }</span>			팀원(${ teamMemberList.size() } / ${ team.teamMember })</h5></pre>
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
		
						<c:if test="${ loginMember.teamNo eq team.teamNo and loginMember.teamGrade eq 'L' }">
							<div class="update-area" align="center">
								<form action="teamUpdateForm.mo" method="post">
									<input type="hidden" value="${ team.teamNo }" name="teamNo" id="hiddenTeamNo">
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
						<c:if test="${ loginMember.teamNo eq team.teamNo and loginMember.teamGrade eq 'L' }">
							<form action="teamMemberUpdateForm.mo" method="post">
								<input type="hidden" name="teamNo" value="${ team.teamNo }">
								<button class="btn btn-primary" style="width:300px;">팀장/부팀장 수정</button>
							</form>
						</c:if>
					</div>
				</div>

				<div>
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
									<td colspan="3">모두 모집되었습니다.</td>
								</c:when>
								<c:otherwise>
								<c:choose>
									<c:when test="${ not empty applyList }">
										<c:forEach items="${ applyList }" var="ap">
											<tr>
												<td><p ingido="${ap.memNo}" title="프로필 보기" onclick="showProfile(event)">${ ap.nickname }</p></td>
												<td>${ ap.applyDate }</td>
												<td>
													<div style="display:inline-block;">
														<form action="updateApply.mo">
															<input type="hidden" value="${ ap.applyNo }" name="applyNo">
															<input type="hidden" value="${ team.teamNo }" name="moimNo">
															<input type="hidden" value="${ ap.memNo }" name="memNo">
															<button onclick="return confirmBtn('수락')">수락</button>
														</form>
													</div>
													<div style="display:inline-block;">
														<form action="deleteApply.mo">
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
							<div style="height:150px"></div>
							<a href="loginForm.me" class="btn btn-primary" style="width:300px;">로그인 후 신청 가능</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${ loginMember.teamNo eq team.teamNo }">
									<c:choose>
										<c:when test="${ loginMember.teamGrade eq 'L' }">
											<form action="chattingRoom.mo" method="post">
												<input type="hidden" name="moimNo" value="${ team.teamNo }">
												<input type="hidden" name="memNo" value="${ loginMember.memNo }">
												<input type="hidden" name="moimMember" value="${ teamMemberList.size()}">
												<input type="hidden" name="moimTitle" value="${ team.teamName }">
												<button class="btn btn-primary" style="width:150px;">채팅하기</button>
											</form>
										</c:when>
										<c:otherwise>
											<div style="height:150px"></div>
											<div style="display:inline-block;">
												<form action="deleteTeamMember.mo">
													<input type="hidden" name="memNo" value="${ loginMember.memNo }">
													<input type="hidden" name="teamNo" value="${ team.teamNo }">
													<input type="hidden" name="moimNo" value="${ team.teamNo }">
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
									<c:choose>
										<c:when test="${ teamMemberList.size() < team.teamMember }">
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
											<div style="height:150px"></div>
											<button class="btn btn-primary" style="width:300px;" disabled>모집마감</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${ teamMemberList.size() < team.teamMember }">
											<div style="height:150px"></div>
											<a class="btn btn-primary disabled" id="apply-a" style="width:300px;">이미 다른 팀에<br> 소속되어 있습니다.</a>
										</c:when>
										<c:otherwise>
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
              	</c:otherwise>
               </c:choose>
			</div>

        </div>   
    </div>       

   
	<jsp:include page="../../common/footer.jsp"/>
	<c:if test="${ not empty loginMember and loginMember.teamNo ne team.teamNo and teamMemberList.size() < team.teamMember }">
		<script>
			$(function(){
				$.ajax({
					url : "selectApply.mo",
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
								$('#apply-btn').html('현재 신청내역이 있습니다.');
							}
						}
						
					},
					error : function(){
						console.log('ajax 통신 실패');
					}
				})
			})
		</script>
	</c:if>	
	 
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