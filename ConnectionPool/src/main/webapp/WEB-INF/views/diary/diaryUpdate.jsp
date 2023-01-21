<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수영일기 수정하기</title>
<style>
    div {
    display: block;
}
.post-options {
    overflow: hidden;
    margin-top: 15px;
    margin-left: 15px;
}
.post-options a {
    display: block;
    margin-top: 5px;
    margin-right: 20px;
    float: left;
    color: #2b2b2b;
    text-decoration: none;
    font-size: 16px !important;
}
.post-options a:hover {
    color: #5369f8;
}

element.style {
}
.card.card-white {
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    box-shadow: 0 0.05rem 0.01rem rgb(75 75 90 / 8%);
    padding: 25px;
}

.grid-margin {
    margin-bottom: 2rem;
}


#contentInsert{
    resize: none;
    width: 700px;
    height: 200px;
    

}



</style>


</head>
<body>
 <jsp:include page="../common/menubar_nosearch.jsp" />


	<div>
		<form id="updateForm" method="post" action="update.di" enctype="multipart/form-data">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
			<div class="card card-white grid-margin">
				<div class="card-body">
					<div class="post">
						<textarea class="form-control" id="contentInsert" rows="4"> 수정할 내용이 블라블라~~~~ 있습니다.</textarea>
						<div class="post-options">
							<a href="#"><i class="fa fa-camera"></i></a> <a href="#"><i
								class="fas fa-video"></i></a>

							<button class="btn btn-outline-primary float-right">수정하기</button>
							<button class="btn btn-outline-primary float-right">이전으로</button>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<jsp:include page="../common/footer.jsp" />


</body>
</html>