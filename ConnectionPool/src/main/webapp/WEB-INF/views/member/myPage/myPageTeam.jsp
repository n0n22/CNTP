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

   .teamInfoTable td{
		text-align: center;
	}

	.teamInfo, .teamMemberInfo{
		background-color: antiquewhite;
		border-radius: 10px;
		width: 80%;
		height : 300px;

		padding-top: 5px;
	}

	table{
		border:1px solid black; 
	}

	.teamMemberInfo > div{
		float: left;
		width: 50%;
		height: 100%;
		padding-top: 5%;
	}

	.img-area{
		position:relative;
		z-index: 1;
	}

	.badge-img{
		border-radius: 50%;
		position:absolute;
		z-index:2;
	}

	.teamImg{
		border-radius: 10px;

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
                    <li><a id="click" href="myPageTeam.me">나의팀 보기</a></li>
                    <li><a href="myPageMoim.me">소모임 보기</a></li>
                    <li><a href="myPagePoint.me">포인트 조회</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">나의 팀 조회</div>
                <div id="title-line"><hr></div>
            <div class="info-area" style="margin: auto;">
               <!-- 없을때-->
               <div align="center">
                   <br><br><br> 
                   <p class="noTitle">소속된 팀이 없어요</p>
                   <a href="">팀 페이지로 이동하기</a>
                   <br><br><br>
               </div>

                <div style="width:100%" align="center">
                    
                    <div>
                        <div class="badge-area" style="width:20%; float:left">
                            <!-- 팀 뱃지 -->
                            <img class="badge-img" width="200px" height="200px"  src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbhd1qW%2FbtqUnLpjyqL%2FsRwVDDHp0keOfVq1nKDb11%2Fimg.jpg">
        
                        </div>
        
                        <div class="img-area" style="width:80%; display:inline-block;">
                            <!-- 팀 이미지 -->
                            <img width="100%" height="300px" class="teamImg" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbhd1qW%2FbtqUnLpjyqL%2FsRwVDDHp0keOfVq1nKDb11%2Fimg.jpg">
                        </div>
        
                        <div class="badge-shop" align="left" style="width:80%;">
                            <a class="btn" href="badgeShop.mo">뱃지 구매하기</a>
                        </div>
                    </div>
                    
                    <br><br>
        
        
                    <div class="teamInfo" align="center">
        
        
        
                        <pre>팀장 :		부팀장 : 		팀원( / )</pre> <br>
                        <table class="teamInfoTable" border="1">
                            <tr>
                                <th width="400">팀 소개</th>
                                <th width="400">주요 활동 지역</th>
                            </tr>
                            <tr>
                                <td>우리팀은 어쩌고</td>
                                <td>활동지역은 어쩌고</td>
                            </tr>
                            <tr>
                                <th>현재 팀 인원</th>
                                <th>주요 활동시간</th>
                            </tr>
                            <tr>
                                <td>1명</td>
                                <td>평일</td>
                            </tr>
                            <tr>
                                <th>키워드</th>
                                <th>배틀기록</th>
                            </tr>
                            <tr>
                                <td>배틀</td>
                                <td>아직 배틀 참여 기록이 없습니다</td>
                            </tr>
        
                        </table>
        
                        <br>
        
                        <div class="enroll-area" align="right">
                            <a href="teamUpdateForm.mo">수정하기</a>
                            <!-- <a href="teamUpdateForm.mo?teamNo=${ teamNo }">수정하기</a> -->
                        </div>
        
                    </div>
        
                    <br><br>
                    
                    <div class="teamMemberInfo" align="center">
                        
                        <div>
                            <p>팀원</p>
                            <table class="teamMemberInfoTable" border="1">
                                <tr>
                                    <th width="100">직급</th>
                                    <th width="100">닉네임</th>
                                    <th width="100">가입일시</th>
                                </tr>
                                <tr>
                                    <td>팀장</td>
                                    <td>나짱짱</td>
                                    <td>2020-01-01</td>
                                </tr>
                            </table>
                            <br>
        
                            <div class="memberUpdate-area" align="right">
                                <a href="teamMemberUpdateForm.mo">팀장/부팀장 수정</a>
                                <!-- <a href="teamMemberUpdateForm.mo?teamNo=${ teamNo }">팀장/부팀장 수정</a> -->
                                <a href="chattingRoom.mo">팀 채팅방 입장하기</a>
                            </div>
                        </div>
        
                        <div>
                            <p>신청내역</p>
                            <table class="applyTable" border="1">
                                <tr>
                                    <th width="100">닉네임</th>
                                    <th width="100">신청일시</th>
                                    <th width="100">수락/거절</th>
                                </tr>
                                <tr>
                                    <td>어쪼거</td>
                                    <td>2020-01-01</td>
                                    <td>
                                        <button>수락</button>
                                        <button>거절</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
        
                    </div>
                    
                </div>
              
			</div>

        </div>   
    </div>       

    

   
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>