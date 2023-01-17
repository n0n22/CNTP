<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	.groupEnrollTable input[type=text], select, textarea{
		width: 95%;
		height: 100%;
		border: 0;
		padding: 0px;
	}

	.groupEnrollTable input:focus, select:focus, textarea:focus{
		border: 0;
	}

	.groupEnrollTable td{
		padding:0;
	}

	.groupEnrollTable th{
		text-align: center;
	}

</style>

<title>소모임 모집</title>
</head>

	<jsp:include page="../common/menubar_nosearch.jsp"></jsp:include>

	<br><br>

	<div class="outer" align="center">
		<div style="width:1300px;">
			<h3 align="left">소모임 글작성</h3>
			<hr>
			<br>

			<form action="insertGroup.mo" method="post" enctype="multipart/form-data">
				<table class="groupEnrollTable" border="1">
					<tr height="50">
						<th width="200">제목</th>
						<td width="600"><input type="text" style="height:50px" name="groupTitle" required></td>
					</tr>
					<tr height="50">
						<th>썸네일</th>
						<td><input type="file" style="height:50px" name="upfile" required></td>
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
								<option value="all">전체</option>
								<option value="Seoul">서울특별시</option>
								<option value="Gyeonggi">경기도</option>
								<option value="Gangwon">강원도</option>
								<option value="Chungbuk">충청북도</option>
								<option value="Chungnam">충청남도</option>
								<option value="Jeonbuk">전라북도</option>
								<option value="Jeonnam">전라남도</option>
								<option value="Gyeongbuk">경상북도</option>
								<option value="Gyeongnam">경상남도</option>
							</select>
						</td>
					</tr>
					<tr height="50">
						<th>장소</th>
						<td>
							<input type="text" name="place" maxlength="15">
						</td>
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
								<option value="E">무관</option>
								<option value="B">초급</option>
								<option value="M">중급</option>
								<option value="S">고급</option>
							</select>
						</td>
					</tr>
					<tr height="50">
						<th>모집인원</th>
						<td><input type="number" min="2" max="12" style="height:50px" name="groupMember" required>명</td>
					</tr>
					<tr height="50">
						<th>일시</th>
						<td>
							<input type="datetime-local" id="startTime" name="startTime" onchange="setMinValue1()" required> - <input type="datetime-local" id="endTime" name="endTime" onchange="setMinValue2()" required>
							<!--후에 5분 단위로 바꿀 수 있다면 바꿔보자-->
						</td>
					</tr>
					<tr>
						<th>파워등록</th>
			            <td colspan="2">
			            	<c:choose>
			            		<c:when test="${ loginMember.memPoint >= 10 }">
					                <input type="checkbox" id="powerDuration" class="powerDuration" name="powerDuration" value="true"> 
					                <label for="powerDuration"> 파워 등록 시 10P가 소요됩니다. </label> 
			            		</c:when>
			            		<c:otherwise>
			            			<input type="checkbox" id="powerDuration" class="powerDuration" name="powerDuration" disabled> 
					                <label for="powerDuration"> 파워 등록 시 10P가 소요됩니다. </label> 
			            		</c:otherwise>
			            	</c:choose>
		            	</td>
					</tr>
				</table>
				<br><br>

				<div align="center">
					<p>* 지역, 성별, 레벨은 이미 다른 참여자가 있을 경우 변동이 어려우니<br>신중하게 선택해주십시오.</p>
				
					<button class="btn btn-primary">등록하기</button>
				</div>
				<input type="hidden" name="memNo" value="${ loginMember.memNo }">
			</form>
		</div>
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		
		let $startTime = $('#startTime');
		let $endTime = $('#endTime');

		// 이건 현재 시간을 구하는 것인가봅니다 어떻게 했는지 몰라요
		let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);

		console.log(date);
		
		//시작날짜를 지금 시각으로 맞춤
		$startTime.val(date);
		$endTime.val(date);
		
		//시작일자의 최소를 현재 날짜로 바꿈
		$startTime.attr('min', date);
		
		
		$startTime.on('change', function(){
			//끝일자의 값을 최소 일자로 바꿔줌
			$endTime.val($('#startTime').val());
			//끝일자의 최소를 시작일자로 바꿈
			$endTime.attr('min', $('#startTime').val());
		})

		$(function(){
			$('.groupContent').keyup(function(){

				var $content = $(this).val();

				$('.count').text($content.length);
				
			})
		})
		
		function setMinValue1() {
			if($startTime.val() < date){
				alert('현재 시간보다 이전의 시간은 설정할 수 없습니다.');
				$startTime.val(date);
			}
		}
		
		function setMinValue2(){
			if($endTime.val() < $startTime.val()){
				alert('시작 시간보다 이전의 시간은 설정할 수 없습니다.');
				$endTime.val($('#startTime').val());
			}
		}

	</script>


</body>
</html>