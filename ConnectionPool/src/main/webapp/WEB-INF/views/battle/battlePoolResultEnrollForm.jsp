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
<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/css/battle/battlePoolResultEnrollForm.css">
 

</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
		<div class="outer" align="center">
	<form action="insertBattleResult.bt" method="post" id="submit">
			<input type="hidden" name="battleNo" value="${battleNo}"/>
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
		                            <button type="button" id="homeTeamButton" class="btn btn-lg btn-primary" onclick="select(1)">승리팀</button> <input id="homeTeamRadio" type="radio" name="victory" hidden="hidden" value="${ homeTeam.teamNo }" checked>
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
		                            <button type="button" id="awayTeamButton" class="btn btn-lg btn-light" onclick="select(2)">승리팀</button> <input id="awayTeamRadio" type="radio" name="victory" hidden="hidden" value="${ awayTeam.teamNo }">
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
		    	
		    	$('.vic').change(function(){
		    		var vicRecord = [
		    			{
		    				player : $('#vicPlayer1').val(),
		    				style : $('#vicStyle1').val(),
		    				record : $('#vicRecord1').val()
		    			},
		    			{
		    				player : $('#vicPlayer2').val(),
		    				style : $('#vicStyle2').val(),
		    				record : $('#vicRecord2').val()
		    			},
		    			{
		    				player : $('#vicPlayer3').val(),
		    				style : $('#vicStyle3').val(),
		    				record : $('#vicRecord3').val()
		    			},
		    			{
		    				player : $('#vicPlayer4').val(),
		    				style : $('#vicStyle4').val(),
		    				record : $('#vicRecord4').val()
		    			}
		    		];
		    		$('#vicRecord').val(JSON.stringify(vicRecord));
		    	})
		    	
		    	$('.def').change(function(){
		    		var defRecord = [
		    			{
		    				player : $('#defPlayer1').val(),
		    				style : $('#defStyle1').val(),
		    				record : $('#defRecord1').val()
		    			},
		    			{
		    				player : $('#defPlayer2').val(),
		    				style : $('#defStyle2').val(),
		    				record : $('#defRecord2').val()
		    			},
		    			{
		    				player : $('#defPlayer3').val(),
		    				style : $('#defStyle3').val(),
		    				record : $('#defRecord3').val()
		    			},
		    			{
		    				player : $('#defPlayer4').val(),
		    				style : $('#defStyle4').val(),
		    				record : $('#defRecord4').val()
		    			}
		    		];
		    		$('#defRecord').val(JSON.stringify(defRecord));
		    	})
		    })
		    
		    function select(num){
		    	switch(num){
		    	// 홈팀
		    	case 1 : 
	    			$hb.attr("class", "btn btn-lg btn-primary"); 
	    			$ab.attr("class", "btn btn-lg btn-light"); 
	    			$hr.attr("checked", true); 
		    		$ar.attr("checked", false);
	    			$defeat.val('${awayTeam.teamNo}');
	    			$('#vicRecord').val();
	    			break;
	    		// 어웨이팀
		    	case 2 : 
		    		$hb.attr("class", "btn btn-lg btn-light"); 
		    		$ab.attr("class", "btn btn-lg btn-primary");
		    		$ar.attr("checked", true);
	    			$hr.attr("checked", false); 
	    			$defeat.val('${homeTeam.teamNo}');
		    		break;
		    	}
		    }
		    function submit(){
		    	// 배틀 기록을 등록하지 않으면 submit을 실행할수 없음
		    	if($('#vicRecord').val() == '' || $('#defRecord').val() == ''){
		    		alert('배틀 기록을 등록해주세요!');
		    		return;
		    	}
		    	$("#submit").submit();
		    }
		    
		    </script>
	
	        <hr>
	        <div class="outer-main">
	            <div class="battleHistory">
	            	<br>
	                <h2>배틀기록</h2>
	                <div class="battleRecord">
	                    
	                    <div class="content">
	                    	<button class="btn btn-lg btn-primary disabled">승리팀</button>
	                    	<br><br>
	                        <table id="victoryTeam" style="text-aligin:center">
	                            <thead>
	                                <tr style="text-align: center;">
	                                    <th>선수</th>
	                                    <th>종목</th>
	                                    <th style="width: 150px;">기록</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><input id="vicPlayer1" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicStyle1" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicRecord1" class="vic" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="vicPlayer2" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicStyle2" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicRecord2" class="vic" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="vicPlayer3" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicStyle3" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicRecord3" class="vic" type="text" style="width: 100%"></td>
	                                </tr>
                                    <tr>
	                                    <td><input id="vicPlayer4" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicStyle4" class="vic" type="text" style="width: 100%"></td>
	                                    <td><input id="vicRecord4" class="vic" type="text" style="width: 100%"></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                        <br><br>
	                        
	                        <button class="btn btn-lg btn-danger disabled">패배팀</button>
	                        
	                        <table id="defeatTeam" style="text-align: center">
	                            <thead>
	                                <tr style="text-align: center;">
	                                    <th>선수</th>
	                                    <th>종목</th>
	                                    <th style="width: 150px;">기록</th>
	                                </tr>
	                            </thead>
	                            <tbody>
                 	                <tr>
	                                    <td><input id="defPlayer1" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defStyle1" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defRecord1" class="def" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="defPlayer2" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defStyle2" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defRecord2" class="def" type="text" style="width: 100%"></td>
	                                </tr>
	                                <tr>
	                                    <td><input id="defPlayer3" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defStyle3" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defRecord3" class="def" type="text" style="width: 100%"></td>
	                                </tr>
                                    <tr>
	                                    <td><input id="defPlayer4" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defStyle4" class="def" type="text" style="width: 100%"></td>
	                                    <td><input id="defRecord4" class="def" type="text" style="width: 100%"></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                        
	                    </div>
	            
	                </div>
	            </div>
	            <br clear="both">
	        </div>
	        <hr>
	        <div class="outer-bottom">
	            <div class="submit-area">
	                <br>
	                <button class="btn btn-primary" onclick="submit();">작성하기</button>
	                <button class="btn btn-danger" onclick="history.back();">취소하기</button>
	            </div>
	        </div>
	    </div>
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>