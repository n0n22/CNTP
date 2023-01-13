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
        width:100px;
    }
    
    .groupDetail-wrap{
    	width:1300px;
    }

	.groupContent{
		background-color: antiquewhite;
		border-radius: 5px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"></jsp:include>

	<br><br>

    <div class="outer" align="center">
    
    	<div class="groupDetail-wrap">
    	
	        <h3 align="left">${group.groupTitle }</h3>
	
	        <hr>
	        <br>
	
	        <div class="left-area">
	            <div class="detailTitle" align="left">
	                <table class="groupInfoTable_1" border="1">
	                    <tr>
	                        <th>
	                            <img width="600px" height="350" src="${ group.changeName }"/>
	                        </th>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="group-info">
	                <table>
	                    <tr>
	                        <td width="250">#지역 ${ group.groupArea }</td>
	                        <td width="250">#모집인원 ${ group.groupMember }</td>
	                    </tr>
	                    <tr>
	                        <td>#성별 ${ group.gender }</td>
	                        <td>#레벨 ${ group.level }</td>
	                    </tr>
	                    <tr>
	                        <td colspan="2"> #${ group.startTime }<br>~${ group.endTime }</td>
	                    </tr>
	                </table>
	            </div>

				<br>

				<div class="groupContent">
					${group.groupContent }
				</div>
	        </div>
	
	        <div class="margin"></div>
	
	        <div class="right-area">

	            <div class="detailTitle" align="left">
	                <table class="groupInfoTable_1" border="1">
	                    <tr>
	                        <th>
	                            <img width="500px" height="350" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg"/>
	                        </th>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="group-info">
	                <table>
	                    <tr>
	                        <td width="150">닉네임</td>
	                        <td width="150">${ group.nickname }</td>
	                    </tr>
	                    <tr>
	                        <td>인기도</td>
	                        <td>${ group.ingido }</td>
	                    </tr>
	                    <tr>
	                        <td>성별</td>
	                        <td>${ group.memGender }</td>
	                    </tr>
	                </table>
	            </div>
	
				<br>
				
				<div class="apply-area" align="right">
					<a href="chattingRoom.mo">채팅하기</a>
					<button>신청/대기/완료</button>
				</div>
				
				<br>
	        </div>
	        
	        <div class="right-area">
	        	<h4>신청관리</h4>
	        	<table class="table table-hover">
	        		<tr>
	        			<th width="100">닉네임</th>
	        			<th width="80">성별</th>
	        			<th width="80">인기도</th>
	        			<th width="150">요청일시</th>
	        			<th width="150">수락/거절</th>
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
	
	        	<a href="chattingRoom.mo">채팅하기</a>
	        	<a href="groupUpdateForm.mo">수정하기</a>
	        </div>
		</div>
    </div>
    
    <br><br>
	

</body>
</html>