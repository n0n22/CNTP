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

    <div class="outer">
        <div class="battle" style="text-align: center; margin-top: 50px;">
            <h2>배틀풀 작성</h2>
            <br>
        </div>
        
        <div class="battle-enrollform-area">
            <div align="center">
                <table>
                    <tr>
                        <td>제목 :&nbsp;</td>
                        <td><input type="text" required></td>
                    </tr>
                </table>
            </div>
            <br>
            <hr>
    
            <div align="center">
                <h3 style="display: inline;">배틀 포인트</h3>
                <br><br>
                <table>
                    <tr>
                        <td width="100px">레벨 :&nbsp;</td>
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
                        <td>종목 :&nbsp;</td>
                        <td>
                            <select>
                                <option value="">4:4 자유형</option>
                                <option value="">4:4 혼영</option>
                                <option value="">4:4 혼계영</option>
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
                    <td width="100px">길이 :&nbsp;</td>
                    <td><input type="number" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>폭 :&nbsp;</td>
                    <td><input type="number" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>깊이 :&nbsp;</td>
                    <td><input type="number" min="0" step="0.1"></td>
                  </tr>
                  <tr>
                    <td>레인 :&nbsp;</td>
                    <td><input type="number" min="0" pattern="[0-12]"></td>
                  </tr>
                  <tr>
                    <td>수영복 대여 :&nbsp;</td>
                    <td style="text-align: center;">가능 <input type="radio" name="yesNo" checked> 불가능 <input type="radio" name="yesNo"></td>
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
                        <td><textarea rows="10" cols="60" style="resize: none;"></textarea><br></td>
                    </tr>
                </table>
                <hr>
            </div>
            <div align="center">
                <input type="file">
                <hr>
            </div>
        </div>
        <div class="submit-area" align="center">
            <button class="btn btn-primary">글 작성</button>
            <button class="btn btn-danger" onclick="history.back()">취소하기</button>
        </div>

    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>