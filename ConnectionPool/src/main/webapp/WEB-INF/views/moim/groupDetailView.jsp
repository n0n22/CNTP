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
		height : 690px;
    }
	
    .margin{
        width:100px;
    }
    
    .groupDetail-wrap{
    	width:1300px;
    	height : 900px;
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
	
	        <div class="left-area" style="border: 1px solid black">
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
	            	<br>
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

				<div class="groupContent" style="width:95%; height:150px;">
					${group.groupContent }
				</div>
	        </div>
	
	        <div class="margin"></div>
	
	        <c:choose>
	        	<c:when test="${ loginMember.memNo ne group.memNo }">
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
						
						<div class="apply-area" align="center">
							<div style="display:inline-block;">
								<form action="chattingRoom.mo" method="post">
									<input type="hidden" name="moimNo" value="${ group.groupNo }">
									<input type="hidden" name="memNo" value="${ loginMember.memNo }">
									<input type="hidden" name="moimMember" value="${ group.groupMember }">
									<input type="hidden" name="moimTitle" value="${ group.groupTitle }">
									<button class="btn btn-primary">채팅하기</button>
								</form>
							</div>
							<div style="display:inline-block;">
								<button class="btn btn-primary">신청/대기/완료</button>
							</div>
						</div>
						
						<br>
			        </div>
			        
			        <br><br>
	        	</c:when>
	        	<c:otherwise>
			        <div class="right-area">
			        	<br><br>
			        	<h4>신청관리</h4>
			        	<table class="table table-hover">
			        		<tr>
			        			<th width="100">닉네임</th>
			        			<th width="80">성별</th>
			        			<th width="80">인기도</th>
			        			<th width="150">요청일시</th>
			        			<th width="150">수락/거절</th>
			        		</tr>
			        		<c:choose>
			        			<c:when test="${ empty applyList }">
			        				<tr>
			        					<td colspan="5" align="center">신청내역이 없습니다.</td>
			        				</tr>
			        			</c:when>
			        			<c:otherwise>
					        		<c:forEach items="${ applyList }" var="ap">
						        		<tr>
						        			<td>${ ap.nickname }</td>
						        			<td>남자</td>
						        			<td>5</td>
						        			<td>${ ap.applyDate }</td>
						        			<td>
						        				<button>수락</button>
						        	            <button>거절</button>
						        			</td>
						        		</tr>
					        		</c:forEach>
			        			</c:otherwise>
			        		</c:choose>
			        		
			        	</table>
			            <br>
						<br>
						<div align="center">
							<div style="display:inline-block;">
								<form action="chattingRoom.mo" method="post">
									<input type="hidden" name="moimNo" value="${ group.groupNo }">
									<input type="hidden" name="memNo" value="${ loginMember.memNo }">
									<input type="hidden" name="moimMember" value="${ group.groupMember }">
									<input type="hidden" name="moimTitle" value="${ group.groupTitle }">
									<button class="btn btn-primary">채팅하기</button>
								</form>
							</div>
							<div style="display:inline-block;">
								<form action="groupUpdateForm.mo">
									<input type="hidden" name="groupNo" value="${ group.groupNo }">
					        		<button class="btn btn-primary">수정하기</button>
								</form>
							</div>
						</div>
			        	
			        </div>
	        	</c:otherwise>
	        </c:choose>
	        
		</div>
    </div>
    
    <br><br>
	

</body>
</html>