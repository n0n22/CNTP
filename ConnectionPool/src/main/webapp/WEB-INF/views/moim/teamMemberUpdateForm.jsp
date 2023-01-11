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
			<form action="#">
				<table border="1" class="table">
					<thead class="thead-dark">
						<tr>
							<th width="200">닉네임</th>
							<th width="200">가입일시</th>
							<th width="300">직급선택</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td>일길동</td>
							<td>2020-01-01</td>
							<td>
								팀장<input type="radio" name="L">
								부팀장<input type="radio" name="S">
							</td>
						</tr>
						<tr>
							<td>이길동</td>
							<td>2020-01-01</td>
							<td>
								팀장<input type="radio" name="L">
								부팀장<input type="radio" name="S">
							</td>
						</tr>
						<tr>
							<td>삼길동</td>
							<td>2020-01-01</td>
							<td>
								팀장<input type="radio" name="L">
								부팀장<input type="radio" name="S">
							</td>
						</tr>
					</tbody>
				</table>
				
				<br><br>
				<div class="teamMeberUpdate-area" align="right"> 
					<button>취소하기</button>
					<button>수정하기</button>
				</div>
			</form>
		</div>
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			$('input[name=L]').on('change', function(){
				
				var $name = $(this).parent().parent().children().eq(0).text();
				
				$('input[name=S]').each(function(index, option){

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

			$('input[name=S]').on('change', function(){

				var $name = $(this).parent().parent().children().eq(0).text();
				
				$('input[name=L]').each(function(index, option){

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
		})
	</script>




</body>
</html>