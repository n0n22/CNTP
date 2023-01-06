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
		border: 0;
		padding: 0px;
	}

	.groupUpdateTable input:focus, select:focus, textarea:focus{
		border: 0;
	}

	.groupUpdateTable td{
		padding:0;
	}

	.groupUpdateTable th{
		text-align: center;
	}

</style>

<title>소모임 모집</title>
</head>

	<jsp:include page="../common/menubar_nosearch.jsp"></jsp:include>

	<br><br>

	<div class="outer" align="center">
		<div style="width:1300px;">
			<h3 align="left">소모임 글수정</h3>
			<hr>
			<br>

			<form action="#">
				<table class="groupUpdateTable" border="1">
					<tr height="50">
						<th width="200">제목</th>
						<td width="600"><input type="text" style="height:50px" required></td>
					</tr>
					<tr height="50">
						<th>썸네일</th>
						<td><input type="text" style="height:50px"></td>
					</tr>
					<tr height="200">
						<th>내용</th>
						<td>
							<textarea class="groupContent" name="groupContent" style="resize:none; height:200px" maxlength="300" required></textarea>						
							<p>글자수 <span class="count"></span> / 300</p>
						</td>
					</tr>
					<tr height="50">
						<th>지역</th>
						<td>
							<select name="groupArea" style="height:50px">
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
						</td>
					</tr>
					<tr height="50">
						<th>장소</th>
						<td>이거 api할 수 있으면 하자</td>
					</tr>
					<tr height="50">
						<th>성별</th>
						<td>
							<select name="gender" style="height:50px">
								<option value="A">무관</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</td>
					</tr>
					<tr height="50">
						<th>레벨</th>
						<td>
							<select name="level" style="height:50px">
								<option>무관</option>
								<option>초급</option>
								<option>중급</option>
								<option>고급</option>
							</select>
						</td>
					</tr>
					<tr height="50">
						<th>모집인원</th>
						<td><input type="number" min="2" max="12" style="height:50px" required>명</td>
					</tr>
					<tr height="50">
						<th>일시</th>
						<td>
							<input type="datetime-local" id="startTime" required> - <input type="datetime-local" id="endTime" required>
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
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
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

		$(function(){
			$('.groupContent').keyup(function(){

				var $content = $(this).val();

				$('.count').text($content.length);
				
			})
		})

	</script>


</body>
</html>