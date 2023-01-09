<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



    <style>


        .notice-title h2 {
            text-align: center;
        }

    
        .notice-enroll {
            padding: 20px;
        }

        .notice-enroll .editor {
            width: 700px;
            height: 300px;
            padding: 10px;
            resize: none;
        }

        input[type=text] {
            width: 700px;
            padding: 10px;
        }


    </style>



</head>
<body>


	<jsp:include page="../common/menubar_nosearch.jsp" />


    <div class="outer">

        <div class="notice-title">

            <h2>공지사항 수정</h2>


        </div>
        <div class="notice-enroll">
        	<form method="post" action="noticeUpdate.ad" enctype="multipart/form-data">
        		<input type="hidden" name="memNo" value="${ loginMember.memNo }">
        		<input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
	            <div class="container">
	                <table class="table table-bordered">
	                    <tbody>
	                        <tr>
	                            <th>카테고리</th>
	                            <td>
	                                <select name="category">
	                                    <option class="cate" value="공지">공지</option>
	                                    <option class="cate" value="이벤트">이벤트</option>
	                                    <option class="cate" value="대회정보">대회정보</option>
	                                </select>
	                            
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>제목</th>
	                            <td><input type="text" name="title" value="${ notice.title }"></td>
	                        </tr>
	                        <tr>
	                            <th>내용</th>
	                            <td>
	                                <textarea class="editor" name="content">${ notice.content }</textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<td colspan="2">
		                        	<input type="file" name="reUpfile">
					            	<c:choose>
							        	<c:when test="${ not empty notice.originName }">
						                	첨부파일 : <a href="${ notice.changeName }" download="${ notice.originName }">${ notice.originName }</a>
						               	</c:when>
						               	<c:otherwise>
						               		첨부파일이 없습니다.
						               	</c:otherwise>
									</c:choose>
	                        	</td>
							</tr>
	
	                    </tbody>
	                  
	                </table>
	        	</div>
	        	
        		<div class="enroll-btn-area">
	                <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
	                <button type="submit" class="btn btn-primary">수정</button>
	            </div>
        	
        	
        	</form>
        
        
        </div>


    </div>


	<jsp:include page="../common/footer.jsp" />

	
	<script>
	
		$(function() {
			
			$('.cate').each(function(){
				if($(this).val() == '${ notice.category }') {
					// console.log($(this));
					$(this).attr('selected', true);
				}
				
			});
			
			
		});
	
	
	
	</script>
	
	
	

</body>
</html>