<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
 
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
	<form action="insertResult.bt" method="post">
	        <input type="hidden" id="defeat" name="defeat" />
	        <input type="hidden" id="vicRecord" name="vicRecord">
	        <input type="hidden" id="defRecord" name="defRecord">
			 <div class="container h-100">
		        <div class="row h-50 align-items-center" style="margin-top: 50px">
		            <div class="col-12 text-center">
		                <h1 class="font-weight-light">배틀 결과 작성하기</h1>
		                <br>
		            </div>
		        </div>
		        <div class="row">
		            <div class="col-sm-8 col-md-6">
		                <div class="card">
		                    <!-- <div class="card-header">Polar Area chart</div> -->
		                    <div class="card-body text-center">
		                        <div style="height: 300px;">
		                            <h3 class="text-center m-b-10">${ homeTeam.teamName }</h3> 
	                         	    <c:if test="${ homeTeam.badgeStatus eq 'Y'}">
			                            <img class="m-b-10" src="${ homeTeam.badgeChangeName }" height="100" width="100">
		                            </c:if>
		                            <c:if test="${ homeTeam.badgeStatus eq 'N'}">
			                            <img class="m-b-10" src="https://i.imgur.com/n6Lg8ES.png" height="100" width="100">
		                            </c:if>
		                            <p class="text-center"></p>
		                            <p class="text-center"></p>
		                            <button id="homeTeamButton" class="btn btn-lg btn-primary" onclick="select(1)">승리팀</button> <input id="homeTeamRadio" type="radio" name="victory" hidden="hidden" value="${ homeTeam.teamNo }" checked>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col-sm-8 col-md-6">
		                <div class="card">
		                    <div class="card-body text-center">
		                        <div style="height: 300px;">
		                            <h3 class="text-center m-b-10">${ awayTeam.teamName }</h3> 
	                         	    <c:if test="${ awayTeam.badgeStatus eq 'Y'}">
			                            <img class="m-b-10" src="${ awayTeam.badgeChangeName }" height="100" width="100">
		                            </c:if>
		                            <c:if test="${ awayTeam.badgeStatus eq 'N'}">
			                            <img class="m-b-10" src="https://i.imgur.com/n6Lg8ES.png" height="100" width="100">
		                            </c:if>
		                            
		                            <p class="text-center"></p>
		                            <button id="awayTeamButton" class="btn btn-lg btn-light" onclick="select(2)">승리팀</button> <input id="awayTeamRadio" type="radio" name="victory" hidden="hidden" value="${ homeTeam.teamNo }">
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		    </div>
    </form>
		    <script>
		    let $hb = $('#homeTeamButton');
		    let $ab = $('#awayTeamButton');
		    let $hr = $('#homeTeamRadio');
		    let $ar = $('#awayTeamRadio');
		    let $defeat = $('#defeat');
		    
		    $(function(){
		    	$defeat.val('${awayTeam.teamNo}');
		    	
		    	$('.home').change(function(){
		    		var vicRecord = [
		    			{
		    				player : $('#homePlayer1').val(),
		    				style : $('#homeStyle1').val(),
		    				record : $('#homeRecord1').val()
		    			},
		    			{
		    				player : $('#homePlayer2').val(),
		    				style : $('#homeStyle2').val(),
		    				record : $('#homeRecord2').val()
		    			},
		    			{
		    				player : $('#homePlayer3').val(),
		    				style : $('#homeStyle3').val(),
		    				record : $('#homeRecord3').val()
		    			},
		    			{
		    				player : $('#homePlayer4').val(),
		    				style : $('#homeStyle4').val(),
		    				record : $('#homeRecord4').val()
		    			}
		    		];
		    		
		    		
		    	})
		    })
		    
		    function select(num){
		    	switch(num){
		    	case 1 : 
	    			$hb.attr("class", "btn btn-lg btn-primary"); 
	    			$ab.attr("class", "btn btn-lg btn-light"); 
	    			$hr.attr("checked", true); 
		    		$ar.attr("checked", false);
	    			$defeat.val('${awayTeam.teamNo}');
	    			break;
		    	case 2 : 
		    		$hb.attr("class", "btn btn-lg btn-light"); 
		    		$ab.attr("class", "btn btn-lg btn-primary");
		    		$ar.attr("checked", true);
	    			$hr.attr("checked", false); 
	    			$defeat.val('${homeTeam.teamNo}');
		    		break;
		    	}
		    }
		    
		    </script>
	
	        <hr>
	        <div class="outer-main">
	            <div class="battleHistory">
	            	<br>
	                <h2>배틀기록</h2>
	                <div class="battleRecord">
	                    <div class="left">
	                        <h3>${ homeTeam.teamName }</h3>
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
	                                    <td><input id="homePlayer1" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeStyle1" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeRecord1" class="home" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="homeRecord2" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeStyle2" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeRecord2" class="home" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="homeRecord3" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeStyle3" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeRecord3" class="home" type="text" style="width: 100%"></td>
	                                </tr>
                                    <tr>
	                                    <td><input id="homeRecord4" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeStyle4" class="home" type="text" style="width: 100%"></td>
	                                    <td><input id="homeRecord4" class="home" type="text" style="width: 100%"></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                        <br>
	                    </div>
	            
	                    <div class="right">
	                        <h3>${ awayTeam.teamName }</h3>
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
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
	                                    <td><input type="text" style="width: 100%"></td>
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
	                <button class="btn btn-primary">작성하기</button>
	                <button class="btn btn-danger" onclick="history.back();">취소하기</button>
	            </div>
	        </div>
	    </div>
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>