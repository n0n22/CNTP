<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수영일기 상세보기</title>
<style>
body {
    background:#eee;
    margin-top: 20px;
}


.page-inner.no-page-title {
    padding-top: 30px;
}

.page-inner {
    position: relative;
    min-height: calc(100% - 56px);
    padding: 20px 30px 40px 30px;
    background: #f3f4f7;
}

/*세번째 네모 css*/
.card.card-white {
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    box-shadow: 0 0.05rem 0.01rem rgba(75, 75, 90, 0.075);
    padding: 25px;
    
}
/*검색창*/
.search{
    width: 200px;
   
}

.grid-margin {
    margin-bottom: 2rem;
}
.profile-timeline ul li .timeline-item-header {
    width: 100%;
    overflow: hidden;
}
.profile-timeline ul li .timeline-item-header img {
    width: 40px;
    height: 40px;
    float: left;
    margin-right: 10px;
    border-radius: 50%;
}
.profile-timeline ul li .timeline-item-header p {
    margin: 0;
    color: #000;
    font-weight: 500;
}
.profile-timeline ul li .timeline-item-header p span {
    margin: 0;
    color: #8e8e8e;
    font-weight: normal;
}
.profile-timeline ul li .timeline-item-header small {
    margin: 0;
    color: #8e8e8e;
}
.profile-timeline ul li .timeline-item-post {
    padding: 20px 0 0 0;
    position: relative;
}
.profile-timeline ul li .timeline-item-post > img {
    width: 100%;
}
.timeline-options {
    overflow: hidden;
    margin-top: 20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #f1f1f1;
    padding: 10px 0 10px 0;
}
.timeline-options a {
    display: block;
    margin-right: 20px;
    float: left;
    color: #2b2b2b;
    text-decoration: none;
}
.timeline-options a i {
    margin-right: 3px;
}
.timeline-options a:hover {
    color: #5369f8;
}
.timeline-comment {
    overflow: hidden;
    margin-bottom: 10px;
    width: 100%;
    border-bottom: 1px solid #f1f1f1;
    padding-bottom: 5px;
}
.timeline-comment .timeline-comment-header {
    overflow: hidden;
}
.timeline-comment .timeline-comment-header img {
    width: 30px;
    border-radius: 50%;
    float: left;
    margin-right: 10px;
}
.timeline-comment .timeline-comment-header p {
    color: #000;
    float: left;
    margin: 0;
    font-weight: 500;
}
.timeline-comment .timeline-comment-header small {
    font-weight: normal;
    color: #8e8e8e;
}
.timeline-comment p.timeline-comment-text {
    display: block;
    color: #2b2b2b;
    font-size: 14px;
    padding-left: 40px;
}
.post-options {
    overflow: hidden;
    margin-top: 15px;
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
.online {
    position: absolute;
    top: 2px;
    right: 2px;
    display: block;
    width: 9px;
    height: 9px;
    border-radius: 50%;
    background: #ccc;
}
.online.on {
    background: #2ec5d3;
}
.online.off {
    background: #ec5e69;
}
#cd-timeline::before {
    border: 0;
    background: #f1f1f1;
}
.cd-timeline-content p,
.cd-timeline-content .cd-read-more,
.cd-timeline-content .cd-date {
    font-size: 14px;
}
.cd-timeline-img.cd-success {
    background: #2ec5d3;
}
.cd-timeline-img.cd-danger {
    background: #ec5e69;
}
.cd-timeline-img.cd-info {
    background: #5893df;
}
.cd-timeline-img.cd-warning {
    background: #f1c205;
}
.cd-timeline-img.cd-primary {
    background: #9f7ce1;
}
.page-inner.full-page {
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
}

.team .team-member {
    display: block;
    overflow: hidden;
    margin-bottom: 10px;
    float: left;
    position: relative;
}
.team .team-member .online {
    top: 5px;
    right: 5px;
}
.team .team-member img {
    width: 40px;
    float: left;
    border-radius: 50%;
    margin: 0 5px 0 5px;
}
.label.label-success {
    background: #43d39e;
}
.label {
    font-weight: 400;
    padding: 4px 8px;
    font-size: 11px;
    display: inline-block;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25em;
}

