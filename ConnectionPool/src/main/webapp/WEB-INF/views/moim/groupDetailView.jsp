<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	                        <td width="250">#지역 ${ group.korArea }</td>
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
			        <div class="right-area" style="border:1px solid black;">
		
			            <div class="detailTitle" align="left">
			            	
			                <table class="groupInfoTable_1" border="1">
			                    <tr>
			                        <th>
			                        	<c:choose>
			                        		<c:when test="${ group.grade eq '초급' }">
			                        			<img width="500px" height="350" src="${ pageContext.request.contextPath }/resources/images/beginner.jpg"/>
			                        		</c:when>
			                        		<c:when test="${ group.grade eq '중급' }">
			                        			<img width="500px" height="350" src="${ pageContext.request.contextPath }/resources/images/middle.jpg"/>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<img width="500px" height="350" src="${ pageContext.request.contextPath }/resources/images/special.jpg"/>
			                        		</c:otherwise>
			                        	</c:choose>
			                        </th>
			                    </tr>
			                </table>
			            </div>
						<br>
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
			                    <tr>
			                        <td>등급</td>
			                        <td>${ group.grade }</td>
			                    </tr>
			                </table>
			            </div>
						<br><br>
						
						<div class="apply-area" align="center">
							<div style="display:inline-block;" id="change-area">
								<c:choose>
									<c:when test="${ empty loginMember }">
										<!-- 로그인이 안 되어 있을 때는 무조건 -->
										<a class="btn btn-primary" style="width:200px" href="loginForm.me">로그인 후<br>이용 가능합니다.</a>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ fn:contains(group.groupMember, '모집마감') }">
												<!-- 로그인 되어 있고 모집이 다 되었을 때 -->
												<button class="btn btn-primary" disabled>모집 완료</button>
											</c:when>
											<c:when test="${ deadLine eq 'expired' }">
												<!-- 로그인이 되어 있고 모집 기간이 지났을 때 -->
												<button class="btn btn-primary" disabled>모집 기간 만료</button>
											</c:when>
											<c:otherwise>
												<!-- 로그인이 되어 있고 모집중일 때 -->
												<c:choose>
													<c:when test="${ group.level ne '무관' and loginMember.grade ne engLevel}">
													<!-- 등급 조건이 맞지 않을 때 -->
														<p>레벨 조건이 맞지 않습니다.</p>
														<button disabled class="btn btn-primary">신청불가</button>
													</c:when>
													<c:when test="${ group.gender ne '무관' and loginMember.gender ne engGender }">
														<p>성별 조건이 맞지 않습니다.</p>
														<button disabled class="btn btn-primary">신청불가</button>
													</c:when>
													<c:otherwise>
														<form action="insertApply.mo" method="post">
															<input type="hidden" name="memNo" value="${ loginMember.memNo }">
															<input type="hidden" name="moimNo" value="${ group.groupNo}">
															<button class="btn btn-primary">신청하기</button>
														</form>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
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
			        			<th width="150">요청일시</th>
			        			<th width="200">수락/거절</th>
			        		</tr>
			        		<c:choose>
			        			<c:when test="${ fn:contains(group.groupMember, '모집마감') }">
			        			<!-- 모집 인원을 모두 채웠을 때 -->
			        				<tr>
			        					<td colspan="5" align="center">모두 모집하였습니다.</td>
			        				</tr>
			        			</c:when>
			        			<c:otherwise>
			        			<!-- 아직 모집중일 때 -->
					        		<c:choose>
					        			<c:when test="${ empty applyList }">
					        			<!-- 신청 내역이 없을 때 -->
					        				<tr>
					        					<td colspan="5" align="center">신청내역이 없습니다.</td>
					        				</tr>
					        			</c:when>
					        			<c:otherwise>
					        			<!-- 신청 내역이 있을 때 -->
							        		<c:forEach items="${ applyList }" var="ap">
								        		<tr>
								        			<td><p ingido="${ap.memNo}" title="프로필 보기" onclick="showProfile(event)">${ ap.nickname }</p></td>
								        			<td>${ ap.applyDate }</td>
								        			<td>
								        				<div style="display:inline-block;">
								        					<form action="updateApply.mo" method="post">
								        						<input type="hidden" name="applyNo" value="${ ap.applyNo }">
								        						<input type="hidden" name="moimNo" value="${ group.groupNo }">
										        	            <button class="btn btn-primary" onclick="return confirmDecision('수락')">수락</button>
								        					</form>
								        				</div>
								        				<div style="display:inline-block;">
								        					<form action="deleteApply.mo">
												 				<input type="hidden" name="moimNo" value="${ group.groupNo }">
												 				<input type="hidden" name="memNo" value="${ ap.memNo }">
												 				<button class="btn btn-primary" onclick="return confirmDecision('거절')">거절</button>
								        					</form>
								        				</div>
								        			</td>
								        		</tr>
							        		</c:forEach>
					        			</c:otherwise>
					        		</c:choose>
			        			</c:otherwise>
			        		</c:choose>
			        		
			        	</table>
			            <br>
						<br>
						<div align="center">
							<div style="display:inline-block;">
								<form action="deleteGroup.mo">
									<input type="hidden" name="groupNo" value="${ group.groupNo }">
					        		<button class="btn btn-primary" onclick="return confirmDecision('삭제')">삭제하기</button>
								</form>
							</div>
							<div style="display:inline-block;">
								<form action="groupUpdateForm.mo">
									<input type="hidden" name="groupNo" value="${ group.groupNo }">
					        		<button class="btn btn-primary">수정하기</button>
								</form>
							</div>
							<div style="display:inline-block;">
								<form action="chattingRoom.mo" method="post">
									<input type="hidden" name="moimNo" value="${ group.groupNo }">
									<input type="hidden" name="memNo" value="${ loginMember.memNo }">
									<input type="hidden" name="moimMember" value="${ group.groupMember }">
									<input type="hidden" name="moimTitle" value="${ group.groupTitle }">
									<button class="btn btn-primary">채팅하기</button>
								</form>
							</div>
						</div>
			        	
			        </div>
	        	</c:otherwise>
	        </c:choose>
	        
		</div>
    </div>
    
    <br><br>
    
    <c:choose>
	    <c:when test="${ not empty loginMember and deadLine ne 'expired' and fn:contains(group.groupMember, '/')}">
	    	<script>
	    		$(function(){
	    			$.ajax({
	    				url : "selectGroupApply.mo",
	    				success : function(obj){
	    					
	    					var result = '';
	    					
	    					//console.log(obj);
	    					//console.log(obj.acceptYn);
	    					
	    					if(obj == null || obj.length == 0){
	    						/*result += '<form action="insertApply.mo" method="post">'
	    									+	'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
	    									+	'<input type="hidden" name="moimNo" value="${ group.groupNo}">'
	    									+	'<button class="btn btn-primary">신청하기</button>'
	    									+'</form>';
	    						$('#change-area').html(result);*/
	    					} else{
	    						if(obj.acceptYn == 'Y'){
	    							result += '<div style="display:inline-block;">'
	    									+ 	'<form action="chattingRoom.mo" method="post">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<input type="hidden" name="moimMember" value="${ group.groupMember }">'
											+ 			'<input type="hidden" name="moimTitle" value="${ group.groupTitle }">'
											+ 			'<button class="btn btn-primary">채팅하기</button>'
											+ 	'</form>'
											+ '</div>'
											+ '<div style="display:inline-block; width:10px;"></div>'
											+ '<div style="display:inline-block;">'
											+ 	'<form action="deleteApply.mo" method="post">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<button class="btn btn-primary" onclick="return confirmCancel()">참여 취소하기</button>'
											+ 	'</form>'
											+ '</div>';
	    							$('#change-area').html(result);
	    						}
	    						else {
	    							//console.log('왜 안들어와');
	    							result += '<div>'
											+ '<p>현재 신청 대기중입니다.</p>'
	    									+ '<form action="deleteApply.mo">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<button class="btn btn-primary" onclick="return confirmApplyCancel()">신청 취소하기</button>'
											+ 	'</form>'
											+ '</div>'
	    							$('#change-area').html(result);
	    						}
	    					}
	    				},
	    				error : function(){
	    					console.log('실패');
	    				},
	    				data : {
	    					moimNo : '${ group.groupNo }',
	    					memNo : '${ loginMember.memNo }'
	    				}
	    			})
	    		})
	    	</script>
	    </c:when>
	    <c:when test="${ not empty loginMember }">
	    	<script>
	    		$(function(){
	    			$.ajax({
	    				url : "selectGroupApply.mo",
	    				success : function(obj){
	    					
	    					var result = '';
	    					
	    					//console.log(obj);
	    					//console.log(obj.acceptYn);
	    					
	    					if(obj == null || obj.length == 0){
	    						
	    					} else{
	    						if(obj.acceptYn == 'Y'){
	    							result += '<div style="display:inline-block;">'
	    									+ 	'<form action="chattingRoom.mo" method="post">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<input type="hidden" name="moimMember" value="${ group.groupMember }">'
											+ 			'<input type="hidden" name="moimTitle" value="${ group.groupTitle }">'
											+ 			'<button class="btn btn-primary">채팅하기</button>'
											+ 	'</form>'
											+ '</div>'
											+ '<div style="display:inline-block; width:10px;"></div>'
											+ '<div style="display:inline-block;">'
											+ 	'<form action="deleteApply.mo" method="post">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<button class="btn btn-primary" onclick="return confirmCancel()">참여 취소하기</button>'
											+ 	'</form>'
											+ '</div>';
	    							$('#change-area').html(result);
	    						}
	    						else {
	    							result += '<div>'
											+ '<p>모집 마감되었습니다..</p>'
	    									+ '<form action="deleteApply.mo">'
											+ 			'<input type="hidden" name="moimNo" value="${ group.groupNo }">'
											+ 			'<input type="hidden" name="memNo" value="${ loginMember.memNo }">'
											+ 			'<button class="btn btn-primary" onclick="return confirmApplyCancel()">신청 취소하기</button>'
											+ 	'</form>'
											+ '</div>'
	    							$('#change-area').html(result);
	    						}
	    					}
	    				},
	    				error : function(){
	    					console.log('실패');
	    				},
	    				data : {
	    					moimNo : '${ group.groupNo }',
	    					memNo : '${ loginMember.memNo }'
	    				}
	    			})
	    		})
	    	</script>
	    </c:when>
    </c:choose>
    
    
    
    
    
    
    <script>
    	function confirmCancel(){
    		 if(confirm('정말 소모임 참여를 취소하시겠습니까?')){
    			 return true;
    		 } else{
    			 return false;
    		 }
    		 
    	}
    	
    	function confirmApplyCancel(){
    		 if(confirm('정말 신청 취소하시겠습니까?')){
    			 return true;
    		 } else{
    			 return false;
    		 }
    		 
    	}
    	
    	function confirmDecision(keyword){
    		if(confirm('정말 ' + keyword + '하시겠습니까?')){
    			return true;
    		} else{
    			return false;
    		}
    	}
    </script>
	

</body>
</html>