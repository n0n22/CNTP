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
<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/css/battle/battleResultDetail.css">

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
		                            <img class="m-b-10" src="resources/images/noBadge.png" height="100" width="100">
	                            </c:if>
	                            <p class="text-center">${ homeTeamHistory.record }전 ${ homeTeamHistory.victory }승 ${ homeTeamHistory.defeat }패 
	                            	<br>승률(${ homeTeamHistory.winRate }%)</p> 
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
	                            <h3 class="text-center m-b-10"><c:out value="${ awayTeam.teamName }" default="아직 대전 상대가 없습니다."/></h3> 
	                            <c:if test="${ awayTeam.badgeStatus eq 'Y'}">
		                            <img class="m-b-10" src="${ awayTeam.badgeChangeName }" height="100" width="100">
	                            </c:if>
	                            <c:if test="${ awayTeam.badgeStatus eq 'N' or empty awayTeam}">
		                            <img class="m-b-10" src="resources/images/noBadge.png" height="100" width="100">
	                            </c:if>
	                            <p class="text-center">
		                            <c:out value="${awayTeamHistory.record}" default="0"/>전 
		                            <c:out value="${awayTeamHistory.victory}" default="0"/>승 
		                            <c:out value="${awayTeamHistory.defeat}" default="0"/>패
	                            	<br>승률(<c:out value="${awayTeamHistory.winRate}" default="0.0"/>%)</p>
	                            <c:if test="${ awayTeam.teamNo eq battleResult.victory and not empty awayTeam }">
		                            <button class="btn btn-lg btn-primary" disabled>승리</button>
	                            </c:if>
	                            <c:if test="${ awayTeam.teamNo eq battleResult.defeat and not empty awayTeam}">
		                            <button class="btn btn-lg btn-danger" disabled>패배</button>
	                            </c:if>
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
                <!-- 로그인 유저 직급이 'L' && 로그인 유저 팀이 homeTeam && 결과 작성이 안되어 있을 경우 => 작성 버튼 -->
                <c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo eq homeTeam.teamNo) and (empty battleResult) and (not empty awayTeam) }">
	                <button class="btn btn-primary" onclick="location.href='resultEnrollForm.bt?battleNo=${battleNo}&homeTeam=${homeTeam.teamNo}&awayTeam=${awayTeam.teamNo}'">결과작성</button>
                </c:if>
                <!-- 로그인 유저 직급이 'L' && 로그인 유저 팀이 homeTeam && 결과 작성이 되어 있을 경우 => 수정 버튼 -->
                <c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo eq homeTeam.teamNo) and (battleResult.ok eq 'N') and (not empty awayTeam) }">
	                <button class="btn btn-primary" onclick="location.href='resultEnrollForm.bt?battleNo=${battleNo}&homeTeam=${homeTeam.teamNo}&awayTeam=${awayTeam.teamNo}'">결과수정</button>
                </c:if>
                
                <!--로그인 유저 직급이 'L' && 로그인 유저 팀이 awayTeam && 결과가 작성이 되어 있을 경우(N) -->
                <c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo eq awayTeam.teamNo) and (battleResult.ok eq 'N') }">
	                <button class="btn btn-info" onclick="ok();">승인</button>
	                <button class="btn btn-warning">이의제기</button>
                </c:if>
                <button class="btn btn-danger" onclick="back();">뒤로가기</button>
            </div>
        </div>
    </div>
    
    <form action="battleResultOk.bt" method="post">
    	<input type="hidden" name="battleNo" value="${ battleNo }">
    	<input type="hidden" name="victoryTeamNo" value="${battleResult.victory}">
    	<input type="hidden" name="defeatTeamNo" value="${battleResult.defeat}">
    </form>
    
    <script>
    	function back(){
    		location.href= 'battleDetail.bt?battleNo=${battleNo}';
    	}
    	
    	function ok(){
    		if(confirm('경기 결과에 승인하시겠습니까?')){
	    		$('form[action="battleResultOk.bt"]').submit();
    		}
    		return;
    	}
    
    </script>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>