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

.update{
align: center;
}


</style>


</head>
<body>
 <jsp:include page="../common/menubar_nosearch.jsp" />


		<form id="updateForm" method="post" action="update.di" enctype="multipart/form-data">
	
			
		
			<div class="timeline-item-header">
				<img src="${d.changeName }" alt="" />
				<p>
					${MemberNo } <span>${d.nickName} </span>
				</p>
				<small>${createDate }</small>
			</div>
			<div class="timeline-item-post">
				<div class="card card-white grid-margin">
			
				<div class="card-body">
					<div class="post">
						<textarea class="form-control" id="contentInsert"
							placeholder="내용을 입력해주세요" rows="4" name="content">${d.content }</textarea>
						<input type="hidden" name="diaryNo" value="${d.diaryNo }">
						<input type="hidden" name="memberNo" value="${loginMember.memNo }">
						<input type="hidden" name="nickName" value="${d.nickName }">
						

						<div class="post-options">
							<input type="file" id="upfile" name="reUpfile"><a href="#"><i
								class="fa fa-camera"></i></a> <input type="file" accept="video/*">
							<a href="#"><i class="fas fa-video"></i></a>
							 <c:if test="${not empty b.originName }">	
                            	
                            <a href="${b.changeName }" >${b.originName }</a>
                            <input type="hidden" name="originName" value="${b.originName }">
                            <input type="hidden" name="changeName" value="${b.changeName }">
                            </c:if>


							<c:if test="${not empty sessionScope.loginMember }">
								<button class="btn btn-outline-primary float-right">등록하기</button>
							</c:if>
						</div>
					</div>
					<!--"post" 끝  -->
				</div>
			
		</div>
		</div>
				<img src="${d.changeName }" alt="" />
				<div class="timeline-options">
					<a href="#"><i class="fa fa-thumbs-up"></i> 좋아요 (22)</a> <a
						href="#"><i class="fa fa-comment"></i> 댓글 (7)</a> <a href="#"><i
						class="fa fa-share"></i> 공유 (9)</a>
				</div>
				</form>
			
				<div class="timeline-comment">
					<div class="timeline-comment-header">
						
						<p>
							${d.nickName} <small>${createDate }</small>
						</p>
					</div>
					<p class="timeline-comment-text">저도 곧 수영장 갑니다!</p>
				</div>
		
		
	
			
					
			<c:choose>
				<c:when test="${empty loginMember }">	
				
				<textarea class="form-control" >로그인 후 이용 가능합니다.</textarea>
				<div class="post-options">
					<button class="btn btn-outline-primary float-right">등록하기</button>
				</div>
				</c:when>
				<c:otherwise>
					<textarea class="form-control" placeholder="댓글을 입력해주세요"></textarea>
				<div class="post-options">
					<button class="btn btn-outline-primary float-right">등록하기</button>
				</div>
				</c:otherwise>
			</c:choose>
			
		
		
		
		
	

	
	


	<jsp:include page="../common/footer.jsp" />


</body>
</html>