<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기 페이지</title>
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

        table * {margin:5px;}
        table {width:100%;}
    </style>
    
</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기페이지</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="">목록으로</a>
            <br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${b.title }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${b.memberNo }</td>
                    <th>작성일</th>
                    <td>${b.createDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${b.content }</p></td>
                </tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
					<c:choose>
							<c:when test="${empty b.originName }">
                    			첨부파일이 없어요~~!
                    		</c:when>
							<c:otherwise>
								<!-- download 속성 :다운로드시 파일명 -->
								<a href="${b.changeName }" download="${b.originName }">${b.originName }</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
            <br>
			
			<c:if test="${loginMember.memNo  eq b.memberNo}">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
            </div>
            </c:if>
           
			
			
			<form action="" method="post" id="postForm">
				<input type="hidden" name="bno" value="${b.boardNo }"/>
				<input type="hidden" name="filePath" value="${b.changeName }" />	
			
			</form>
			
			<script>
				function postFormSubmit(num){
					if(num == 1) { //수정하기 클릭 시
						$('#postForm').attr('action','updateForm.bo').submit();
					}else { //삭제하기 클릭 시
						$('#postForm').attr('action', 'delete.bo').submit();
					}
				}
			
			
			</script>
			
			 <br><br>
			 
			
			
			
            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                
                
                <tbody>
                    <tr>
                        <th>user02</th>
                        <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td>2020-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2020-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2020-03-10</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>