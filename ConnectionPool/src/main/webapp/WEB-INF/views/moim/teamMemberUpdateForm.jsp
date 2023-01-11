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

	<jsp:include page="../common/menubar_nosearch.jsp"></jsp:include>

	<br><br>

	<div class="outer" align="center">

		<div style="width:1300px;">

			<h3 align=left>팀 멤버 권한 수정하기</h3>
			<hr>
	
			<br>
			<form action="teamMemberUpdate.mo" method="post">
				<table border="1" class="table teamMemberUpdateTable">
					<thead class="thead-dark">
						<tr>
							<th width="200">닉네임</th>
							<th width="200">가입일시</th>
							<th width="300">직급선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teamMemberList }" var="tm">
							<tr>
								<td>
									${tm.nickname}
								</td>
								<td>${tm.teamEnrollDate}</td>
								<td>
									팀장<input type="radio" name="leader" class="L" value="${tm.memNo}">
									부팀장<input type="radio" name="subLeader" class="S" value="${tm.memNo}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br><br>
				<div class="teamMeberUpdate-area" align="right"> 
					<a href="teamPage.mo?teamNo=${ loginMember.teamNo }">취소하기</a>
					<input type="hidden" name="teamNo" value="${loginMember.teamNo }">
					<button>수정하기</button>
				</div>
			</form>
		</div>
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			$('input[class=L]').on('change', function(){
				
				var $name = $(this).parent().parent().children().eq(0).text();
				
				$('input[class=S]').each(function(index, option){

					//window.alert($(this).parent().parent().children().eq(0).text());

					if($(this).parent().parent().children().eq(0).text() == $name){
						console.log($(this));
						$(this).attr('disabled' ,'true');
					}
					
					 
					if($(this).parent().parent().children().eq(0).text() != $name){
						console.log($(this));
						$(this).removeAttr('disabled');
					}
				})
			});

			$('input[class=S]').on('change', function(){

				var $name = $(this).parent().parent().children().eq(0).text();
				
				$('input[class=L]').each(function(index, option){

					//window.alert($(this).parent().parent().children().eq(0).text());

					if($(this).parent().parent().children().eq(0).text() == $name){
						console.log($(this));
						$(this).attr('disabled' ,'true');
					}
					
					 
					if($(this).parent().parent().children().eq(0).text() != $name){
						console.log($(this));
						$(this).removeAttr('disabled');
					}
				})
			});
			
			// 팀장일 경우 체크박스 체크
			// 부팀장이 없게 가고 싶을 수도 있기 때문에 일부러 부팀장은 체크하지 않음.
			$('.teamMemberUpdateTable input[class=L]').each(function(index, option){
				if($(this).val() == '${ teamMemberList[0].memNo }'){
					$(this).attr('checked', 'true');
				}
			})
			
			
			
			
			
			
		})
	</script>




</body>
</html>