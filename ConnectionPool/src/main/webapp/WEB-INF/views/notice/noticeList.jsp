<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

		
		input[type=radio] {
			display : none;
		}
		
		label {
			padding : 5px 10px;
		}
		
		input[type=radio]:hover + label:hover {
			cursur: pointer;
		}
		
		input[type=radio]:checked + label {
			color :blue;
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
            <form action="list.no" method="get" id="noticeForm">
	            <div class="notice-navi-cate">
	            	<input type="radio" name="cate" value="all" id="cate1" onchange="$('#noticeForm').submit();"><label for="cate1">전체</label> |
	            	<input type="radio" name="cate" value="공지" id="cate2" onchange="$('#noticeForm').submit();"><label for="cate2">공지</label> |
	            	<input type="radio" name="cate" value="이벤트" id="cate3" onchange="$('#noticeForm').submit();"><label for="cate3">이벤트</label> |
	            	<input type="radio" name="cate" value="대회정보" id="cate4" onchange="$('#noticeForm').submit();"><label for="cate4">대회정보</label> |
	            </div>
	            <div class="notice-navi-middle">
	
	            </div>
	            <div class="notice-search">
	                    <div class="input-group mb-3">
	                        <input type="text" class="form-control" placeholder="제목 키워드 입력" value="${ keyword }" name="keyword">
	                        <div class="input-group-append">
	                            <button class="btn btn-primary" type="submit">검색</button>
	                        </div>
	                    </div>
	            </div>
            </form>
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
                    		<c:forEach var="notice" items="${ list }" >
		                        <tr class="clickTr">
		                            <td>${ notice.noticeNo }</td>
		                            <td>${ notice.category }</td>
		                            <td class="title">${ notice.title }</td>
		                            <td>${ notice.createDate }</td>
		                            <td>${ notice.count }</td>
		                        </tr>
                    		</c:forEach>
                    	</c:if>
                       
                    </tbody>
                </table>
            </div>

        </div>
		
		<c:if test="${ loginMember.grade eq 'A' }">
	        <div class="notice-hidden">
	            <a href="noticeEnrollForm.ad" class="btn btn-sm btn-primary">글작성</a>
	        </div>
		</c:if>

        <div class="notice-foot">
        	<div class="page-area">
	        	<ul class="pagination" align="center">
	               	<c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.no?cate=${ cate }&keyword=${ keyword }&cpage=${ pi.currentPage - 1 }">&lt;</a></li>
	                    </c:otherwise>
	                </c:choose>
	                
	               
	                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                <c:choose>
		                	<c:when test="${ pi.currentPage eq p }">
		                   		<li class="page-item disabled"><a class="page-link" href="list.no?cate=${ cate }&keyword=${ keyword }&cpage=${ p }">${ p }</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="list.no?cate=${ cate }&keyword=${ keyword }&cpage=${ p }">${ p }</a></li>
		                	</c:otherwise>
		                </c:choose>
	                </c:forEach>
	               
	                
					<c:choose>
	                	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="list.no?cate=${ cate }&keyword=${ keyword }&cpage=${ pi.currentPage + 1 }">&gt;</a></li>
	                    </c:otherwise>
	                </c:choose>
				</ul>
        	</div>
        </div>


    </div>


	<jsp:include page="../common/footer.jsp" />

	
	<script>
	
	
		$(function() {
			
			// 행을 클릭하면 상세보기
			$('#noticeTable tbody .clickTr').click(function() {
				location.href = "detail.no?nno=" + $(this).children().eq(0).text();		
			});
			
			
			
			$('input[type=radio]').each(function() {
				if('${cate}' == $(this).val()) {
					$(this).attr('checked', true);
				}
			});
			
			
			
			
		});
	
	
	
	
	
	</script>






</body>
</html>