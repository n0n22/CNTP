<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 작성폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        tr > td:first-child{
            text-align: right;
        }
        tr > td:nth-child(2){
            width: 300px;
        }
        div.outer-top{
            text-align: center;
            margin-top: 50px;
        }
        div.submit-area{
            margin-bottom: 20px;
        }
        input:invalid{
            border-color: red;
        }
        

    </style>

</head>
<body>
    <jsp:include page="../common/menubar_nosearch.jsp"/>
	<form action="insert.bt" method="post" enctype="mult-part/form-data">
	<input type="hidden" name="memNo" value="${ loginMember.memNo }">
	
    <div class="outer">
        <div class="outer-top">
            <h2>배틀풀 작성</h2>
            <br>
        </div>
        
        <div class="battle-enrollform-area">
            <div align="center">
                <table>
                    <tr>
                        <td>제목 :&nbsp;</td>
                        <td><input type="text" name="title" required></td>
                    </tr>
                </table>
            </div>
            <hr>

            <div align="center">
                <h3 style="display: inline;">배틀 지역 및 시간</h3>
                <br><br>
                <table>
                    <tr>
                        <td width="100px">날짜 :&nbsp;</td>
                        <td><input name="battleDate" type="date"></td>
                    </tr>
                    <tr>
                        <td width="100px">시간 :&nbsp;</td>
                        <td><input name="battleTime" type="time"></td>
                    </tr>
                    <tr>
                        <td>지역 :&nbsp;</td>
                        <td>
                            <select name="area" id="addressForm">
                                <option value="시/도 선택" hidden="" disabled="disabled" selected="selected" >시/도 선택</option>
                                <option value="Seoul">서울특별시</option>
                                <option value="Gyeonggi">경기도</option>
                                <option value="Gangwon">강원도</option>
                                <option value="Chungbuk">충청북도</option>
                                <option value="Chungnam">충청남도</option>
                                <option value="Jeonabuk">전라북도</option>
                                <option value="Jeonnam">전라남도</option>
                                <option value="Gyeongbuk">경상북도</option>
                                <option value="Gyeongnam">경상남도</option>
                            </select>
                        </td>
                    </tr>

                </table>
            </div>
            <hr>
    
            <div align="center">
                <h3 style="display: inline;">배틀 포인트</h3>
                <br><br>
                <table>
                    <tr>
                        <td width="100px">레벨 :&nbsp;</td>
                        <td>
                            <select name="level">
                                <option value="A">무관</option>
                                <option value="B">초급</option>
                                <option value="M">중급</option>
                                <option value="S">고급</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>종목 :&nbsp;</td>
                        <td>
                            <select name="style">
                                <option value="f4">4:4 자유형</option>
                                <option value="h4">4:4 혼영</option>
                                <option value="hg4">4:4 혼계영</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>성별 :&nbsp;</td>
                        <td>
                            <select name="gender">
                                <option value="A">무관</option>
                                <option value="M">남자</option>
                                <option value="F">여자</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <hr>
            
            <div align="center">
                <h3>배틀 경기장</h3>
                <br>
                <table>
                  <tr>
                    <td width="100px">경기장 :&nbsp;</td>
                    <td><input type="text" name="poolName" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                        <td>장소 :&nbsp;</td>
                        <td><input name="place" type="text"></td>
                  </tr>
                  <tr>
                    <td width="100px">길이 :&nbsp;</td>
                    <td><input type="number" name="length" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>폭 :&nbsp;</td>
                    <td><input type="number" name="width" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>깊이 :&nbsp;</td>
                    <td><input type="number" name="depth" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>레인 :&nbsp;</td>
                    <td><input type="number" name="lanes" min="0" pattern="[0-12]"></td>
                  </tr>
                  <tr>
                    <td>수영복 대여 :&nbsp;</td>
                    <td style="text-align: left;">가능 <input type="radio" name="yesNo" value="Y" checked> &nbsp; 불가능 <input type="radio" value="N" name="yesNo"></td>
                  </tr>
                </table>
                <hr>
            </div>
            <div align="center">
                <h3>배틀 규칙</h3>
                <br>
                <table>
                    <tr>
                        <td></td>
                        <td><textarea rows="10" cols="60" name="battleRule" style="resize: none;" placeholder="SW 4.1 자유형, 평영, 접영 그리고 개인혼영에서 출발은 다이브로 한다. 심판장이 호각을 길게 불면(SW2.1.5) 선수들은 출발대 위에 올라 서 있는다. 스타터가 '차렷(take your marks)'하고 구령하면 곧 선수들은 출발대 앞에 적어도 한 발을 두고 출발 자세를 취한다. 손의 위치는 상관없다. 모든 선수들의 자세가 정지 하였을 때 스타터는 출발신호를 한다. SW 4.2 배영 및 혼계영에서의 출발은 물속에서 한다. 심판장의 첫 번째 긴 호각소리에 따라(SW2.1.5) 선수들은 즉각 물 속으로 들어가야 한다. 심판장의 두 번째 긴 호각 소리에 지체하지 말고 출발 자세로 들어가야 한다.(SW6.1) 모든 선수들이 출발 자세를 취했다고 인정되면 스타터는 '차렷(take your marks)'라는 구령을 한다. 모든 선수들의 자세가 정지하면 스타터는 출발 신호를 한다. SW 4.3 어느 선수든지 출발 신호전에 출발을 하면 실격을 당한다. 출발 신호 후 선수의 부정 출발이 확인되어도 역영은 계속되며 그 선수는 역영을 끝내고 실격을 당한다. 만약에 출발신호 전에 실격이 선언되면 스타터는 출발 신호를 해서는 안 되며 남은 선수들을 불러서 다시 시작한다."></textarea><br></td>
                    </tr>
                </table>
                <hr>
            </div>
            <div align="center">
                <input type="file" name="upfile">
                <hr>
            </div>
        </div>
        <div class="submit-area" align="center">
            <button type="submit" class="btn btn-primary">글 작성</button>
            <button class="btn btn-danger" onclick="history.back()">취소하기</button>
        </div>

    </div>
    </form>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>