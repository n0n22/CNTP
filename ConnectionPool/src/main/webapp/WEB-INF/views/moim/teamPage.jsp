<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 페이지</title>
</head>
<body>

	<div class="outer">
		
		<div class="teamInfo">

			<img src="" alt="">

			<p>팀장 :		부팀장 : 		팀원( / )</p> <br>
			<table class="teamInfoTable">
				<tr>
					<th>팀 소개</th>
					<th>주요 활동 지역</th>
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
		
		<div class="teamMemberInfo">
			<p>팀원</p>
			<table class="teamMemberInfoTable">
				<tr>
					<th>직급</th>
					<th>닉네임</th>
					<th>가입일시</th>
				</tr>
				<tr>
					<td>팀장</td>
					<td>나짱짱</td>
					<td>2020-01-01</td>
				</tr>
			</table>
			<button>팀장/부팀장 수정</button>
			<table class="applyTable">
				<tr>
					<th>닉네임</th>
					<th>신청일시</th>
					<th>수락/거절</th>
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

</body>
</html>