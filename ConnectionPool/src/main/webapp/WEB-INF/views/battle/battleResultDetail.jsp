<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
		div{
            margin: 0px;
            box-sizing: border-box;
        }

        div.battleTeam{
            background-color: rgb(28,154,206);
            border-radius: 15px;
            margin-top: 20px;
        }

        div.left{
            float: left;
            width: 50%;
            padding: 50px;
        }
        div.right{
            float: right;
            width: 50%;
            padding: 50px;
        }
        table {
            border-collapse: collapse;
            width: 550px;
        }
        tr {
            height: 25px;
        }
        th {
            width: 100px;
            text-align: center;
            border-bottom: 1px solid rgb(28,154,206);
            height: 50px;
        }
        td {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            border-left: 1px solid #ccc;
            height: 50px;
        }
        td:first-child{
            border-left: 0;
        }
        td:last-child{
            border-right: 0;
        }
  
        div.submit-area{
            display: inline-block;
            margin-bottom: 50px;
        }


</style>

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<div class="outer" align="center">
        <div class="outer-top">
            <div class="row" style="height: 100px;">
                <div class="col"></div>
                <div class="battleTeam col row" style="display: flex; align-items: center;">
                    <div class="col">A팀<img src="https://c11.kr/19bd7" style="display: inline; width: 50px; float: right;"></div>
                    <div class="col"><h2>VS</h2></div>
                    <div class="col">B팀<img src="https://c11.kr/19bd7" style="display: inline; width: 50px; float: right;"></div>
                </div>
                <div class="col"></div>
            </div>
        </div>

        <hr>
        <div class="outer-main">
            <div class="battleHistory">
                <h2>배틀기록</h2>
    
                <div class="battleRecord">
                    <div class="left">
                        <h3>A팀</h3>
                        <table>
                            <thead>
                                <tr style="text-align: center;">
                                    <th>선수</th>
                                    <th>종목</th>
                                    <th style="width: 150px;">기록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
            
                    <div class="right">
                        <h3>B팀</h3>
                        <table>
                            <thead>
                                <tr style="text-align: center;">
                                    <th>선수</th>
                                    <th>종목</th>
                                    <th style="width: 150px;">기록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
                </div>
            </div>
            <br clear="both">
        </div>
        <hr>
        <div class="outer-bottom">
            <div class="submit-area">
                <br>
                <button class="btn btn-primary">결과작성</button>
                <button class="btn btn-info">승인</button>
                <button class="btn btn-warning">이의제기</button>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>