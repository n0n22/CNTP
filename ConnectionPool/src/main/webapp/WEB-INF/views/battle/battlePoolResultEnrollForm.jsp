<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀 결과 작성폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.outer {
		background-color:rgb(247, 245, 245);
		width:80%;
		margin:auto;
	}
	.innerOuter {
		border:1px solid lightgray;
		width:80%;
		margin:auto;
		padding:5% 10%;
		background-color:white;
	}

	#enrollForm>table {width:100%;}
	#enrollForm>table * {margin:5px;}
</style>

</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	<div class="outer">

		<br><br>
        <div class="innerOuter">
            <h2 align="center">배틀 결과 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="">
                <table algin="center">
                    <tr>
                        <th>경기결과</th>
                        <td>승리팀 <select id="victory"><option value="A">팀A</option><option value="B">팀B</option></select></td>
                        <td>패배팀 <select id="defeat"><option value="A">팀A</option><option value="B">팀B</option></select></td>
                    </tr>
                    <tr>
                        <th><label>승리팀</label></th>
                        <td colspan="2">
							<table>
								<thead>
									<tr>
										<th>선수</th>
										<th>종목</th>
										<th>기록</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>

								</tbody>

							</table>
						</td>
                    </tr>
                    <tr>
                        <th><label>패배팀</label></th>
                        <td colspan="2">
							<table>
								<thead>
									<tr>
										<th>선수</th>
										<th>종목</th>
										<th>기록</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="text"></td>
										<td><input type="text"></td>
									</tr>

								</tbody>

							</table>
						</td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
	</div>
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			$('#victory').change(function(){
				var $a =  $('#victory').val();
				var $victory = $('#victory:first-child').val();
				var $defeat = $('#victory:last-child').val();
				var $switch = $('#victory').val() != $victory ? $victory : $defeat;
				console.log($switch)
				$('#defeat').val($switch);
			})
			

		})
	</script>




</body>
</html>