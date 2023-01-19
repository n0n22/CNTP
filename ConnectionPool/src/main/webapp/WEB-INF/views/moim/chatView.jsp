<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%--
	해당 모임 번호와 같은 chatting 리스트를 뽑아온다.
	그리고 해당 모임 번호로 모임글에 대한 정보를 들고 와야 함
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .align-left{
        display: flex;
    }
    .align-left-inline{
        display: inline-flex;
    }
    .align-left-side{
        display: flex;
        justify-content: space-between;
    }
    .align-right{
        display: flex;
        flex-direction: row-reverse;
    }
    #chatContent-area{
    	width : 600px;
    	height : 500px;
    	overflow:auto;
    	flex-direction:column_reverse;
    	border: 1px solid lightgray;
		border-radius: 5px;
    
    }
	.speechBubble-other{
		margin-top: 5px;
		background-color: rgb(23, 146, 23);
		border-radius: 15px;
	}
	.speechBubble-other p{
		margin-bottom: 0px;
		padding : 7px;
		color : white;
	}
	.speechBubble-mine{
		margin-top: 5px;
		margin-right: 5px;
		background-color: rgb(231, 235, 30);
		border-radius: 15px;
	}
	.speechBubble-mine p{
		margin-bottom: 0px;
		padding : 7px;
	}
	
	.groupMemberNickname{
		font-size:x-small;
	}
	
	.grade-img, .memberImg{
		border-radius: 50%;
	}
	
	.nicknameFont{
		font-size : medium;
	}
	

