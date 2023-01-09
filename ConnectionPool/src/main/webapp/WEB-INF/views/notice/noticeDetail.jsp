<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.cntp.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Member loginMember = new Member();
	loginMember.setMemNo(1);
	loginMember.setMemId("admin");
	loginMember.setGrade("A");
	
	request.setAttribute("loginMember", loginMember);
	
	// System.out.println(loginMember);
%>
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
		                <button type="button" class="btn btn-sm btn-danger">삭제</button>
		                <a href="noticeUpdateForm.ad?nno=${ notice.noticeNo }" class="btn btn-sm btn-warning">수정</a>
	                </c:if>
	            </div>
	            <div class="notice-list">
	                <button class="btn btn-sm btn-secondary" onclick="location.href='list.no'">목록으로</button>
	            </div>
	
	        </div>
        </div>



    </div>




	<jsp:include page="../common/footer.jsp" />





</body>
</html>