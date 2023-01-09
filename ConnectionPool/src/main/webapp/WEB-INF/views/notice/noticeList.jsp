<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

	<style>


        .notice-title h2 {
            text-align: center;
        }

        .notice-search {
            display: inline-block;
            width: 29%;
            height: 50px;
        }

        .notice-navi-middle {
            width: 39%;
            display: inline-block;
        }

        .notice-navi-cate {
            width: 29%;
            display: inline-block;
            padding: 10px;
        }

        .notice-navi-cate a {
            margin: 5px;
        }

        .notice-table {
            padding: 15px;
        }

        .notice-table table {
            text-align: center;
        }

        .notice-table .title {
            text-align: left;
        }

        .notice-hidden {
            width: 100%;
            height: 70px;
        }

        .notice-hidden {
            text-align: right;
            padding: 20px;
        }

    </style>




</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp" />


	<div class="outer">   
        <div class="notice-title">

            <h2>공지사항</h2>


        </div>
        <div class="notice-navi">
            <div class="notice-navi-cate">
                <a href="#">전체</a> |
                <a href="#">공지</a> |
                <a href="#">이벤트</a> |
                <a href="#">대회정보</a>
            </div>
            <div class="notice-navi-middle">

            </div>
            <div class="notice-search">
                <form action="#">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="notice-table">
            <div class="container">
                <table class="table table-bordered table-hover" id="noticeTable">
                    <thead>
                        <tr>
                            <th width="10%">번호</th>
                            <th width="15%">카테고리</th>
                            <th width="45%" class="title">제목</th>
                            <th width="20%">작성일</th>
                            <th width="10%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${ not empty list }">
                    		
                    		<c:forEach var="notice" items="list" >
		                        <tr class="clickTr">
		                            <td>${ notice.noticeNo }</td>
		                            <td>${ notice.category }</td>
		                            <td class="title">${ title }</td>
		                            <td>${ notice.createDate }</td>
		                            <td>${ notice.count }</td>
		                        </tr>
                    		
                    		
                    		</c:forEach>
                    	
                    	</c:if>
                       
                    </tbody>
                </table>
            </div>

        </div>

        <div class="notice-hidden">
            <a href="noticeEnrollForm.ad" class="btn btn-sm btn-primary">글작성</a>

        </div>

        <div class="notice-foot">
        	<ul class="pagination">
               	<c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                    	<li class="page-item disabled"><a class="page-link">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item"><a class="page-link" href="list.bo?${ pi.currentPage - 1 }">Previous</a></li>
                    </c:otherwise>
                </c:choose>
                   
                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                   	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ cpage }">${ cpage }</a></li>
                </c:forEach>
                   
				<c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    <li class="page-item disabled"><a class="page-link">Next</a></li>
                    </c:when>
                    <c:otherwise>
	                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
                    </c:otherwise>
                </c:choose>
			</ul>
        </div>


    </div>


	<jsp:include page="../common/footer.jsp" />

	
	<script>
	
	
		$(function() {
			
			
			// 행을 클릭하면 상세보기
			$('#noticeTable tbody .clickTr').click(function() {
				location.href = "detail.no";		
			});
			
			
			
			
		});
	
	
	
	
	
	</script>






</body>
</html>