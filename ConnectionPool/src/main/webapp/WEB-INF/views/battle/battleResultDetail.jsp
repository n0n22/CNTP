<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
 
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
		 <div class="container h-100">
	        <div class="row h-50 align-items-center" style="margin-top: 50px">
	            <div class="col-12 text-center">
	                <h1 class="font-weight-light">배틀 결과 상세보기</h1>
	                <br>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-sm-8 col-md-6">
	                <div class="card">
	                    <!-- <div class="card-header">Polar Area chart</div> -->
	                    <div class="card-body text-center">
	                        <div style="height: 300px;">
	                            <h3 class="text-center m-b-10">A팀</h3> <img class="m-b-10" src="https://i.imgur.com/n6Lg8ES.png" height="100" width="100">
	                            <p class="text-center">20전 12승 8패</p> <button class="btn btn-lg btn-primary" disabled>승리</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-8 col-md-6">
	                <div class="card">
	                    <div class="card-body text-center">
	                        <div style="height: 300px;">
	                            <h3 class="text-center m-b-10">B팀</h3> <img class="m-b-10" src="https://i.imgur.com/n6Lg8ES.png" height="100" width="100">
	                            <p class="text-center">전적 16전 7승 9패</p> <button class="btn btn-lg btn-danger" disabled>패배</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	
	
	
	
	
       

        <hr>
        <div class="outer-main">
            <div class="battleHistory">
            	<br>
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
                <button class="btn btn-primary" onclick="location.href='resultEnrollForm.bt'">결과작성</button>
                <button class="btn btn-info">승인</button>
                <button class="btn btn-warning">이의제기</button>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>