<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .left-area, .right-area, .margin{
		float : left;
		height : 650px;
		border : 1px solid black;
    }
	
    .margin{
        width:50px;
    }
    
    .groupDetail-wrap{
    	width:1000px;
    }

	.groupContent{
		background-color: antiquewhite;
		border-radius: 5px;
	}

</style>
</head>
<body>
    <div class="outer" align="center">
    
    	<div class="groupDetail-wrap">
    	
	        <h3 align="left">제목 들어가기</h3>
	
	        <hr>
	        <br>
	
	        <div class="left-area">
	            <div class="detailTitle" align="left">
	                <table class="groupInfoTable_1" border="1">
	                    <tr>
	                        <th>
	                            <img width="550px" height="350" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg"/>
	                        </th>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="group-info">
	                <table>
	                    <tr>
	                        <td width="150">#지역 제주도</td>
	                        <td width="150">#모집인원 1/10</td>
	                    </tr>
	                    <tr>
	                        <td>#여자만</td>
	                        <td>#중수레벨</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2"> #2023-01-10 15:00</td>
	                    </tr>
	                </table>
	            </div>

				<br>

				<div class="groupContent">
					어쩌고저쩌고 내용이들어가 있습니다.<br>
					어쩌고저쩌고 내용이들어가 있습니다.<br>
					어쩌고저쩌고 내용이들어가 있습니다.<br>
					어쩌고저쩌고 내용이들어가 있습니다.<br>
					어쩌고저쩌고 내용이들어가 있습니다.<br>
				</div>
	        </div>
	
	        <div class="margin"></div>
	
	        <div class="right-area">

	            <div class="detailTitle" align="left">
	                <table class="groupInfoTable_1" border="1">
	                    <tr>
	                        <th>
	                            <img width="350px" height="350" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg"/>
	                        </th>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="group-info">
	                <table border="1">
	                    <tr>
	                        <td width="150">닉네임</td>
	                        <td width="150">꾸꾸리삐</td>
	                    </tr>
	                    <tr>
	                        <td>인기도</td>
	                        <td>4</td>
	                    </tr>
	                    <tr>
	                        <td>성별</td>
	                        <td>여성</td>
	                    </tr>
	                </table>
	            </div>
	
				<br>
				
				<div class="apply-area" align="right">
					<button>채팅하기</button>
					<button>신청/대기/완료</button>
				</div>
				
				<br>
	        </div>
	        
	        <div class="right-area">
	        	<h4>신청관리</h4>
	        	<table border="1">
	        		<tr>
	        			<th width="80">닉네임</th>
	        			<th width="50">성별</th>
	        			<th width="50">인기도</th>
	        			<th width="100">요청일시</th>
	        			<th width="100">수락/거절</th>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td>user1</td>
	        			<td>남자</td>
	        			<td>5</td>
	        			<td>2020-01-01</td>
	        			<td>
	        				<button>수락</button>
	        	            <button>거절</button>
	        			</td>
	        		</tr>
	        	</table>
	        	
	            <br>
	
	        	<button>채팅입장</button>
	        	<button>수정하기</button>
	        </div>
		</div>
    </div>

</body>
</html>