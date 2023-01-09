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
            <c:choose>
	            <c:when test="${ not empty list }">
	            	<c:forEach var="banner" items="${ list }">
			            <div class="banner-image-container">
			                <div class="img-thumbnail">
			                    <img src="${ banner.changeName }" style="width:400px; height:220px;">
			                </div>
			                <c:if test="${ banner.status eq 'Y'}">
			                	<button type="button" class="btn btn-primary btn-sm btn-block changeBtn" onclick="postFormSubmit(this, 'H')">숨기기</button>
			                	<input type="hidden" value="${ banner.bannerNo }">
			                </c:if>
			                <c:if test="${ banner.status eq 'N'}">
			                	<button type="button" class="btn btn-primary btn-sm btn-block changeBtn" onclick="postFormSubmit(this, 'Y')">보이기</button>
			                	<input type="hidden" value="${ banner.bannerNo }">
			                </c:if>
			            </div>
	            	</c:forEach>            
	            </c:when>
            	<c:otherwise>
            		등록된 배너가 없습니다.
            	</c:otherwise>
            </c:choose>

            <br clear="both">
        </div>
        
        <form method="post" action="" id="postForm">
        	<input type="hidden" value="" id="hiddenValue">
        </form>
        
        
        <script>
        	/*
        	function postFormSubmit(e, status) {
        		
        		console.log($(e).next().val());
        		console.log($('#postForm #hiddenValue'));
        		
        		var msg = $(e).next().val() + '번 배너의 상태를 변경합니다.'
        		
        		if(status == 'Y') {
        			console.log(msg);
        			
        			
        		} else {
        			
        		}
        		
        		var check = alertify.confirm(function() {
	        		$('#postForm #hiddenValue').val(status);
	        		console.log($('#postForm #hiddenValue').val());
	   				$('#postForm').attr('action', 'bannerUpdate.ad').submit();		
	   			}); 
        		
        	}
        */
        
        
        
        
        </script>
        
        

        <div class="page-area">
            
            <div class="banner-btn">
                <a href="bannerEnrollForm.ad" class="btn btn-primary">등록</a>
            </div>
            <div class="banner-page">
            	<c:if test="${ not empty list }">
		        	<ul class="pagination">
		               	<c:choose>
		                	<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="bannerList.ad?${ pi.currentPage - 1 }">&lt;</a></li>
		                    </c:otherwise>
		                </c:choose>
		                   
		                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                	<c:choose>
		                	<c:when test="${ p eq pi.currentPage }">
			                   	<li class="page-item disabled"><a class="page-link" href="bannerList.ad?cpage=${ p }">${ p }</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="bannerList.ad?cpage=${ p }">${ p }</a></li>	
		                	</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                   
						<c:choose>
		                	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
		                    </c:when>
		                    <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="bannerList.ad?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
		                    </c:otherwise>
		                </c:choose>
					</ul>
				</c:if>
            </div>
            <div class="banner-hidden">

            </div>
            

        </div>



    </div>
	

	<jsp:include page="../common/footer.jsp" />

	



</body>
</html>