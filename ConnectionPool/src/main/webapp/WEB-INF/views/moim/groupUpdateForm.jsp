<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<div class="outer">
		<h3>소모임 모집글 수정하기</h3><br>

		<form action="#">
			<table class="groupEnrollTable">
				<tr>
					<th>제목</th>
					<td><input type="text" ></td>
				</tr>
				<tr>
					<th>썸네일</th>
					<td><input type="text">이거 파일 어케 하더라 기억이 안나</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="" id="" cols="30" rows="10"></textarea>						
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select name="groupArea">
							<option value="S">서울</option>
							<option value="G">경기</option>
							<option value="I">인천</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>장소</th>
					<td>이거 api할 수 있으면 하자</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender">
							<option value="A">무관</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>레벨</th>
					<td>
						<select name="level">
							<option>무관</option>
							<option>초급</option>
							<option>중급</option>
							<option>고급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td><input type="number"></td>
				</tr>
				<tr>
					<th>일시</th>
					<td><input type="date"><input type="date"></td>
				</tr>
			</table>
			<br><br>
			<button>등록하기</button>
		</form>
	</div>
	

</body>
</html>