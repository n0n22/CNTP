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
                                    ${ notice.content }
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
	        <div class="notice-foot">
	            <div class="notice-file">
	                	첨부파일 : <a href="" download="${ originName }">${ originName }</a>
	            </div>
	            <div class="notice-hidden">
	            	<c:if test="${ loginUser.memNo eq notice.memNo }">
		                <button type="button" class="btn btn-sm btn-danger">삭제</button>
		                <a href="noticeUpdateForm.ad" class="btn btn-sm btn-warning">수정</a>
	                </c:if>
	            </div>
	            <div class="notice-list">
	                <button class="btn btn-sm btn-secondary" onclick="history.back();">목록으로</button>
	            </div>
	
	        </div>
        </div>



    </div>




	<jsp:include page="../common/footer.jsp" />





</body>
</html>