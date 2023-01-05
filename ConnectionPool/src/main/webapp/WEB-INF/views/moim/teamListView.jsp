<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 참여</title>
</head>
<body>
	
	<div class="outer">
	
		<div class="teamListTitle">
			<h3>팀 참여</h3>
			<h6>팀에 소속되어 친목 및 배틀을 즐겨보세요</h6>
		</div>
		
		<div class="teamListCondition">
			지역
			<select name="teamArea">
				<option value="S">서울</option>
				<option value="G">경기</option>
				<option value="I">인천</option>
			</select>
			키워드
			<select name="keyword">
				<option value="battle">배틀</option>
				<option value="social">친목</option>
				<option value="online">온라인만</option>
			</select>
		</div>
		
		<table class="table table-hover thead-dark">
			<tr>
				<th colspan="2">지역</th>
				<th>팀명</th>
				<th>인원</th>
				<th>키워드</th>
			</tr>
			<tr>
				<td>파워</td>
				<td>서울</td>
				<td>서울짱</td>
				<td>(8/12)</td>
				<td>친목</td>
			</tr>
			<tr>
				<td>일반</td>
				<td>경기</td>
				<td>경기짱</td>
				<td>(4/8)</td>
				<td>배틀</td>
			</tr>
		</table>
		
		<div class="teamList-paging-area">
		
		</div>
		
	</div>
	
	
	
	
</body>
</html>