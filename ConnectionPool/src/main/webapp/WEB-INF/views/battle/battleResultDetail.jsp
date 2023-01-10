<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src=""></script>
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

        div.content{
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
	                            <h3 class="text-center m-b-10">${ homeTeam.teamName }</h3> 
	                            <c:if test="${ homeTeam.badgeStatus eq 'Y'}">
		                            <img class="m-b-10" src="${ homeTeam.badgeChangeName }" height="100" width="100">
	                            </c:if>
	                            <c:if test="${ homeTeam.badgeStatus eq 'N'}">
		                            <img class="m-b-10" src="https://i.imgur.com/n6Lg8ES.png" height="100" width="100">
	                            </c:if>
	                            <p class="text-center">${ homeTeamHistory.victory + homeTeamHistory.defeat }전 ${ homeTeamHistory.victory }승 ${ homeTeamHistory.defeat }패</p> 
	                            <c:if test="${ homeTeam.teamNo eq battleResult.victory }">
		                            <button class="btn btn-lg btn-primary" disabled>승리</button>
	                            </c:if>
	                            <c:if test="${ homeTeam.teamNo eq battleResult.defeat }">
		                            <button class="btn btn-lg btn-danger" disabled>패배</button>
	                            </c:if>
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
	                            <p class="text-center">${ awayTeamHistory.victory + awayTeamHistory.defeat }전 ${ awayTeamHistory.victory }승 ${ awayTeamHistory.defeat }패</p>
	                            <c:if test="${ awayTeam.teamNo eq battleResult.victory }">
		                            <button class="btn btn-lg btn-primary" disabled>승리</button>
	                            </c:if>
	                            <c:if test="${ awayTeam.teamNo eq battleResult.defeat}">
		                            <button class="btn btn-lg btn-danger" disabled>패배</button>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <script>
	    	$(function(){
		    	let battleResult = ${battleResult.vicRecord};
		    	for(let i in battleResult){
		    		
		    	}
	    	})
	    </script>
	

        <hr>
        <div class="outer-main">
            <div class="battleHistory">
            	<br>
                <h2>
                	배틀기록
                	<c:if test="${ battleResult.ok eq 'N'}">(승인전)</c:if>
                </h2>
                <c:if test="${ battleResult == null }">
	                <div class="battleRecord">
	                	<h3>경기 전입니다.</h3>
	                </div>
                </c:if>
                <c:if test="${ battleResult != null }">
                	    <script>
					    	$(function(){
						    	let vicRecord = ${battleResult.vicRecord};
						    	let defRecord = ${battleResult.defRecord};
						    	let vicResult = '';
						    	let defResult = '';
						    	for(let i in vicRecord){
						    		let v = vicRecord[i];
						    		vicResult += `<tr>
						    							<td>\${v.player}</td>
						    							<td>\${v.style}</td>
						    							<td>\${v.record}</td>
						    					  </tr>`
						    	};
						    	for(let i in defRecord){
						    		let v = defRecord[i];
						    		defResult += `<tr>
						    							<td>\${v.player}</td>
						    							<td>\${v.style}</td>
						    							<td>\${v.record}</td>
						    					  </tr>`
						    	};
						    	$('#victoryTeam tbody').html(vicResult);
						    	$('#defeatTeam tbody').html(defResult);
					    	})
					    </script>
                
	                <div class="battleRecord">
	                    <div class="content">
	                        <button class="btn btn-lg btn-primary" disabled>승리팀</button>
	                        <br><br>
	                        <table id="victoryTeam" style="text-align: center;">
	                            <thead>
	                                <tr style="text-align: center;">
	                                    <th>선수</th>
	                                    <th>종목</th>
	                                    <th style="width: 150px;">기록</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                
	                            </tbody>
	                        </table>
	                        <br>
	                        
	                        <br><br>
	                        
	                        <button class="btn btn-lg btn-danger" disabled>패배팀</button>
	                        <br><br>
	                        <table id="defeatTeam" style="text-align: center;">
	                            <thead>
	                                <tr style="text-align: center;">
	                                    <th>선수</th>
	                                    <th>종목</th>
	                                    <th style="width: 150px;">기록</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                        </table>
	                    </div>
	                    
	                </div>
                </c:if>
                
                
            </div>
            <br clear="both">
        </div>
        <hr>
        <div class="outer-bottom">
            <div class="submit-area">
                <br>
                <button class="btn btn-primary" onclick="location.href='resultEnrollForm.bt?battleNo=${battleNo}&homeTeam=${homeTeam.teamNo}&awayTeam=${awayTeam.teamNo}'">결과작성</button>
                <button class="btn btn-info">승인</button>
                <button class="btn btn-warning">이의제기</button>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>