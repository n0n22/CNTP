<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 참여</title>

<style>
	.teamListTable tbody tr:hover{
		cursor: pointer;
	}
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>
	
	<div class="outer" align="center">
	<br><br>
		<div style="width:1300px">
			<div class="teamListTitle" align="left">
				<h3>팀 참여</h3>
				<h5>팀에 소속되어 친목 및 배틀을 즐겨보세요</h5>
				<hr>
			</div>
	
			<br>
			
			<div class="teamListCondition" align="right">
				지역
				<select name="teamArea">
					<option value="Seoul">서울특별시</option>
					<option value="Gyeonggi">경기도</option>
					<option value="Gangwon">강원도</option>
					<option value="Chungbuk">충청북도</option>
					<option value="Chungnam">충청남도</option>
					<option value="Jeonabuk">전라북도</option>
					<option value="Jeonnam">전라남도</option>
					<option value="Gyeongbuk">경상북도</option>
					<option value="Gyeongnam">경상남도</option>
				</select>
				키워드
				<select name="keyword">
					<option value="battle">배틀</option>
					<option value="social">친목</option>
					<option value="online">온라인만</option>
				</select>
			</div>
			
			<br>
			
			<table class="table table-hover teamListTable" border="1">
				<thead class="thead-dark">
					<tr>
						<th width="50">번호</th>
						<th width="150">유형</th>
						<th width="150">지역</th>
						<th width="200">팀명</th>
						<th width="150">인원</th>
						<th width="200">키워드</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>파워</td>
						<td>서울</td>
						<td>서울짱</td>
						<td>(8/12)</td>
						<td>친목</td>
					</tr>
					<tr>
						<td>2</td>
						<td>일반</td>
						<td>경기</td>
						<td>경기짱</td>
						<td>(4/8)</td>
						<td>배틀</td>
					</tr>
				</tbody>
			</table>
			
			<div class="teamList-paging-area">
			
			</div>
			
			<div align="right">
				<a href="teamEnrollFrom.mo">팀 만들기</a>
			</div>
			
		</div>
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			$('.teamListTable tbody tr').click(function(){
				location.href = 'teamPage.mo?teamNo=' + $(this).children().eq(0).text();
			})
		})
	</script>
	
	
	
	
</body>
</html>