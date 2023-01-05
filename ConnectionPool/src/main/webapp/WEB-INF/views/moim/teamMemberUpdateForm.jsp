<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="outer">
		<h3>팀 멤버 권한 수정하기</h3>
		<form action="#">
			<table>
				<tr>
					<th>닉네임</th>
					<th>가입일시</th>
					<th>직급선택</th>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						value에 이름을 가져다가 가자
						부팀장<input type="radio" name="S">
						value에 이름을 가져다가 가자
						
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				
			</table>
			
			<br><br>
			
			<button>수정하기</button>
		</form>
	</div>

</body>
</html>