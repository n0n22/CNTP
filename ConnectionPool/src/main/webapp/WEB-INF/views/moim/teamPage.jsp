<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>


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
		height : 300px;

		padding-top: 5px;
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
	}

	.teamImg{
		border-radius: 10px;

	}
</style>

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>

	<div class="outer" align="center">

		<div style="width:1300px">
			
			<div>
				<div class="badge-area" style="width:20%; float:left">
					<!-- 팀 뱃지 -->
					<img class="badge-img" width="200px" height="200px"  src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbhd1qW%2FbtqUnLpjyqL%2FsRwVDDHp0keOfVq1nKDb11%2Fimg.jpg">

				</div>

				<div class="img-area" style="width:80%; display:inline-block;">
					<!-- 팀 이미지 -->
					<img width="1040px" height="300px" class="teamImg" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbhd1qW%2FbtqUnLpjyqL%2FsRwVDDHp0keOfVq1nKDb11%2Fimg.jpg">
				</div>

				<div class="badge-shop" align="left" style="width:80%;">
					<a class="btn" href="badgeShop.mo">뱃지 구매하기</a>
				</div>
			</div>
			
			<br><br>


			<div class="teamInfo" align="center">



				<pre>팀장 :			팀원(${ teamMeberList.size() } / ${ team.teamMember })</pre> <br>
				<table class="teamInfoTable" border="1">
					<tr>
						<th width="400">팀 소개</th>
						<th width="400">주요 활동 지역</th>
					</tr>
					<tr>
						<td>${ team.teamIntro }</td>
						<td>${ team.teamArea }</td>
					</tr>
					<tr>
						<th>현재 팀 인원</th>
						<th>주요 활동시간</th>
					</tr>
					<tr>
						<td>${ team.teamMember }명</td>
						<td>${ team.teamTime }</td>
					</tr>
					<tr>
						<th>키워드</th>
						<th>배틀기록</th>
					</tr>
					<tr>
						<td>${ team.keyword }</td>
						<td>${ resultHistory }</td>
					</tr>

				</table>

				<br>

				<div class="enroll-area" align="right">
					<a href="teamUpdateForm.mo">수정하기</a>
					<!-- <a href="teamUpdateForm.mo?teamNo=${ teamNo }">수정하기</a> -->
				</div>

			</div>

			<br><br>
			
			<div class="teamMemberInfo" align="center">
				
				<div>
					<p>팀원</p>
					<table class="teamMemberInfoTable" border="1">
						<tr>
							<th width="100">직급</th>
							<th width="100">닉네임</th>
						</tr>
							<c:forEach items="${ teamMeberList }" var="tm">
								<c:if test="${ tm.teamGrade eq 'L' }">
									<td>팀장</td>
									<td>${tm.memNo}</td>
								</c:if>
							</c:forEach>
							
							<c:forEach items="${ teamMeberList }" var="tm">
								<c:if test="${ tm.teamGrade eq 'S' }">
									<td>부팀장</td>
									<td>${tm.memNo}</td>
								</c:if>
							</c:forEach>
							
							<c:forEach items="${ teamMeberList }" var="tm">
								<c:if test="${ tm.teamGrade eq 'M' }">
									<td>팀원</td>
									<td>${tm.memNo}</td>
								</c:if>
							</c:forEach>
							
						</tr>
					</table>
					<br>

					<div class="memberUpdate-area" align="right">
						<a href="teamMemberUpdateForm.mo">팀장/부팀장 수정</a>
						<!-- <a href="teamMemberUpdateForm.mo?teamNo=${ teamNo }">팀장/부팀장 수정</a> -->
						<a href="chattingRoom.mo">팀 채팅방 입장하기</a>
					</div>
				</div>

				<div>
					<p>신청내역</p>
					<table class="applyTable" border="1">
						<tr>
							<th width="100">닉네임</th>
							<th width="100">신청일시</th>
							<th width="100">수락/거절</th>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${ not empty applyList }">
									<c:forEach items="${ applyList }" var="ap">
											<td>${ ap.memNo }</td>
											<td>${ ap.applyDate }</td>
											<td><button>수락</button><button>거절</button></td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="3">신청 내역이 없습니다.</td>
								</c:otherwise>
							</c:choose>
						
						</tr>
					</table>
				</div>

			</div>
			
		</div>
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>