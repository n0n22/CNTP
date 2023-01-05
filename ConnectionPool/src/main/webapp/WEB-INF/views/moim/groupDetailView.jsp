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
        <div class="left-area">
            <table class="groupInfoTable_1">
                <tr>
                    <td>제목이 들어갈 거구여</td>
                </tr>
                <tr>
                    <th>
                        <image></image>
                        사진이 들어갈 것이에요
                    </th>
                </tr>
            </table>
            <table class="groupInfoTable_2">
                <tr>
                    <th>지역</th>
                    <td>제주도</td>
                    <th>모집인원</th>
                    <td>1/10</td>
                    <th>#여자만</th>
                </tr>
                <tr>
                    <th>일시</th>
                    <td colspan="3">2023-01-01 15:00 ~ 18:00</td>
                    <td>#중수</td>
                </tr>
            </table>
        </div>

        <div class="right-area">
            <table>
            	<!-- 이거 할 수 있을진 모르겠다 ㅎㅎ -->
                <tr>프로필 사진이여</tr>
                <tr>닉네임</tr>
                <tr>레벨 :</tr>
                <tr>인기도 : </tr>
            </table>
            <br><br>
            <button>신청하기</button>
            <button>채팅방 입장</button>
        </div>
        
        <div class="right-area">
        	<h6>신청관리</h6>
        	<table>
        		<tr>
        			<th>닉네임</th>
        			<th>성별</th>
        			<th>인기도</th>
        			<th>요청일시</th>
        			<th>수락/거절</th>
        		</tr>
        		<tr>
        			<td>user1</td>
        			<td>남자</td>
        			<td>5</td>
        			<td>2020-01-01</td>
        			<td>
        				<a>수락</a>
        				<a>거절</a>
        			</td>
        		</tr>
        	</table>
        	
        	<button>수정하기</button>
        	<button>채팅입장</button>
        </div>

    </div>

</body>
</html>