<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



    <style>

        .notice-title h2 {
            text-align: center;
        }

        .notice-table p {
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 30px;
            padding-right: 30px;
        }

        .notice-foot {
            padding: 15px;
            width: 100%;
            height: 80px;
        }
        
        .notice-foot {
        	text-align: center;
        }

        .notice-foot div {
            display: inline-block;
        }
        
        .notice-foot .notice-file {
            width: 300px;
        }
        
        .notice-foot .notice-hidden {
            text-align: center;
            width: 300px;
        }

        .notice-foot .notice-list {
            width: 35%;
            text-align: 300px;
        }



    </style>


</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp" />


    <div class="outer">

        <div class="notice-title">

            <h2>공지사항</h2>


        </div>
        <div>

            <div class="container">

                <table class="table">
                    <thead>
                        <tr>
                            <td colspan="2" align="right">글번호 ${ notice.noticeNo }  |  조회수 ${ notice.count }  |  작성일시 ${ notice.createDate }</td>
                        </tr>
                        <tr>
                            <th width="20%">제목</th>
                            <th width="80%">${ notice.title }</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="3">
                                <img src="" alt="">
                                <p>
                                	<c:if test="${ not empty notice.changeName }">
	                                	<img src="${ notice.changeName }">
                                	</c:if>
                                	<br>
                                    ${ notice.content }
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
	        <div class="notice-foot">
	        
	        	
	            <div class="notice-file">
	            	<c:choose>
			        	<c:when test="${ not empty notice.originName }">
		                	첨부파일 : <a href="${ notice.changeName }" download="${ notice.originName }">${ notice.originName }</a>
		               	</c:when>
		               	<c:otherwise>
		               		첨부파일이 없습니다.
		               	</c:otherwise>
					</c:choose>
	               	
	            </div>
	            <div class="notice-hidden">
	            	<c:if test="${ loginMember.memNo eq notice.memNo }">
		                <button type="button" class="btn btn-sm btn-danger" onclick="postFormSubmit(1);">삭제</button>
		                <button type="button" class="btn btn-sm btn-warning" onclick="postFormSubmit(2);">수정</button>
	                </c:if>
	            	<form action="" method="post" id="postForm">
	            		<input type="hidden" name="nno" value="${ notice.noticeNo }">
	            		<input type="hidden" name="filePath" value="${ notice.changeName }">
	            	</form>
	            </div>
	            <div class="notice-list">
	                <button class="btn btn-sm btn-secondary" onclick="location.href='list.no'">목록으로</button>
	            </div>
	
	        </div>
        </div>



    </div>




		                
    <script>

	   	function postFormSubmit(num) {
	   		
	   		var msg = ${ notice.noticeNo } + '번 공지사항을 삭제하시겠습니까?'
	   		
	   		if(num == 1) { // 삭제 클릭 시
	   			var check = alertify.confirm(msg, function() {
	   				$('#postForm').attr('action', 'noticeDelete.ad').submit();		
	   			}); 
	   		} else { // 수정 클릭 시
	   			$('#postForm').attr('action', 'noticeUpdateForm.ad').submit();
	   		}
	   		
	   		
	   		// url에서 글번호를 숨기면서 요청을 보낼 수 있음
	   	};
	   
   
    </script>



	<jsp:include page="../common/footer.jsp" />
	
	




</body>
</html>