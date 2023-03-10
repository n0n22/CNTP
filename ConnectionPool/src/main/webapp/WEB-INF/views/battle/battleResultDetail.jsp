<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/css/battle/battleResultDetail.css">

<style>
	        /* 배틀 모달 스타일 */
	    .message-background {
	        position: fixed;
	        top: 0;
	        left: 0;
	        width: 100%;
	        height: 100vh;
	        background-color: rgba(0, 0, 0, 0.3);
	        z-index: 1000;
	
	        /* 숨기기 */
	        z-index: -1;
	        opacity: 0;
	    }
	
	    .message-show {
	        opacity: 1;
	        z-index: 1000;
	        transition: all 0.5s;
	    }
	
	    .message-window {
	        position: relative;
	        width: 100%;
	        height: 100%;
	    }
	
	    .message-popup {
	        position: absolute;
	        top: 50%;
	        left: 50%;
	        transform: translate(-50%, -50%);
	        background-color: white;
	        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	        font-family: 'Pretendard-Regular';
	        border-radius: 3%;
	
	        /* 임시 지정 */
	        width: 480px;
	        height: 280px;
	
	        /* 초기에 약간 아래에 배치 */
	        transform: translate(-50%, -50%);
	        padding: 7px;
	        
	        /* padding-block-start: 30px; */
	    }
	
	    .message-show .message-popup {
	        transform: translate(-50%, -50%);
	        transition: all 0.5s;
	    }
	    /* 모달 스타일 끝 */

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
						    		let d = defRecord[i];
						    		defResult += `<tr>
						    							<td>\${d.player}</td>
						    							<td>\${d.style}</td>
						    							<td>\${d.record}</td>
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
	                <form action="resultEnrollForm.bt" method="post" id="enrollFormSubmit">
	                	<input type="hidden" name="battleNo" value="${battleNo}"/>
	                	<input type="hidden" name="homeTeam" value="${homeTeam.teamNo}"/>
	                	<input type="hidden" name="awayTeam" value="${awayTeam.teamNo}"/>
	                </form>
	                <button class="btn btn-primary" onclick="enrollForm()">결과작성</button>
	                <script>
	                	function enrollForm(){
	                		$('#enrollFormSubmit').submit();
	                	}
	                </script>
                </c:if>
                <!-- 로그인 유저 직급이 'L' && 로그인 유저 팀이 homeTeam && 결과 작성이 되어 있을 경우 => 수정 버튼 -->
                <c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo eq homeTeam.teamNo) and (battleResult.ok eq 'N') and (not empty awayTeam) }">
	                <form action="resultUpdateForm.bt" method="post" id="updateFormSubmit">
	                	<input type="hidden" name="battleNo" value="${battleNo}"/>
	                	<input type="hidden" name="homeTeam" value="${homeTeam.teamNo}"/>
	                	<input type="hidden" name="awayTeam" value="${awayTeam.teamNo}"/>
	                </form>
	                <button class="btn btn-primary" onclick="updateForm()">결과수정</button>
	                <script>
	                	function updateForm(){
	                		$('#updateFormSubmit').submit();
	                	}	
	                </script>
                </c:if>
                
                <!--로그인 유저 직급이 'L' && 로그인 유저 팀이 awayTeam && 결과가 작성이 되어 있을 경우(N) -->
                <c:if test="${ (loginMember.teamGrade eq 'L') and (loginMember.teamNo eq awayTeam.teamNo) and (battleResult.ok eq 'N') }">
	                <button class="btn btn-info" onclick="ok();">승인</button>
	                <button class="btn btn-warning show">이의제기</button>
                </c:if>
                <button class="btn btn-danger" onclick="back();">뒤로가기</button>
                
                <!-- 이의제기 모달 -->
			    <div class="message-background">
					<div class="message-window">
						<div class="message-popup">
							<div class="message-area" align="center">
								<h3>이의제기</h3>
								<br>
									<textarea id="msgContent" rows="5" name="chatContent" maxlength="150"
										style="width: 400px; resize: none;" placeholder="이의제기" required="required"></textarea>
									<br> <br>
									<button onclick="battleObjection();" class="btn btn-warning">이의제기</button>
									<button type="button" id="close" class="btn btn-danger">취소</button>
							</div>
						</div>
					</div>
			    </div>
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
    	
    	function battleObjection(){
    		messageClose();
    		$.ajax({
    			url : "battleObjection.bt",
    			type : "post",
    			data : {
    				teamNo : '${ loginMember.teamNo }',
    				memNo : ${ loginMember.memNo },
    				battleNo : ${ battleNo },
    				chatContent : $('#msgContent').val()
    			},
    			success : function(data){
    				if(data > 0) alert('이의제기 성공');
    				else alert('이의제기 실패');
    			}
    		})
    	}
    	
    	
		// 메시지 모달 실행 및 종료 함수
        document.querySelector(".show").addEventListener("click", messageShow);
        document.querySelector("#close").addEventListener("click", messageClose);
		
        function messageShow() {
        document.getElementById("msgContent").value = '';
        document.querySelector(".message-background").className = "message-background message-show";
        }
    
        function messageClose() {
            document.querySelector(".message-background").className = "message-background";
        }
    
    </script>
	
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>