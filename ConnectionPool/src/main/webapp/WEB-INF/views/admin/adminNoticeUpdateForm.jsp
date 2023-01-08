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
        	<form method="post" action="noticeUpdate.ad">
        	
	            <div class="container">
	                <table class="table table-bordered">
	                    <tbody>
	                        <tr>
	                            <th>카테고리</th>
	                            <td>
	                                <select name="category">
	                                    <option value="notice">공지</option>
	                                    <option value="event">이벤트</option>
	                                    <option value="competition">대회정보</option>
	                                </select>
	                            
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>제목</th>
	                            <td><input type="text" name="title">${ notice.title }</td>
	                        </tr>
	                        <tr>
	                            <th>내용</th>
	                            <td>
	                                <textarea class="editor" name="content">${ notice.content }</textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>첨부파일</th>
	                            <td><input type="file" name="upfile"></td>
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
			
			$('option').each(function(){
				if($(this).val() == ${ notice.category }) {
					$(this).attr('selected', true);
				}
				
			});
			
			
		});
	
	
	
	</script>
	
	
	

</body>
</html>