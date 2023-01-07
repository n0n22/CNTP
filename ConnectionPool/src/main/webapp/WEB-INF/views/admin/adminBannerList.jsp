<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<style>

        * {
            box-sizing: border-box;
        }

        .banner-image {
            padding: 30px;
        }

        .banner-image>div {
            float: left;
            margin: 50px;
        }

        .page-area div {
            width: 33%;
            display: inline-block;
        }

        .banner-btn {
            text-align: left;
            padding-left: 30px;
        }


    </style>





</head>
<body>
	

 	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	
	


    <div class="admin-outer">
        
        <div class="banner-image">
            
            <c:if test="${ not empty list }">
            	<c:forEach var="banner" items="list">
		            <div class="banner-image-container">
		                <div class="img-thumbnail">
		                    <img  width="500" src="${ banner.changeName }">
		                </div>
		                <button type="button" class="btn btn-primary btn-sm btn-block">보이기</button>
		            </div>
            	</c:forEach>            
            </c:if>

            <br clear="both">
        </div>

        <div class="page-area">
            
            <div class="banner-btn">
                <a href="bannerEnrollForm.ad" class="btn btn-primary">등록</a>
            </div>
            <div class="banner-page">
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
            <div class="banner-hidden">

            </div>
            

        </div>



    </div>
	

	<jsp:include page="../common/footer.jsp" />

	



</body>
</html>