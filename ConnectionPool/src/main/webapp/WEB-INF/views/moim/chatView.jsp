<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
   body{
		
   }
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

</style>

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>
	
	<div class="outer">
	    <!-- 전체를 감싸는 div-->
		<div style="width:600px; border-radius:10px; margin:auto;">
	        <!-- 제목 div -->
	        <div style="display : flex; justify-content: space-between;" id="chatTitleMemberCountArea">
	            <h2>소모임제목/팀이름</h2>
	            <h5>모집인원 10 / 현재인원  5 </h5>
	        </div>
	        
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
							                    <div style="height : 20px">
							                      		${ chat.nickname }
							                    </div>
							                    <div class="speechBubble-other">
							                    	<input type="hidden" value="회원번호">
							                    	<P>${ chat.chatContent }</P>
												</div>	
											</div>
							                
							            </div>
										<div style="display: flex; align-content: flex-end; margin-left: 60px;">
											<p style="margin-top: auto; margin-bottom: 0;">
												<!-- 여긴 날짜 -->
												${ chat.createDate }
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
													<form action="deleteChat.mo">
														<input type="hidden" value="${ chat.chatNo }">
														<button>삭제</button>
														<P>${ chat.nickname }</P>
													</form>
												</div>
											</div>
										</div>
										<div class="align-right">
											<div style="display: flex; align-content: flex-end; margin-right: 5px;">
												<p style="margin-top: auto; margin-bottom: 0;">
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
	            <input type="text" class="form-control form-control-lg" id="chatContent-input" onkeyup="enterFn()" required>
	            <button class="btn btn-success" style="width:70px" onclick="insertChatContent();">입력</button>
	        </div>
	    </div>
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	<script>
	
	$(function(){
			setInterval(selectChat, 700);
			// 계속 새로고침해서 채팅 보이게 해주는 메소드
			scrollDown();
			// 스크롤을 맨 아래로 내려주는 메소드
			rightClick();
		})
		
		// 처음 스크롤 위치 잡아줌
		function scrollDown(){
			$("#chatContent-area").scrollTop($(document)[0].height);
		}
		
		// enter 치면 insert 되게 만들어줌
		function enterFn(){
	        if(window.event.keyCode == 13){
	        	insertChatContent();
	        };
	    }
	    
	    // 내 꺼는 삭제
	    function rightClick(){
	    	$(document).on('contextmenu', '.speechBubble-mine', function() {
	    		  return false;
	    		});
	    	$(document).on('mousedown', '.speechBubble-mine', function(e){
	    		if(e.button === 2){
					if(window.confirm('해당 내용을 삭제하시겠습니까?')){
						$.ajax({
							url : 'chatDelete.ch',
							data : {
								cno : $(this).children('input').val()
							},
							success : function(){
								selectChat();
							},
							error : function(){
								
							}
						})	
					}
	    		}
	    		
	    	})
	    	
	    	// 이거는 남의 것을 숨기는 것인데, 
	    	// ajax 말고 그냥 속성값을 줘서 없애버리면 어떨까 싶다.
	    	$(document).on('contextmenu', '.speechBubble-other', function() {
	    		  return false;
	    		});
	    	$(document).on('mousedown', '.speechBubble-other', function(e){
	    		if(e.button === 2){
					if(window.confirm('해당 내용을 숨기시겠습니까?')){
						$.ajax({
							url : 'chatHide.ch',
							data : {
								cno : $(this).children('input').val()
							},
							success : function(){
								selectChat();
							},
							error : function(){
								
							}
						})	
					}
	    		}
	    		
	    	})
	    }
	    
	    
	    
	    
	    
	 <!-- 
		function selectChat(){
			$.ajax({
				url : 'chatSelect.ch',
				data : {
					memId : '로그인유저 닉네임',
					cno : 모임번호,
				},
				success : function(list){
					var result = '';
					if(list != null){
						for(var i in list){
							if (list[i].memId != list[i].loginUser) {
								if(list[i].chatStatus == 'N'){
									result +='<div id="chatAlign-other">'
										   +  '<div style="width : 500px," class="align-left">'
								           +     '<div style="width : 50px; margin-left: 5px;">'
								           +         '<img width="50px" height="50px" src="" alt=""> <!-- 등급 이미지-->'
								           
        <!-- 
								           +     '</div>'
								           +     '<div style="max-width: 270px; margin-left: 5px;">'
								           +         '<div style="height : 20px">'
								           +            list[i].memId
								           +         '</div>'
								           +		 '<div class="speechBubble-other">'
								           +         	'<P>' + list[i].chatContent + '</P>'
								           + 			'<input type="hidden" value="' + list[i].chatNo + '">'
								           +		 '</div>'
								           +     '</div>'
								           + '</div>'
								           +     '<div style="display: flex; align-content: flex-end; margin-left: 60px;">'
								           +         '<p style="margin-top: auto; margin-bottom: 0;">'
								           +             list[i].chatCreateDate
								           +         '</p>'
								           +     '</div>'
								           + '</div>';
								}
								
							} else {
								result +='<div id="chatAlign-mine" >'
									   + '<div class="align-right">'
							           +     '<div style="max-width : 270px" class>'
							           +         '<div class="speechBubble-mine">'
							           + '<input type="hidden" value="' + list[i].chatNo + '">'
							           +            '<P>' + list[i].chatContent  + '</P>'
							           +         '</div>'
							           +     '</div>'
							           +  '</div>'
							           +  '<div class="align-right">'
							           +     '<div style="display: flex; align-content: flex-end; margin-right: 5px;">'
							           +         '<p style="margin-top: auto; margin-bottom: 0;">'
							           +         list[i].chatCreateDate
							           +         '</p>'
							           +     '</div>'
							           + '</div>'
							           +'</div>';
					        }
						}
					}else{
						result = '아무고토 없습니당 ㅠㅜ';
					}
					
					$('#chatContent-area').html(result);
					scrollDown();
					
				},
				error : function(){
					console.log('채팅내역조회실패쓰 ㅎㅎㅋ')
				}
			});
		};
		
		function insertChatContent(){
			if($('#chatContent-input').val() != ''){
				$.ajax({
					url : 'chatInsert.ch',
					type : 'post',
					data : {
					 -->
					 <!-- 
						cno : 모임번호,
						memNo : 로그인유저 회원번호,
						content : $('#chatContent-input').val(),
						chatName : '모임제목 또는 팀 제목'
					},
					success : function(result){
						
						$('#chatContent-input').val('');
						selectChat();
						scrollDown();
					},
					error : function(){
						console.log('채팅등록에러지롱~~~~');
					}
				});	
			}
			
		};
		
	</script>
	 -->
	

</body>
</html>