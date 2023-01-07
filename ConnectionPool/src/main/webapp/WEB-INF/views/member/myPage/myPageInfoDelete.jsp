<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
    #title {
        margin: 50px 0px 30px 80px;
        /* height: 100px; */
        font-size: 25px;
    }
    #title-line {
        width: 950px;
        margin: auto;
    }
    .del-area {
        padding: 0px 0px 80px 0px;
    }
    .del-title {
        margin-top: 70px;
        margin-left: 80px;
        margin-bottom: 40px;
        font-size: 22px;
        font-weight: bold;
        color: rgb(47, 54, 82);
    }
    .del-content {
        /* margin-left: 120px; */
        font-size: 18px;
        font-family: 'Pretendard-Regular';
    }
    .del-area select {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        width: 750px;
        height: 50px;
        text-align: center;
        box-sizing: border-box;
    }
    #del-textarea {
        box-sizing: border-box;
        margin-top: 30px;
        padding: 30px;
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        width: 750px;
        resize: none;
    }
    #del-check {
        margin-top: 20px;
        margin-bottom: 80px;
        margin-left: 250px;
        font-size: 18px;
    }
    #del-checkbox {
        width: 18px;
        height: 18px;
    }
    .del-area button {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        background-color: RGB(28,154,206);
        color: white;
        height: 40px;
        width: 150px;
        border-radius: 5px;
        border: none;
        margin: 5px;
    }

    .del-area button:hover {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        background-color: rgb(29, 172, 233);
        color: white;
        height: 40px;
        width: 150px;
        border-radius: 5px;
        border: none;
        margin: 5px;
    }
    #delete-btn {
        background-color: rgb(223, 223, 223);
        color: rgb(161, 161, 161);
     }
    #cancle-btn {
        cursor: pointer;
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
                    <li><a id="click" href="myPageInfo.me">회원정보</a></li>
                    <li><a href="">출석체크</a></li>
                    <li><a href="">작성글 보기</a></li>
                    <li><a href="">수영일기</a></li>
                    <li><a href="">나의팀 보기</a></li>
                    <li><a href="">소모임 보기</a></li>
                    <li><a href="">포인트 조회</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">회원 탈퇴</div>
                <div id="title-line"><hr></div>
                <div class="del-area">

                    <div class="del-title">[회원 탈퇴 유의사항]</div>
                    <pre class="del-content">
                            [1] 회원 탈퇴 시 삭제된 데이터에 대해 복구가 불가능하며, 개인정보가 필요한 술렁술렁의 모든 웹서비스 이용이 불가합니다. <br>
                            [2] 을 이용하고 계신 경우, 회원 탈퇴 진행 시 구독도 함께 취소됩니다. <br>
                            [3] 잔여 포인트, 잔여 쿠폰, 회원 등급 등의 정보는 모두 삭제되며 환불되지 않습니다. <br>
                            [4] 회원 탈퇴 후 모든 ConnectionPool 웹서비스 내에서의 관한 기록은
                                  전자상거래 등에서의 소비자 보호에 관한 법률에 따라 5년간 보관되며, 
                                  이를 위한 개인정보는 법률에 따른 보유 목적 외에 다른 목적으로는 이용되지 않습니다. <br>
                            [5] 회원 탈퇴 후 ConnectionPool 서비스에 입력하신 게시글 및 수영일기는 삭제되지 않으며,
                                  회원 정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능합니다. 
                                  게시글 및 수영일기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
                    </pre>

                    <div class="del-title" style="margin-top: 70px;">[회원 탈퇴 사유]</div>
                    <form action="delete.me" method="post">
                        <input type="hidden" name="userNo" value="">
                        <div class="del-select" align="center">
                            <select name="" id="">
                                <option value="" selected disabled hidden>사유를 선택해주세요.</option>
                                <option value="">맘에안듬</option>
                                <option value="">할게없음</option>
                                <option value="">기타</option>
                            </select><br>
                            <textarea name="" id="del-textarea" rows="5" maxlength="200" placeholder="더욱 나은 서비스를 위하여 소중한 의견 부탁드립니다. (200자)"></textarea>
                            <div id="del-check">
                                <span>회원 탈퇴 유의사항을 숙지하였으며 회원 탈퇴를 진행하겠습니다.</span>
                                <span><input type="checkbox" id="del-checkbox" onchange="abledBtn();"></span>
                            </div>
                            <div><button type="button" id="cancle-btn">취소하기</button><button type="submit" id="delete-btn" disabled>탈퇴하기</button></div>

                            <script>
                                $('#cancle-btn').click(function(){
                                    location.href = "myPageInfo.me";
                                })

                                function abledBtn() {
                                    if($('#del-checkbox').is(':checked') == true) {
                                        $('#delete-btn').attr('disabled', false);
                                        $('#delete-btn').css('cursor', 'pointer');
                                        $('#delete-btn').css('color', 'black');
                                    } else {
                                        $('#delete-btn').attr('disabled', true);
                                        $('#delete-btn').css('cursor', 'default');
                                        $('#delete-btn').css('color', 'rgb(161, 161, 161)');
                                    }
                                }
                            </script>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    
    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>