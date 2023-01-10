<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

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

		.banner-select {
			width: 200px;
		}

        .banner-btn {
            text-align: left;
            padding-left: 30px;
        }




		.banner-area {
			position: relative;
		}

		.delete-span {
			position: absolute;
			top : 10px;
			right: 10px;
			z-index: 10;
		}

		.delete-span:hover {
			cursor: pointer;
		}


    </style>





</head>
<body>
	

 	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	
	


    <div class="admin-outer">
        <div class="banner-select">
			<form method="get" action="bannerList.ad" id="statusChangeForm">
				<select class="form-control" id="bannerStatus" name="status">
					<option value="Y">메인배너</option>
					<option value="H">숨겨진배너</option>
				</select>
			</form>
        </div>
                
        <div class="banner-image">
            <c:choose>
	            <c:when test="${ not empty list }">
	            	<c:forEach var="banner" items="${ list }">
			            <div class="banner-image-container">
			                <div class="img-thumbnail banner-area">
			                    <img src="${ banner.changeName }" style="width:400px; height:220px;">
								<div class="delete-span" onclick="postFormSubmit(this, 'N');">
									<span class="material-symbols-outlined">
										delete
									</span>
								</div>
								<input type="hidden" value="${ banner.bannerNo }">
			                </div>
			                <c:if test="${ banner.status eq 'Y'}">
			                	<button type="button" class="btn btn-primary btn-sm btn-block changeBtn" onclick="postFormSubmit(this, 'H')">숨기기</button>
			                </c:if>
			                <c:if test="${ banner.status eq 'H'}">
			                	<button type="button" class="btn btn-primary btn-sm btn-block changeBtn" onclick="postFormSubmit(this, 'Y')">보이기</button>
			                </c:if>
							<input type="hidden" value="${ banner.bannerNo }">
			            </div>
	            	</c:forEach>            
	            </c:when>
            	<c:otherwise>
            		등록된 배너가 없습니다.
            	</c:otherwise>
            </c:choose>

            <br clear="both">
        </div>
        
        <form method="post" action="bannerUpdate.ad" id="postForm">
        	<input type="hidden" value="" id="hiddenStatus" name="status">
        	<input type="hidden" value="" id="hiddenBnno" name="bannerNo">
        </form>
        
        
        <script>
        	
        	function postFormSubmit(e, status) {
        		
        		// console.log($(e).next().val());
        		// console.log($('#postForm #hiddenValue'));
        		var bnno = 0;
        		var msg = '';
        		
        		if(status == 'H') { // 숨기기
					bnno = $(e).next().val();
        			msg = bnno + '번 배너를 내립니다.';
        		} 
				else if (status == 'H') { // 보이기
					bnno = $(e).next().val();
					msg = bnno + '번 배너를 띄웁니다.';
				}
				else { // 지우기
					bnno = $(e).next().val();
					msg = bnno + '번 배너를 삭제합니다.';

				}
        		
        		var check = alertify.confirm(msg,function() {
	        		$('#postForm #hiddenStatus').val(status);
	        		$('#postForm #hiddenBnno').val(bnno);
	   				$('#postForm').submit();		
	   			}); 
        		
        	}


			$(function() {

				$('#bannerStatus').change(function() {
					$('#statusChangeForm').submit();
				});

				
				$('#bannerStatus option').each(function() {
					if ($(this).val() == '${status}') {
						$(this).attr('selected', true);
					}
				});
				
				
				

			});
        
        
        
        
        
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
		                    	<li class="page-item"><a class="page-link" href="bannerList.ad?status=${ status }&cpage=${ pi.currentPage - 1 }">&lt;</a></li>
		                    </c:otherwise>
		                </c:choose>
		                   
		                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                	<c:choose>
		                	<c:when test="${ p eq pi.currentPage }">
			                   	<li class="page-item disabled"><a class="page-link" href="bannerList.ad?status=${ status }&cpage=${ p }">${ p }</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="bannerList.ad?status=${ status }&cpage=${ p }">${ p }</a></li>	
		                	</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                   
						<c:choose>
		                	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
		                    </c:when>
		                    <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="bannerList.ad?status=${ status }&cpage=${ pi.currentPage + 1 }">&gt;</a></li>
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