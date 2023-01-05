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
		border-radius: 5%;
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
</style>

</head>
<body>

	<div class="outer" align="center">

		<img width="80%" height="200px" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbhd1qW%2FbtqUnLpjyqL%2FsRwVDDHp0keOfVq1nKDb11%2Fimg.jpg">
		
		<br><br>

		<div class="teamInfo" align="center">



			<pre>팀장 :		부팀장 : 		팀원( / )</pre> <br>
			<table class="teamInfoTable" border="1">
				<tr>
					<th width="400">팀 소개</th>
					<th width="400">주요 활동 지역</th>
				</tr>
				<tr>
					<td>우리팀은 어쩌고</td>
					<td>활동지역은 어쩌고</td>
				</tr>
				<tr>
					<th>현재 팀 인원</th>
					<th>주요 활동시간</th>
				</tr>
				<tr>
					<td>1명</td>
					<td>평일</td>
				</tr>
				<tr>
					<th>키워드</th>
					<th>배틀기록</th>
				</tr>
				<tr>
					<td>배틀</td>
					<td>아직 배틀 참여 기록이 없습니다</td>
				</tr>

			</table>

			<a href="#">수정하기페이지보내주는버튼</a>

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
					<tr>
						<td>팀장</td>
						<td>나짱짱</td>
						<td>2020-01-01</td>
					</tr>
				</table>
				<br>
				<button>팀장/부팀장 수정</button>
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
						<td>어쪼거</td>
						<td>2020-01-01</td>
						<td>
							<button>수락</button>
							<button>거절</button>
						</td>
					</tr>
				</table>
			</div>

		</div>
		
	</div>

</body>
</html>