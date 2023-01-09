<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수영일기 리스트 보기</title>
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
<!--자물쇠 링크입니다-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


</head>
<body>

   <jsp:include page="../common/menubar_nosearch.jsp" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <div class="container">
    <div class="page-inner no-page-title">
        <!-- start page main wrapper -->
        <div id="main-wrapper">
            <div class="row">
                <div class="col-lg-5 col-xl-3">
                    <div class="card card-white grid-margin">
                        <form name="search-form">
                            <input type="search" class="search"  placeholder="#검색어를 입력하세요" ><button>검색</button>
                        </form>         
                        </div>
                    </div>
                <div class="col-lg-7 col-xl-6">
                    <div class="card card-white grid-margin">
                        <div class="card-body">
                            <div class="post">
                                <textarea class="form-control" id="contentInsert" placeholder="내용을 입력해주세요" rows="4"></textarea>
                                <div class="post-options">
                                    <a href="#"><i class="fa fa-camera"></i></a>
                                    <a href="#"><i class="fas fa-video"></i></a>
                                   
                                    <button class="btn btn-outline-primary float-right">등록하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="profile-timeline">
                                <div class="card card-white grid-margin">
                                    <div class="card-body">
                                        <div class="timeline-item-header">
                                            <img src="" alt="" />
                                            <p>작성자<span> 닉네임</span></p>
                                            <small>3 시간전</small>
                                        </div>
                                        <div class="timeline-item-post">
                                            <p>오늘 새벽 수영완료.</p>
                                            <div class="timeline-options">
                                                <a href="#"><i class="fa fa-comment"></i> 댓글 (4)</a>
                                                <a href="#"><i class="fa fa-thumbs-up"></i> 좋아요 (15)</a>
                                                <span class="material-symbols-outlined">lock_open
                                                  
                                                </span>
                                                <select name="scope" id="scope">
                                                    <option value="">공개범위</option>
                                                    <option value="A">전체공개</option>
                                                    <option value="T">팀공개</option>
                                                    <option value="P">개인공개</option>
                                                </select>
                                               


                                            </div>
                                            <div class="timeline-comment">
                                                <div class="timeline-comment-header">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
                                                    <p>홍길동 <small>1 시간 전</small></p>
                                                </div>
                                                <p class="timeline-comment-text">어머 정말 부지런하시네요~! .</p>
                                            </div>
                                            <div class="timeline-comment">
                                                <div class="timeline-comment-header">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
                                                    <p>김길동 <small>3 시간 전</small></p>
                                                </div>
                                                <p class="timeline-comment-text">저도 새벽수영 완료입니다~!! 오수완!! </p>
                                            </div>
                                            <textarea class="form-control" placeholder="댓글을 입력해주새요"></textarea>
                                            <div class="post-options">
                                                <button class="btn btn-outline-primary float-right">등록하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                         
                                <div class="card card-white grid-margin">
                                    <div class="card-body">
                                        <div class="timeline-item-header">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
                                            <p>작성자   <span>닉네임</span></p>
                                            <small>7 시간 전</small>
                                        </div>
                                        <div class="timeline-item-post">
                                            <p>오늘 저녁 수영도 완료!! 오수완~~^^</p>
                                            <img src="img/post-img01.jpg" alt="" />
                                            <div class="timeline-options">
                                                <a href="#"><i class="fa fa-thumbs-up"></i> 좋아요 (22)</a>
                                                <a href="#"><i class="fa fa-comment"></i> 댓글 (7)</a>
                                                <a href="#"><i class="fa fa-share"></i> 공유 (9)</a>
                                            </div>
                                            <div class="timeline-comment">
                                                <div class="timeline-comment-header">
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
                                                    <p>박길동 <small>1 시간 전</small></p>
                                                </div>
                                                <p class="timeline-comment-text">저도 곧 수영장 갑니다! </p>
                                            </div>
                                            <textarea class="form-control" placeholder="댓글을 입력해주세요" ></textarea>
                                            <div class="post-options">
                                                <button class="btn btn-outline-primary float-right">등록하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
            <!-- Row -->
        </div>
        <!-- end page main wrapper -->
       <jsp:include page="../common/footer.jsp" />
    </div>
    </div>


</body>
</html>