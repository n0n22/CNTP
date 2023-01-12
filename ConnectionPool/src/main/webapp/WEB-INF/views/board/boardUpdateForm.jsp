<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정하기 페이지</title>
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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기페이지</h2>
            <br>

            <form id="updateForm" method="post" action="update.bo" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="게시판제목임ㅋㅋ" name="title" required></td>
                    </tr>
                    <tr>
                        <th><label for="memNo">작성자</label></th>
                        <td><input type="text" id="memNo" class="form-control" value="${b.memberNo}" name="memberNo" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="content" required>여긴내용쓰</textarea></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="upfile">
                            	현재 업로드된 파일 : 
                            <a href="" download="">flower.jpg</a>
                        </td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>