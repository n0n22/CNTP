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
							                    	<P>${ chat.chatContent }</P>
												</div>	
											</div>
							                
							            </div>
										<div style="display: flex; align-content: flex-end; margin-left: 60px;">
											<p style="margin-top: auto; margin-bottom: 0;">
												<!-- 여긴 날짜 -->
												${ chat.createDate }
												<!-- 여긴 숨기기 버튼 -->
												<button class="hiddenBtn" style="border : 0px; background-color : white" onclick="return confirmBtn('숨김처리')"><mark>숨기기</mark></button>
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
														<P>${ chat.chatContent }</P>
													</form>
												</div>
											</div>
										</div>
										<div class="align-right">
											<div style="display: flex; align-content: flex-end; margin-right: 5px;">
												<p style="margin-top: auto; margin-bottom: 0;">
													<form>
														<!-- 삭제 버튼 -->
														<button class="deleteBtn" style="border : 0px; background-color : white" onclick="return confirmBtn('삭제')"><mark>삭제</mark></button>
														<input type="hidden" name="chatNo" value="${ chat.chatNo }">
														<!-- 여긴 날짜 -->
														${ chat.createDate }
													</form>
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
			// 계속 새로고침해서 채팅 보이게 해주는 메소드
			//setInterval(selectChat, 700);
			selectChattingList();
			$("#chatContent-area").scrollTop($("#chatContent-area")[0].scrollHeight);
			
		})
		
	// enter 치면 insert 되게 만들어줌
	function enterFn(){
        if(window.event.keyCode == 13){
        	insertChatContent();
        };
    }
    
	// 삭제 및 숨기기 확인하는 메소드
	function  confirmBtn(keyword){
		if(confirm(keyword + ' 하시겠습니까?')){
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
				moimNo : '${ chatList[0].moimNo }',
				memNo : '${ loginMember.memNo }'
			},
			success : function(list){
				//console.log('성공?');
				console.log(list);
				var result = '';
				if(list != null){
					// 채팅이 없지 않을 때 => 채팅이 있을 때
					for(var i in list){
							if(list[i].memNo != '${loginMember.memNo}'){
								result +='<div id="chatAlign-other">'
									   +    '<div style="width : 500px," class="align-left">'
							           +        '<div style="max-width: 270px; margin-left: 5px;">'
							           +             '<div style="height : 20px">'
							           +                list[i].nickname
							           +             '</div>'
							           +		     '<div class="speechBubble-other">'
							           +            	'<P>' + list[i].chatContent + '</P>'
							           +		     '</div>'
							           +         '</div>'
							           +     '</div>'
							           +     '<div style="display: flex; align-content: flex-end; margin-left: 60px;">'
							           +         '<p style="margin-top: auto; margin-bottom: 0;">'
							           +             list[i].createDate
							           +			 '<button class="hiddenBtn" style="border : 0px; background-color : white" onclick="return confirmBtn("숨김처리")"><mark>숨기기</mark></button>'	
							           +         '</p>'
							           +     '</div>'
							           + '</div>';
							} else{
								result +='<div id="chatAlign-mine" >'
									   +     '<div class="align-right">'
							           +         '<div style="max-width : 270px">'
							           +             '<div class="speechBubble-mine">'
							           +			     '<form action="deleteChat.mo">'
							           +                     '<P>' + list[i].chatContent  + '</P>'
							           +				 '</form>'
							           +             '</div>'
							           +         '</div>'
							           +     '</div>'
							           +     '<div class="align-right">'
							           +         '<div style="display: flex; align-content: flex-end; margin-right: 5px;">'
							           +             '<p style="margin-top: auto; margin-bottom: 0;">'
							           +			     '<form action="deleteChat.mo" method="post">'
							           +					 '<button class="deleteBtn" style="border : 0px; background-color : white" onclick="return confirmBtn("삭제")"><mark>삭제</mark></button>'
							           +					 '<input type="hidden" name="chatNo" value="' + list[i].chatNo +'">'
							           +                      list[i].createDate
							           +				 '</form>'
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
				$("#chatContent-area").scrollTop($("#chatContent-area")[0].scrollHeight);
				
			},
			error : function(){
				console.log('실패요');
			}
		})
	}
	
	function insertChatContent(){
		$.ajax({
			url : 'insertChat.mo',
			type : 'post',
			data : {
				moimNo : '${ chatList[0].moimNo }',
				memNo : '${ loginMember.memNo }',
				chatContent : $('#chatContent-input').val()
			},
			success : function(result){
				
				console.log(result);
				if(result == 'NNNNY'){
					$('#chatContent-input').val('');
					selectChattingList();
				} else{
					window.alert('잠시 후에 다시 시도해주세요');
				}
			},
			error : function(){
				console.log('실패요');
			}
		})
	}
		
	 
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>