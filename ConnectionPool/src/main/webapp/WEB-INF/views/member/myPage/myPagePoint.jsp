<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool 마이페이지</title>
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    body{
        font-family: 'Pretendard-Regular';
    }

    *>a{
    text-decoration: none;
    color: black;
    }
    button {
        font-family: 'Pretendard-Regular';
    }
    #top-ul{
        list-style: none;
        margin: 0px;
        padding: 0px;
        height: 100%;
        width: 100%;
    }
    #top-ul>li {
        float: left;
        width: 120px;
        text-align: center;
        height: 100%; /* hover기능을 위해 부모요소에 꽉차게 설정 */
        display: block;
        line-height: 100px;
        font-size: 20px;
        font-weight: bold;
    }
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 100vh; */
        padding: 80px 0px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .top-bar {
        background-color: white;
        width: 1100px;
        height: 150px;
        border-radius: 20px;
        margin: 20px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main-area{
        background-color: white;
        width: 1100px;
        /* height: 800px; */
        border-radius: 20px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        padding: 30px;
    }
    .inline-block {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .inline-block>div {
        text-align: center;
        cursor: pointer;
        display: inline-block;
        /* margin: 30px; */
        /* margin-bottom: 50px; */
        width: 130px;
        font-size: 18px;
        /* border: 1px solid palevioletred; */
    }
    #name-area {
        font-size: 22px;
    }
    #userName {
        color: rgb(63, 72, 107);
        font-weight: bold;
    }
    #click {
        color: rgb(28,154,206);
    }
    #point-text {
        font-size: 18px;
    }
    #point {
        font-size: 21px;
        font-weight: bold;
        color: rgb(63, 72, 107);
    }

    #ingido{
        font-size: 21px;
        font-weight: bold;
        color: rgb(63, 72, 107);

    }

    #title {
        margin: 50px 0px 30px 80px;
        /* height: 100px; */
        font-size: 25px;
    }
    #title-line {
        width: 920px;
        margin: auto;
    }

    .info-area {
        margin-top: 30px;
        width: 950px;
    }
    #info-form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        height: 1000px;
        margin-bottom: 30px;
        margin-top: 80px;
    }
    #info-form input {
        height: 40px;
        width: 400px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 15px;

    }
   
    .info-area button {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
        background-color: RGB(28,154,206);
        color: white;
        /* width: 200px; */
        height: 40px;
        width: 77px;
        border-radius: 5px;
        border: none;
     }
    #info-text{
        margin-bottom: 60px;
        font-size: 30px;
    }
    #info-btn {
        margin-top: 50px;
        margin-bottom: 20px;
        font-size: 20px;
        width: 200px;
        height: 50px;
    }
    .info-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    #delete-btn > a{
        float: right;
        margin-right: 20px;
        color: rgb(113, 113, 113);
        margin-top: 10px;
        margin-bottom: 30px;
    }
    .checkResult {
        height: 5px;
        font-size: 13px;
        margin-left: 10px;
        color: rgb(47, 54, 82);
    }
    #emailForm {
        font-family: 'Pretendard-Regular';
        width: 110px;
        height: 40px;
        padding: 5px;
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
    }

    .subText {
        padding-left: 10px;
        font-size: 13px;
        color: rgb(70, 70, 70);
    }
 
    
    
    #pagination{
        display: flex;
        justify-content: center;
        align-items: center;
   }

   .noTitle{
        font-size: 16px;
        color: rgb(113, 113, 113);
   }
</style>
</head>
<body>

	<jsp:include page="../../common/menubar_nosearch.jsp"/>

    <div class="outer">
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName">${sessionScope.loginMember.nickName}</span> 님
                    <br>
                    <c:if test="${ sessionScope.loginMember.badgeChangeName == null }">
                    	노뱃지
                   	</c:if>
                   	<img src="${ sessionScope.loginMember.badgeChangeName }" width="30px">
                   	<c:if test="${ sessionScope.loginMember.teamName == null }">
                   		무소속	
                   	</c:if>
                   		<span>${ sessionScope.loginMember.teamName }</span>
                </div>
                <div>
                    <div id="point-text">포인트&nbsp;<span id="point">${sessionScope.loginMember.memPoint}</span></div>
                    <div id="ingido-text">인기도&nbsp;<span id="ingido">${sessionScope.loginMember.ingido}</span></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a  href="myPageInfo.me">회원정보</a></li>
                    <li><a href="myPageAtCheckForm.me">출석체크</a></li>
                    <li><a href="myPageBoard.me">작성글 보기</a></li>
                    <li><a href="myPageTeam.me">나의팀 보기</a></li>
                    <li><a href="myPageMoim.me">소모임 보기</a></li>
                    <li><a id="click" href="myPagePoint.me">포인트 조회</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">포인트 내역 조회</div>
                <div id="title-line"><hr></div>
            <div class="info-area" style="margin: auto;">
               <!-- 없을때-->
               <!-- 있을때--> 
               <c:choose>
               	<c:when test="${ empty plist }">
               		<div align="center">
                    	<br><br><br> 
                    	<div id="point-text">포인트&nbsp;<span id="point">${sessionScope.loginMember.memPoint}</span></div>
                    	<br><br>
	                    <p class="noTitle">포인트 내역이 없어요</p>
	                    <p class="noTitle">포인트는 출석체크 및 게시글,댓글 작성으로 얻을 수 있어요</p>
	                    <br><br><br><br><br><br>
                	</div>
               	</c:when>
               	<c:otherwise>
               		<div id="pointForm" class="container">
	                    
	                    <ul class="nav">
						  <li class="nav-item">
						    <a class="nav-link" href="myPagePoint.me">전체보기</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="myPagePoint.me?category=적립">적립내역</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="myPagePoint.me?category=사용">사용내역</a>
						  </li>
						</ul>       
						
	                    <table class="table">
	                      <thead>
	                        <tr>
	                          <th>적립/사용날짜</th>
	                          <th>포인트 적립/사용 내역</th>
	                          <th>포인트 </th>
	                        </tr>
	                      </thead>
	                      <tbody>	
	                    	<c:forEach var="p" items="${plist}">
	                    		<tr>
	                    			<td>${ p.pointDate }</td>
	                    			<td>${ p.pointContent }</td>
	                    			<c:if test="${ p.point.contains(\"+\") }">
		                    			<td style="color:green">${ p.point }</td>
	                    			</c:if>
	                    			<c:if test="${ p.point.contains(\"-\") }">
		                    			<td style="color:red">${ p.point }</td>
	                    			</c:if>
	                    		</tr>
	                    	</c:forEach>
	                      </tbody>
	                    </table>
                  	</div>
               	</c:otherwise>
               </c:choose>
            </div>
            <br><br><br>
            
            <c:if test="${ not empty plist }">
	            <div class="container" id="pagination">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="myPagePoint.me?cpage=${ pi.currentPage - 1 }&category=${category}">Previous</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                	
	                	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<li class="page-item"><a class="page-link" href="myPagePoint.me?cpage=${p}&category=${category}">${ p }</a></li>
						</c:forEach>
	                	
                	 	<c:choose>
	                		<c:when test="${ pi.currentPage eq pi.maxPage  }">
	                			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="myPagePoint.me?cpage=${ pi.currentPage + 1 }&category=${category}">Next</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                </ul>
	            </div>
            </c:if>
            
        </div>

    </div>

   
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>