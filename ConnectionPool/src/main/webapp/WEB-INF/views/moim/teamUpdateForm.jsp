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
	<div class="outer">
	
	
	
	    <h3 align="center">팀 정보 수정하기</h3>
	    <br>
	
	    <table align="center">
	        <tr>
	            <th>팀 이름<br>
	            <td>
	                <input type="text" name="teamName" disabled>
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>팀 인원</th>
	            <td>
	                <input type="number" name="teamMember" max="12" min="2">
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>팀 소개</th>
	            <td>
	                <textarea name="teamIntro" cols="30" rows="10" style="resize:none"></textarea>
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>주 활동지역</th>
	            <td>
	                <select name="teamArea">
	                    <option value="S">서울</option>
	                    <option value="G">경기</option>
	                    <option value="I">인천</option>
	                </select>
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>주 활동시간</th>
	            <td>
	                <select name="teamTime">
	                    <option value=""></option>
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
	        <tr>
	            <th>뱃지 등록</th>
	            <td colspan="2">
	                *팀 페이지에서 뱃지 구매 시 사용 가능합니다 <input type="text">
	            </td>
	        </tr>
	        <tr>
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
</body>
</html>