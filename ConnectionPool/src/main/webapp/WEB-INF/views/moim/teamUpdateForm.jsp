<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.teamUpdateFormTable input[type=text], select, textarea{
		width: 95%;
		height: 100%;
		border: 0px;
		padding: 0px;
	}

	.teamUpdateFormTable td{
		padding:0px;
	}

	.teamUpdateFormTable textarea{
		height:100px;
	}
	
	.teamUpdateFormTable th{
		text-align: center;
	}

</style>
</head>


<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br><br>

	<div class="outer">
	
	    <h3 align="center">팀 정보 수정하기</h3>
	    <br>
	
	    <table align="center" border="1" class="teamUpdateFormTable">
	        <tr height="50">
	            <th width="150">팀 이름<br>
	            <td width="300">
					우리팀이름					
	            </td>
	            <td width="150"></td>
	        </tr>
	        <tr height="50">
	            <th>팀 인원</th>
	            <td>
	                <input type="number" name="teamMember" value="" max="12" min="2">명
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>팀 소개</th>
	            <td>
	                <textarea name="teamIntro" style="resize:none"></textarea>
	            </td>
	            <td></td>
	        </tr>
	        <tr height="50">
	            <th>주 활동지역</th>
	            <td>
	                <select name="teamArea">
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
	            <td></td>
	        </tr>
	        <tr height="50">
	            <th>주 활동시간</th>
	            <td>
	                <select name="teamTime">
	                    <option value="weekday">평일</option>
	                    <option value="weekend">주말</option>
	                </select>
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>우리팀 키워드</th>
	            <td colspan="2">
	                <input type="radio" name="keyword" value="battle"> 배틀
	                <input type="radio" name="keyword" value="social"> 친목
	                <input type="radio" name="keyword" value="info"> 정보나눔
	                <input type="radio" name="keyword" value="online"> 온라인모임만
	            </td>
	        </tr>
	        <!-- 이미 파워 등록을 했는지 확인이 필요 -->
	        <tr height="50">
	            <th>뱃지 등록</th>
	            <td colspan="2">
	                *팀 페이지에서 뱃지 구매 시 사용 가능합니다 <input type="text">
	            </td>
	        </tr>
	        <tr height="50">
	            <th>파워등록</th>
	            <td colspan="2">
	                <input type="checkbox" name="powerDuration"> 파워 등록 시 10P가 소요됩니다. 
	            </td>
	        </tr>
	
	    </table>
	    <br><br>
	
	    <div align="center">
	        <a href="#">취소하기</a> <button>수정하기</button>
	    </div>
	
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>