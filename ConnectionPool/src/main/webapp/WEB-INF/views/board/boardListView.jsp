<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트보기 페이지</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>
	 <jsp:include page="../common/menubar_nosearch.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>게시판</h2>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <a class="btn btn-secondary" style="float:right;" href="enrollForm.bo" method="post">글쓰기</a>
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
            <thead>
            <tr>
                <td>게시글번호</td>
                <td>카테고리</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일</td>
                <td>조회수</td>
                
            </tr>
        </thead>
        <tbody>
        
        	<c:forEach items="${ list }" var="b">
            <tr>
                <td class="bno">${b.boardNo }</td>
                <td>${b.category }</td>
                <td>${b.boardTitle }</td>
                <td>${b.memberNo }</td>
                <td>${b.createDate }</td>
                <td>${b.count }</td>
             
                
            </c:forEach>    
            </tr>
            
            
        </tbody>

            </table>
            <br>
            
            <script>
            
            	$(function(){
					$('#boardList>tbody>tr').click(function(){
						location.href = 'detail.bo?bno=' + $(this).children('.bno').text();
					})
            	})
            
            </script>
            
            
            

            <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose></c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	
                    	<c:otherwise>
	                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage -1}">Previous</a></li>
                    	</c:otherwise>
                    
                    
                    <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	 	<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>

            <br clear="both"><br>

            <form id="searchForm" action="" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>

    </div>

    <jsp:include page="../common/footer.jsp" />
	
</body>
</html>