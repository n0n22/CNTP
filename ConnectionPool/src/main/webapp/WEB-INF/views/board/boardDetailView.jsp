<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        table * {margin:5px;}
        table {width:100%;}
    </style>
    
</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기페이지</h2>
            <br>


			
            <a class="btn btn-secondary" style="float:right;" href="">목록으로</a>
            <br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${b.title }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td ingido="${b.memberNo}" onclick="showProfile(event)" >${b.memberNo} </td>
                    <th>작성일</th>
                    <td>${b.createDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${b.content }</p></td>
                </tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
					<c:choose>
							<c:when test="${empty b.originName }">
                    			첨부파일이 없어요~~!
                    		</c:when>
							<c:otherwise>
								<!-- download 속성 :다운로드시 파일명 -->
								<a href="${b.changeName }" download="${b.originName }">${b.originName }</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
            <br>
			
			<c:if test="${loginMember.memNo  eq b.memberNo}">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
            </div>
            </c:if>
           
			
			
			<form action="" method="post" id="postForm">
				<input type="hidden" name="bno" value="${b.boardNo }"/>
				<input type="hidden" name="filePath" value="${b.changeName }" />	
			
			</form>
			
			<script>
				function postFormSubmit(num){
					if(num == 1) { //수정하기 클릭 시
						$('#postForm').attr('action','updateForm.bo').submit();
					}else { //삭제하기 클릭 시
						$('#postForm').attr('action', 'delete.bo').submit();
					}
				}
			
			
			</script>
			
			 <br><br>
			 
			
			
			
           <!-- 댓글  -->
            <table id="replyArea" class="table" align="center">
				<thead>
					<c:choose>
						<c:when test="${empty loginMember }">
							<tr>
                        		<th colspan="3">
                            		<textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다</textarea>
                        		</th>
                        		<th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
                    		</tr>
                    	</c:when>
						<c:otherwise>
							<tr>
								<th colspan="3">
								<textarea class="form-control" name=""id="content" cols="55" rows="2" style="resize: none; width: 100%;"></textarea>
								</th>
								<th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addBoardReply();">등록하기</button></th>
							</tr>
						</c:otherwise>
					</c:choose>

					<tr>
						<td colspan="4">${board_reply }<span id="rcount"></span></td>
					</tr>
				</thead>



				<tbody>
					
					<!-- 
                    <tr>
                        <th>user02</th>
                        <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td>2020-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2020-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2020-03-10</td>
                    </tr>
                     -->
                </tbody>
            </table>
            <hr>
	        <div>
	        	<c:if test="${ not empty loginMember }">
	        		<button class="btn btn-sm btn-danger" onclick="openReportForm('board');">신고</button>
	        	</c:if>
        		<form id="reportvalue">
					<input type="hidden" value="" name="memNickName" id="report-memNickName">
					<input type="hidden" value="" name="content" id="report-content">
					<input type="hidden" value="" name="reportBoard" id="report-reportBoard">
					<input type="hidden" value="" name="boardNo" id="report-boardNo">
				</form>
	        </div>
        </div>
        <br><br>

    </div>
    
    <script>
    	
    	$(function(){
    		selectBoardReplyList();
    	});
    
    	function addBoardReply(){ //댓글 작성용 ajax
    		
    		if($('#content').val().trim() != ''){
    			$.ajax({
    				url: 'rinsert.bo',
    				data :{
    					boardNo : ${b.boardNo},
    					commentContent : $('#content').val(),
    					writer : ${loginMember.memNo}
    				},
    				success : function(status){
    					console.log(status);
    				
    					if(status == 'success'){
    						selectBoardReplyList();
    						$('#content').val('');
    					}
    				
    					
    				},
    				error: function(){
    					console.log('실패!!ㅜㅜ');
    				}
    				
    			})
    		}
    		else {
    			alertify.alert('정상적인 댓글을 작성해주세요!!');
    		}
    				
    		}
    		
    	
    
    	
    	function selectBoardReplyList(){
    		$.ajax({
    			url: 'rlist.bo', //게시글에 달린 댓글만 조회. (현재 게시글의 글번호를 넘겨줌.)
    			data: {bno : ${b.boardNo}},
    			success : function(list){
    				console.log(list);
    				
    				let value='';
    				for(let i in list){
    					console.log(list[i].commentContent);
    					value += '<tr>'
							   + '<th>' + list[i].writer  + '</th>'
							   + '<th>' + list[i].commentContent + '</th>'
							   + '<th>' + list[i].commentDate   + '</th>'
							   + '<td><button class="btn btn-sm btn-danger" onclick="openReportForm(' + "'board-reply'" + ', this, ' + list[i].commentNo + ');">신고</button></td>'
							   + '</tr>';
						
    				}
    				
    				$('#replyArea tbody').html(value);
					$('#rcount').text(list.length);
    			},
    			error : function(){
    				console.log('댓글 목록 조회 실패!!ㅜㅜ');
    			}
    		
    		})
    		
    		
    	}
    
    
    
    
    </script>
    
    
    
    <jsp:include page="../common/footer.jsp" />
    
    
    <script>
	

		function openReportForm(div, e, commentNo) {		
			
			
			if (${loginMember.memNo} == ${b.memberNo}) {
				alertify.alert('알림', '본인의 글은 신고할 수 없습니다.', function(){ alertify.success('확인 완료'); });
			} else {
				
				window.open('', '신고', 'width=450,height=300,location=yes,menubar=yes,scrollbar=no');
				
				if(div == 'board') {
					
					$('#report-memNickName').val('${ b.memberNo }'); // 수정 필요
					$('#report-content').val('${ b.content }');
					$('#report-boardNo').val(${ b.boardNo });
					
				} else if (div == 'board-reply') {
					// console.log($(e).parent().prev().prev().prev().text());
					$('#report-memNickName').val($(e).parent().prev().prev().prev().text());
					$('#report-content').val($(e).parent().prev().prev().text());
					$('#report-boardNo').val(commentNo);
					
				}			

				$('#report-reportBoard').val(div);
				
				reportvalue.action = 'reportForm';
				reportvalue.target = '신고';
				reportvalue.method = 'post';
				
				reportvalue.submit();

			}
		};


	</script>
    
    
    
    
</body>
</html>