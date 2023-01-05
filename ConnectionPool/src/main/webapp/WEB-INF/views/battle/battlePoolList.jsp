<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

    .content-area table{
        text-align: center;
        border-collapse: collapse;
        width: 90%;
    }
    tr{
        border-bottom: 1px solid #E6E6E6;
    }
    .content-area table tbody tr:hover{
        background-color: rgb(250,116,62);
    }

</style>

</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	    <script>
        $(function(){

            let today = new Date();
    
            let year = today.getFullYear();
            let month = today.getMonth() + 1;
            month = month < 10 ? '0' + month : month;  
            let date = today.getDate();
            date = date < 10 ? '0' + date : date;
            let day = '';
            switch(today.getDay()){
                case 1 : day = '월요일'; break; 
                case 2 : day = '화요일'; break;
                case 3 : day = '수요일'; break;
                case 4 : day = '목요일'; break;
                case 5 : day = '금요일'; break;
                case 6 : day = '토요일'; break;
                case 7 : day = '일요일'; break;
            }

            let mainDate = year + '년 ' + month + '월 ' + date + '일 ' + day;
            $('#mainDate').html('<h3>' + mainDate + '</h3>');

        })
    </script>

    <div class="outer">

        <div class="top-area">
            <div align="center">
                <button id="yesterday">&lt;</button> 
                <div id="mainDate" style="display: inline-block;"></div>
                <button id="tomorrow">&gt;</button> 
            </div>
        </div>
        <div class="search-area" align="center">
            <select>
                <option>모든 지역</option>
                <option>서울</option>
                <option>경기/강원</option>
                <option>인천</option>
                <option>대전/세종/충청</option>
                <option>대구/경북</option>
                <option>부산/울산/경남</option>
                <option>광주/전라</option>
                <option>제주</option>
            </select>
            <select>
                <option>남녀모두</option>
                <option>남자만</option>
                <option>여자만</option>
            </select>
            <select>
                <option>4:4계영 400m</option>
                <option>4:4계영 800m</option>
                <option>4:4혼계영 400m</option>
            </select>
            <select>
                <option>무관</option>
                <option>초보</option>
                <option>중수</option>
                <option>고수</option>
            </select>
        </div>
        <br>
        <div class="content-area" align="center">
            <table>
                <thead>
                    <tr>
                        <th>시간</th>
                        <th>제목</th>
                        <th>신청버튼</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>11:00</td>
                        <td>
                            서울 영등포 더에프 필드 B구장 <br>
                            * 지역 : 서울 / 성별 : 남녀모두 / 종목 : 혼영 4vs4 / 레벨 : 무관
                        </td>
                        <td><button>신청</button></td>
                    </tr>
                    <tr>
                        <td>11:00</td>
                        <td>
                            서울 영등포 더에프 필드 B구장 <br>
                            * 지역 : 서울 / 성별 : 남녀모두 / 종목 : 혼영 4vs4 / 레벨 : 무관
                        </td>
                        <td><button>마감</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
	
	
	
	
	
	
	
	


    <jsp:include page="../common/footer.jsp"/>

</body>
</html>