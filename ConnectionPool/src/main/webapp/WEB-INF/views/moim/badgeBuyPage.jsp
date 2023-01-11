<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.myPointInfo{
		background-color: antiquewhite;
		border-radius: 5px;
		width: 600px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br><br>

	<div class="outer" align="center">
		<div style="width:1300px;">
			<h3 align="left">뱃지 구매</h3>
			<hr>
			<br><br>
			<h4>뱃지로 우리 팀의 정체성을 표현해보세요</h4>
			<br>
	
			<div class="myPointInfo">
				<br>
				<p>현재 내 포인트 : ${ loginMember.memPoint }</p>
				<p>소요 포인트 : 100</p>
			</div>
	
			<br><br>
			
			<p>
				* 뱃지 구매 시 100P가 차감되며 취소 및 환불이 불가합니다<br>
				* 팀 삭제 및 소멸 시 뱃지 사용 권한 또한 삭제되며 복구 불가합니다.<br>
				* 뱃지 구매 후 팀 페이지 수정 메뉴에서 뱃지 설정 가능합니다.
			</p>
			
			<br>
			
			<div align="center">
		        <input type="checkbox" id="agreeCheck" class="agreeCheck">
		        <label for="agreeCheck">위 내용을 숙지하고 동의합니다.</label> <br><br>
		        <c:choose>
		        	<c:when test="${ loginMember.memPoint >= 100 }">
		        		<form action="updateBadge.mo" method="post">
		        			<input type="hidden" name="teamNo" value="${ loginMember.teamNo }">
		        			<input type="hidden" name="memNo" value="${ loginMember.memNo }">
					        <a class="btn btn-info" href="teamPage.mo?teamNo=${ loginMember.teamNo }">취소하기</a> <button class="btn btn-info" onclick="return checkAgree();">구매하기</button>
		        		</form>
		        	</c:when>
		        	<c:otherwise>
		        		<p>포인트가 부족합니다 ㅠㅠ</p>
		        	</c:otherwise>
		        </c:choose>
		    </div>
		</div>
	</div>
	
	<script>
		function checkAgree(){
			if($('.agreeCheck').is(':checked')){
				return true;
			} else{
				alert('안내사항에 동의해주시기 바랍니다.');
				return false;
			}
		}
	</script>

	<br><br><br>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>