#contentInsert{
    resize: none;
    width: 100%;
    height: 15%;
}

textarea{
    resize: none;
    width: 100%;
    height: 8%;

}
#scope{
    position: absolute;
    width: 100px;
    height: 28px;
}

</style>


</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp" />

	<div class="card card-white grid-margin">
		<div class="card-body">
			<c:if test="${ loginMember.memberNo eq d.memberNo }">
				<div align="center">
					<!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
					<a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a> 
					<a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
				</div>
			</c:if>
			
			 <form action="" method="post" id="postForm">
            	<input type="hidden" name="bno" value="${d.MemberNo}" />
            	<input type="hidden" name="filePath" value="${ b.changeName }" />
            </form>
			
			<script>
            	function postFormSubmit(num){
					if(num == 1){ // 수정하기 클릭 시
						$('#postForm').attr('action', 'updateForm.bo').submit();
					} else{	// 삭제하기 클릭 시
						$('#postForm').attr('action', 'delete.bo').submit();
					}
            	}
            </script>
            
			<br><br>
			
			
			<div class="timeline-item-header">
				<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
				<p>
					${MemberNo } <span>닉네임</span>
				</p>
				<small>${createDate }</small>
			</div>
			<div class="timeline-item-post">
				<p>오늘 저녁 수영도 완료!! 오수완~~^^</p>
				<img src="img/post-img01.jpg" alt="" />
				<div class="timeline-options">
					<a href="#"><i class="fa fa-thumbs-up"></i> 좋아요 (22)</a> <a
						href="#"><i class="fa fa-comment"></i> 댓글 (7)</a> <a href="#"><i
						class="fa fa-share"></i> 공유 (9)</a>
				</div>
				<div class="timeline-comment">
					<div class="timeline-comment-header">
						<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
							alt="" />
						<p>
							박길동 <small>1 시간 전</small>
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
			
			</div>
		
		
		</div>
	</div>


	<jsp:include page="../common/footer.jsp" />

	 <script>
    	
    	$(function(){
    		DiaryselectReplyList();
    	});
    
    	function addDiaryReply(){ //댓글 작성용 ajax
    		
    		if($('#content').val().trim() != ''){
    			$.ajax({
    				url: 'rinsert.di',
    				data :{
    					diaryNo : ${d.diaryNo},
    					commentContent : $('#content').val(),
    					writer : ${loginMember.memNo}
    				},
    				success : function(status){
    					console.log(status);
    				
    					if(status == 'success'){
    						selectDiaryReplyList();
    						$('#content').val('');
    					}
    				
    					
    				},
    				error: function(){
    					console.log('실패!!ㅜㅜ');
    				}
    				
    			})
    		}
    		else {
    			alertify.alert('정상적인 댓글을 작성해주세요!!');
    		}
    				
    		}
    		
    	
    
    	
    	function selectDiaryReplyList(){
    		$.ajax({
    			url: 'rlist.di', //게시글에 달린 댓글만 조회. (현재 게시글의 글번호를 넘겨줌.)
    			data: {dno : ${d.diaryNo}},
    			success : function(list){
    				console.log(list);
    				
    				let value='';
    				for(let i in list){
    					console.log(list[i].commentContent);
    					value += '<tr>'
							   + '<th>' + list[i].writer  + '</th>'
							   + '<th>' + list[i].commentContent + '</th>'
							   + '<th>' + list[i].commentDate   + '</th>'
							   + '<td><button class="btn btn-sm btn-danger" onclick="openReportForm(' + "'board-reply'" + ', this, ' + list[i].commentNo + ');">신고</button></td>'
							   + '</tr>';
						
    				}
    				
    				$('#replyArea tbody').html(value);
					$('#rcount').text(list.length);
    			},
    			error : function(){
    				console.log('댓글 목록 조회 실패!!ㅜㅜ');
    			}
    		
    		})
    		
    		
    	}
    
    
    
    
    </script>
    
    









</body>
</html>