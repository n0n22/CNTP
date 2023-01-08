<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        font-size: 25px;
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
        width: 950px;
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
                <div id="name-area" style="cursor: default;"><span id="userName">커풀</span> 님
                    <br>🤔<span>무소속</span>
                </div>
                <div>
                    <div id="point-text">포인트&nbsp;<span id="point">180</span></div>
                    <div id="ingido-text">인기도&nbsp;<span id="ingido">13</span></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a  href="myPageInfo.me">회원정보</a></li>
                    <li><a href="">출석체크</a></li>
                    <li><a href="myPageBoard.me">작성글 보기</a></li>
                    <li><a href="myPageDiary.me">수영일기</a></li>
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
                <div align="center">
                    <br><br><br> 
                    <p class="noTitle">포인트 내역이 없어요</p>
                    <p class="noTitle">포인트는 출석체크 및 게시글,댓글 작성으로 얻을 수 있어요</p>
                    <br><br><br>
                </div>
               <!-- 있을때--> 
                <div id="pointForm" class="container">
                    <p>포인트 내역은 수정과 삭제가 불가능합니다.</p>            
                    <table class="table">
                      <thead>
                        <tr>
                          <th>적립/사용날짜</th>
                          <th>포인트 적립/사용 내역</th>
                          <th>포인트 </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>2023-01-02</td>
                          <td>출석체크</td>
                          <td>+1</td>
                        </tr>
                        <tr>
                          <td>2023-01-02</td>
                          <td>팀 생성</td>
                          <td>-50</td>
                        </tr>
                        <tr>
                          <td>2023-01-01</td>
                          <td>출석체크</td>
                          <td>+1</td>
                        </tr>
                        <tr>
                            <td>2022-12-28</td>
                            <td>출석체크</td>
                            <td>+1</td>
                        </tr>
                        <tr>
                            <td>2022-12-15</td>
                            <td>출석체크</td>
                            <td>+1</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
            </div>
            <br><br><br>
            <div class="container" id="pagination">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>

    </div>

   
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>