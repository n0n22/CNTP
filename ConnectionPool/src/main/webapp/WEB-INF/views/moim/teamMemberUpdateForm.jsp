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

	<div class="outer" align="center">
		<h3>팀 멤버 권한 수정하기</h3>
		<hr>

		<br>
		<form action="#">
			<table border="1">
				<tr>
					<th width="200">닉네임</th>
					<th width="200">가입일시</th>
					<th width="300">직급선택</th>
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
				<tr>
					<td>사길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				<tr>
					<td>오길동</td>
					<td>2020-01-01</td>
					<td>
						팀장<input type="radio" name="L">
						부팀장<input type="radio" name="S">
					</td>
				</tr>
				
			</table>
			
			<br><br>
			<div class="teamMeberUpdate-area" align="right"> 
				<button>수정하기</button>
			</div>
		</form>
	</div>

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