</style>

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>
	
	<div class="outer">
		<div align="center">
		    <!-- 전체를 감싸는 div-->
			<div style="width:600px; border-radius:10px; margin:auto; display:inline-block;">
		        <!-- 제목 div -->
		        <div style="display : flex; justify-content: space-between;" id="chatTitleMemberCountArea">
		            <h2>${ moimTitle }</h2>
		            <h5>참여인원 ${ moimMember }명</h5>
		        </div>
		        
				<!-- 소그룹 참여인원 -->
				<!-- 참여자들 닉네임, 등급별 사진 정도 띄어줄까 싶지만,,,,,, 할 수 있음 하자-->
				<c:choose>
					<c:when test="${ not empty chatMemberList }">
			        	<div class="groupMember-info" style="display:inline-block; width:600px; height:60px;" align="left">
				        	<c:forEach items="${ chatMemberList }" var="cm">
				        		<div style="display:inline-block;" onclick="showProfile(event)">
					        		<div style=" width:40px; height:35px;" class="memberImg">
						        		<c:choose>
						        			<c:when test="${ cm.grade eq 'B' }">
							        			<img ingido="${cm.memNo}" title="프로필 보기" class="grade-img" width="35px" height="35px" src="${ pageContext.request.contextPath }/resources/images/beginner.jpg"/>
					        				</c:when>
					        				<c:when test="${ cm.grade eq 'M' }">
							        			<img  ingido="${cm.memNo}" title="프로필 보기" class="grade-img" width="35px" height="35px" src="${ pageContext.request.contextPath }/resources/images/middle.jpg"/>
					        				</c:when>
					        				<c:otherwise>
							        			<img ingido="${cm.memNo}" title="프로필 보기" class="grade-img" width="35px" height="35px" src="${ pageContext.request.contextPath }/resources/images/special.jpg"/>
					        				</c:otherwise>
				        				</c:choose>
					        		</div>
					        		<div style="width:50px; height:15px;" class="memberImg">
					        			<c:choose>
					        				<c:when test="${ fn:contains(moimNo, 'G') }">
							        			<p ingido="${cm.memNo}" title="프로필 보기" class="groupMemberNickname">${ cm.nickName }</p>
					        				</c:when>
					        				<c:otherwise>
							        			<p ingido="${cm.memNo}" title="프로필 보기" class="groupMemberNickname">${ cm.nickname }</p>
					        				</c:otherwise>
					        			</c:choose>
					        		</div>
				        		</div>
				        	</c:forEach>
			        	</div>
		        	</c:when>
		        </c:choose>
		         
		        <div id="chatContent-area">
		        	<c:choose>
		        		<c:when test="${ empty chatList }">
		        		<!-- 아예 채팅이 없을 때 -->
				        	대화가 없습니다.
		        		</c:when>
		        		<c:otherwise>
						<!-- 채팅 리스트가 있을 때 -->
							<c:forEach items="${ chatList }" var="chat">
								<c:choose>
									<c:when test="${ chat.memNo ne loginMember.memNo }">
									<!-- 채팅 작성자와 로그인 유저의 회원번호가 다를 때 == 내 채팅이 아닐 때 -->
									<!-- 대화내용 div-->
									<!-- 좌 우 정렬 정할 div-->
									<!-- 채팅 상태가 숨겨져있지 않을 때 -->
								        <div id="chatAlign-other"> 
								            <div style="width : 500px," class="align-left">
								                <div style="max-width: 270px; margin-left: 5px;">
								                    <div style="height : 20px" onclick="showProfile(event)" align="left">
								                      	<p ingido="${chat.memNo}" title="프로필 보기">${ chat.nickname }</p>
								                    </div>
								                    <div class="speechBubble-other">
								                    	<p>${ chat.chatContent }</p>
													</div>	
												</div>
								                
								            </div>
											<div style="display: flex; align-content: flex-end; margin-left: 60px;">
												<p style="margin-top: auto; margin-bottom: 0;">
													<!-- 여긴 날짜 -->
													${ chat.createDate }
													<!-- 여긴 숨기기 버튼 -->
													<button class="hiddenBtn" style="border : 0px; background-color : white" onclick="return hideBtn()"><mark></mark></button>
												</p>
											</div>
								        </div>
									</c:when>
									<c:otherwise>
							        <!-- 채팅 작성자와 로그인 유저의 회원번호가 같을 때 == 내 채팅일 때 -->
										<div id="chatAlign-mine" >
											<div class="align-right">
												<div style="max-width : 270px">
													<div class="speechBubble-mine">
														<P>${ chat.chatContent }</P>
													</div>
												</div>
											</div>
											<div class="align-right">
												<div style="display: flex; align-content: flex-end; margin-right: 5px;">
													<p style="margin-top: auto; margin-bottom: 0;">
														<!-- 삭제 버튼 -->
														<button class="deleteBtn" style="border : 0px; background-color : white" onclick="return deleteChat('${ chat.chatNo }')"><mark>삭제</mark></button>
														<!-- 여긴 날짜 -->
														${ chat.createDate }
													</p>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
		        		</c:otherwise>
		        	</c:choose>
				</div>
				
		        <!-- 입력 div -->
		        <div class="align-left">
			            <input type="text" class="form-control form-control-lg" id="chatContent-input" onkeyup="enterFn()" required maxlength="150">
			            <button class="btn btn-success" style="width:70px" onclick="insertChatContent();">입력</button>
		        </div>
		        
		        
	    	</div>
	    </div>
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>
	
	$(function(){
			// 계속 새로고침해서 채팅 보이게 해주는 메소드
			setInterval(selectChattingList, 700);
			// 스크롤은 맨 아래로
			//$("#chatContent-area").scrollTop($("#chatContent-area")[0].scrollHeight);
			scrollDown();
		})
		
	function scrollDown(){
		selectChattingList();
		$("#chatContent-area").scrollTop(5000000);
	}
		
	// enter 치면 insert 되게 만들어줌
	function enterFn(){
        if(window.event.keyCode == 13){
        	insertChatContent();
        };
    }
    
	// 삭제 및 숨기기 확인하는 메소드
	function  hideBtn(){
		if(confirm('댓글을 숨기시겠습니까? 해당 댓글은 ${loginMember.memName}님의 화면에서만 숨겨집니다.')){
			return true;
		}else{
			return false;
		}
	}
	
	
	// ajax로 select 해오는 함수
	function selectChattingList(){
		$.ajax({
			url : 'ajaxSelectChatList.mo',
			type : 'post',
			data : {
				moimNo : '${ moimNo }',
				memNo : '${ loginMember.memNo }'
			},
			success : function(list){
				//console.log('성공?');
				//console.log(list);
				var result = '';
				if(list != null){
					// 채팅이 없지 않을 때 => 채팅이 있을 때
					for(var i in list){
							if(list[i].memNo != '${loginMember.memNo}'){
								result +='<div id="chatAlign-other">'
									   +    '<div style="width : 500px," class="align-left">'
							           +        '<div style="max-width: 270px; margin-left: 5px;">'
							           +             '<div style="height : 20px" align="left">'
							           +                '<p class="nicknameFont" ingido="' + list[i].memNo + '" title="프로필 보기" class="groupMemberNickname" onclick="showProfile(event)">' + list[i].nickname + '</p>'
							           +             '</div>'
							           +		     '<div class="speechBubble-other">'
							           +            	'<P>' + list[i].chatContent + '</P>'
							           +		     '</div>'
							           +         '</div>'
							           +     '</div>'
							           +     '<div style="display: flex; align-content: flex-end; margin-left: 60px;">'
							           +         '<p style="margin-top: auto; margin-bottom: 0;">'
							           +             list[i].createDate
							           +			 '<button class="hiddenBtn" style="border : 0px; background-color : white" onclick="return hideBtn()"><mark></mark></button>'
							           +         '</p>'
							           +     '</div>'
							           + '</div>';
							} else{
								result +='<div id="chatAlign-mine" >'
									   +     '<div class="align-right">'
							           +         '<div style="max-width : 270px">'
							           +             '<div class="speechBubble-mine">'
						           +                     '<P>' + list[i].chatContent  + '</P>'
							           +             '</div>'
							           +         '</div>'
							           +     '</div>'
							           +     '<div class="align-right">'
							           +         '<div style="display: flex; align-content: flex-end; margin-right: 5px;">'
							           +             '<p style="margin-top: auto; margin-bottom: 0;">'
							           +				 '<p style="display:none" class="thisChatNo">${ chat.chatNo }</p>'
						               +			     '<button class="deleteBtn" style="border : 0px; background-color : white" onclick="return deleteChat(' + list[i].chatNo + ')"><mark>삭제</mark></button>' 
						               +                  list[i].createDate
							           +             '</p>'
							           +         '</div>'
							           +     '</div>'
							           +'</div>';
							}
						}
					// 채팅이 없을 때
				}else{
					result = '채팅내역이 없습니다.';
				}
				
				$('#chatContent-area').html(result);
			},
			error : function(){
				console.log('실패요');
			}
		})
		
	}
	
	// 댓글 작성하는 메소드
	function insertChatContent(){
		$.ajax({
			url : 'insertChat.mo',
			type : 'post',
			data : {
				moimNo : '${ moimNo }',
				memNo : '${ loginMember.memNo }',
				chatContent : $('#chatContent-input').val()
			},
			success : function(result){
				
				//console.log(result);
				if(result == 'NNNNY'){
					$('#chatContent-input').val('');
					selectChattingList();
				} else{
					window.alert('잠시 후에 다시 시도해주세요');
				}
				
				scrollDown();
			},
			error : function(){
				console.log('실패요');
			}
		})
	}
		
	
	// 자신의 댓글을 삭제하는 메소드
	function deleteChat(thisChatNo){
		if(confirm('정말 삭제하시겠습니까?')){
			$.ajax({
				url : 'deleteChat.mo',
				type : 'post',
				data : {
					chatNo : thisChatNo
				},
				success : function(result){
					if(result == 'NNNNY'){
						selectChattingList();
					} else {
						window.alert('잠시 후에 다시 시도해주세요');
					}
				},
				error : function(){
					console.log('실패요');
				}
			})			
			return true;
		} else{
			return false;
		}
	}
	 
		
	</script>
	
	

</body>
</html>