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

		<h4 align="center">팀을 생성하여 팀원들을 모집하고 배틀에 참가해보세요!</h4>
	
	    <br><br>
	
	    <h3 align="center">팀 만들기 신청</h3>
	    <br>
	
	    <table align="center">
	        <tr>
	            <th>팀 이름<br>*팀 이름은 추후 수정 불가</th>
	            <td>
	                <input type="text" name="teamName">
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
	        <tr>
	            <th>팀 소개</th>
	            <td colspan="2">
	                <textarea rows="5" cols="10" style="resize:none"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <th>파워 등록</th>
	            <td colspan="2">
	                <input type="checkbox"> 파워 등록 시 10P가 소요됩니다.
	            </td>
	        </tr>
	
	    </table>
	    <br><br>
	
	    <div class="TE_point_area" align="center">
	        <p>소요 포인트 : 여기는 jquery로 바꾸자</p>
	        <p>현재 내 포인트 : </p>
	    </div>
	
	    <div class="TE_info_area" align="center">
	        <p>
	            * 팀 생성 시 50P가 차감되며, 팀원 모집 글 작성 시 취소 및 환불이 불가합니다. <br>
	            * 팀장 탈퇴 시 부팀장이 있을 경우 팀장 권한은 부팀장에 승계되며<br>
	            	부팀장 부재 시 팀 가입일시가 가장 빠른 팀원에 팀장 권한이 승계됩니다.<br>
	            * 팀원이 없을 경우 팀장 탈퇴 시 팀은 자동으로 삭제되며 이는 복구가 불가합니다.<br>
	            * 부적절한 팀 활동 시 무통보 삭제 가능
	        </p>
	    </div>
	
	    <br><br><br>
	
	    <div align="center">
	        <input type="checkbox"> 위 내용을 숙지하고 동의합니다. <br><br>
	        	여기도 jquery 추가
	        <a href="#">취소하기</a> <button>팀 생성하기</button>
	    </div>
	
	
	</div>

</body>
</html>