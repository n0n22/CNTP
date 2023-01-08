<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    h3 {
        text-align: center;
    }
    .image-area {
    	margin-top: 50px;
    	margin-bottom: 20px;
    }

    .outer div th {
        width: 100px;
        text-align: right;
    }
    .content-area {
        width: 100%;
    }

    div.left {
        height: 200px;
        width: 49.5%;
        float: left;
        box-sizing: border-box;
        border: 1px solid rgb(28,154,206);
        border-radius: 30px;
    }
    div.right {
        height: 200px;
        width: 49.5%;
        float: right;
        box-sizing: border-box;
        border: 1px solid rgb(28,154,206);
        border-radius: 30px;
    }
  

    /* 배틀 모달 스타일 */
    .message-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1000;

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
    }

    .message-show {
        opacity: 1;
        z-index: 1000;
        transition: all 0.5s;
    }

    .message-window {
        position: relative;
        width: 100%;
        height: 100%;
    }

    .message-popup {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
        font-family: 'Pretendard-Regular';
        border-radius: 3%;

        /* 임시 지정 */
        width: 480px;
        height: 460px;

        /* 초기에 약간 아래에 배치 */
        transform: translate(-50%, -50%);
        padding: 7px;
        
        /* padding-block-start: 30px; */
    }

    .message-show .message-popup {
        transform: translate(-50%, -50%);
        transition: all 0.5s;
    }
    /* 모달 스타일 끝 */
    
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
    <div class="outer">

        <div class="image-area">
            <img src="	https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg" width=100%", height="500px">
        </div>
        <div class="content-area">
            <div class="left">
                <h3>배틀 포인트</h3>
                <div>
                    <table>
                        <tr>
                            <th>레벨 : </th>
                            <td>무관</td>
                        </tr>
                        <tr>
                            <th>종목 : </th>
                            <td>4:4 혼영</td>
                        </tr>
                        <tr>
                            <th>성별 : </th>
                            <td>무관</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="right">
                <h3>배틀 장소 및 시간</h3>
                <div>
                    <table>
                        <tr>
                            <th>시간 : </th>
                            <td>2023년 1월 3일 화요일 11:00</td>
                        </tr>
                        <tr>
                            <th>지역 : </th>
                            <td>서울시</td>
                        </tr>
                        <tr>
                            <th>장소 : </th>
                            <td>서울특별시 영등포구 선유로 138</td>
                        </tr>
                        <tr>
                            <th>지도 : </th>
                            <td><button>지도보기</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br clear="both">
            <br>

            <div class="left">
                <h3>배틀 팀 정보</h3>
                <div>
                    <table>
                        <tr>
                            <th>팀명 : </th>
                            <td>팀어벤져스</td>
                        </tr>
                        <tr>
                            <th>전적 : </th>
                            <td>16전 13승 3패 (승률 81.5%)</td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="right">
                <h3>배틀 경기장</h3>
                <div>
                    <table>
                        <tr>
                            <th>길이 : </th>
                            <td>50미터</td>
                        </tr>
                        <tr>
                            <th>폭 : </th>
                            <td>21미터</td>
                        </tr>
                        <tr>
                            <th>깊이 : </th>
                            <td>2미터</td>
                        </tr>
                        <tr>
                            <th>레인 : </th>
                            <td>8개</td>
                        </tr>
                        <tr>
                            <th>수영복 대여 : </th>
                            <td><b>가능</b>/불가능</td>
                        </tr>
                    </table>
                </div>
            </div>
            <br clear="both">
            <br>
            <div class="left">
                <h3>배틀 규칙</h3>
                <div style="display: flex;">
                    <div style="margin : auto; width:90%; height : 120px; overflow: auto;">
                        SW 4.1 자유형, 평영, 접영 그리고 개인혼영에서 출발은 다이브로 한다. 심판장이 호각을 길게 불면(SW2.1.5) 선수들은 출발대 위에 올라 서 있는다. 스타터가 “차렷(take your marks)"하고 구령하면 곧 선수들은 출발대 앞에 적어도 한 발을 두고 출발 자세를 취한다. 손의 위치는 상관없다. 모든 선수들의 자세가 정지 하였을 때 스타터는 출발신호를 한다.
    SW 4.2 배영 및 혼계영에서의 출발은 물속에서 한다. 심판장의 첫 번째 긴 호각소리에 따라(SW2.1.5) 선수들은 즉각 물 속으로 들어가야 한다. 심판장의 두 번째 긴 호각 소리에 지체하지 말고 출발 자세로 들어가야 한다.(SW6.1) 모든 선수들이 출발 자세를 취했다고 인정되면 스타터는 “차렷(take your marks)”라는 구령을 한다. 모든 선수들의 자세가 정지하면 스타터는 출발 신호를 한다.
    
    SW 4.3 어느 선수든지 출발 신호전에 출발을 하면 실격을 당한다. 출발 신호 후 선수의 부정 출발이 확인되어도 역영은 계속되며 그 선수는 역영을 끝내고 실격을 당한다. 만약에 출발신호 전에 실격이 선언되면 스타터는 출발 신호를 해서는 안 되며 남은 선수들을 불러서 다시 시작한다.
                    </div>
                </div>

            </div>
            <div class="right" style="text-align: center;">
                <h3>배틀 신청 및 결과보기</h3>
                <div style="display: inline-block;">
                    <button class="show">신청</button> <button onclick="location.href='battleResult.bt'">결과보기</button>
                    <!--
                        신청한 사람에게는
                        <button>취소</button>
                        신청한 사람이외 + 날짜가 지나면
                        <button>마감</button>
                    -->
                    <br><br>
                    <!--
                        게시글 작성자 + 신청한 사람
                    -->
                    <button>채팅방 입장</button>
                </div>
                
            </div>
        </div>
     </div>
     
     
     <br><br>
     
     <jsp:include page="../common/footer.jsp"/>

     <div class="message-background">
		<div class="message-window">
			<div class="message-popup">
				<div class="message-area" align="center">
					<h3>배틀 신청</h3>
					<br>
					<textarea id="msgContent" rows="10"
						style="width: 400px; resize: none;" placeholder="도발 멘트를 입력해 주세요."></textarea>
					<br> <br>
					<button onclick="insertMessage();">신청</button>
					<button id="close">취소</button>
				</div>
			</div>
		</div>
	 </div>

     <script>
        function messageShow() {
        document.getElementById("msgContent").value = '';
        document.querySelector(".message-background").className = "message-background message-show";
        }
    
        function messageClose() {
            document.querySelector(".message-background").className = "message-background";
        }
    
        document.querySelector(".show").addEventListener("click", messageShow);
        document.querySelector("#close").addEventListener("click", messageClose);
     </script>


</body>
</html>