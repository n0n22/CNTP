<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	.groupUpdateTable input[type=text], select, textarea{
		width: 95%;
		height: 100%;
		border: 0px;
		padding: 0px;
	}

	.groupUpdateTable td{
		padding:0px;
	}

	.groupUpdateTable textarea{
		height:100px;
	}

</style>

<title>소모임 모집</title>
</head>

	<jsp:include page="../common/menubar_nosearch.jsp"></jsp:include>

	<div class="outer" align="center">
		
		<h3 align="left">소모임 모집</h3>
		<hr>
		<br>

		<form action="#">
			<table class="groupUpdateTable" border="1">
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
					<td><input type="number" min="2" max="12">명</td>
				</tr>
				<tr>
					<th>일시</th>
					<td>
						<input type="datetime-local" id="startTime"> - <input type="datetime-local" id="endTime">
						<!--후에 5분 단위로 바꿀 수 있다면 바꿔보자-->
					</td>
				</tr>
			</table>
			<br><br>

			<div align="right">
				<button>등록하기</button>
			</div>
			
		</form>
	</div>
	
	<script>
		
		let $startTime = $('#startTime');
		// 이건 현재 시간을 구하는 것인가봅니다 어떻게 했는지 몰라요
		let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);

		let $endTime = $('#endTime');

		//시작날짜를 지금 시각으로 맞춤
		$startTime.val(date);
		$endTime.val(date);
		
		//시작일자의 최소를 현재 날짜로 바꿈
		$('#startTime').attr('min', date);
		
		
		$('#startTime').on('change', function(){
			//끝일자의 값을 최소 일자로 바꿔줌
			$('#endTime').val($('#startTime').val());
			//끝일자의 최소를 시작일자로 바꿈
			$('#endTime').attr('min', $('#startTime').val());
		})

	</script>


</body>
</html>