<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 작성폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

    <div class="outer">
        <div>

        </div>
        제목 : <input type="text">

        <div>
            <h3>배틀 포인트</h3>
            <table>
                <tr>
                    <td>레벨 : </td>
                    <td>
						<select name="level">
							<option>무관</option>
							<option>초급</option>
							<option>중급</option>
							<option>고급</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>종목 : </td>
                    <td>
                        <select>
                            <option value="">4:4 자유형</option>
                            <option value="">4:4 혼영</option>
                            <option value="">4:4 혼계영</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>성별 : </td>
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
        
        <div>
            <h3>배틀 경기장</h3>
            <table>
              <tr>
                <td>길이 : </td>
                <td><input type="number" min="0"></td>
              </tr>
              <tr>
                <td>폭 : </td>
                <td><input type="number" min="0"></td>
              </tr>
              <tr>
                <td>깊이 : </td>
                <td><input type="number" min="0"></td>
              </tr>
              <tr>
                <td>레인 : </td>
                <td><input type="number" min="0" pattern="[0-12]+"></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
              </tr>
            </table>
            <hr>
        </div>





        매치포인트 <br>
        레벨 : 
        <select>
            <option value="">무관</option>
            <option value="">초보</option>
            <option value="">중수</option>
            <option value="">고수</option>
        </select>
        <br>
        종목 :
        <select>
            <option value="">4:4 자유형</option>
            <option value="">4:4 혼영</option>
            <option value="">4:4 평형</option>
        </select>
        <br>
        성별 : 
        <select>
            <option value="">무관</option>
            <option value="">남자만</option>
            <option value="">여자만</option>
        </select>
        <br>
        <hr>
        경기장정보 <br>
        길이 : <input type="number" min="0"> <br>
        폭 : <input type="number" min="0"> <br>
        깊이 : <input type="number" min="0"> <br>
        레인 : <input type="number" min="0"> <br>
        수영복 대여 : 가능 <input type="radio" name="yesnNo" checked> 불가능 <input type="radio" name="yesnNo"><br> 
        <hr>
        매치진행<br>
        <textarea rows="10" cols="100" style="resize: none;"></textarea><br>
        <input type="file"> <br>

        <button>글 작성</button>
        <button onclick="history.back()">취소하기</button>

    </div>

</body>
</html>