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
			                            <img class="m-b-10" src="resources/images/noBadge.png" height="100" width="100">
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
			                            <img class="m-b-10" src="resources/images/noBadge.png" height="100" width="100">
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
	
	
	        <hr>
	        <div class="outer-main">
	            <div class="battleHistory">
	            	<br>
	                <h2>배틀기록</h2>
	                <div class="battleRecord">
	                    <button class="btn btn btn-primary" onclick="add()">추가</button>
						<button class="btn btn btn-danger" onclick="remove()">삭제</button>
						<br><br>
	                    <div class="content">
	                    	<button class="btn btn-lg btn-primary disabled">승리팀</button>
	                    	<br><br>
	                        <table id="victoryTeam" style="text-align:center" border="1">
						        <thead>
						            <tr style="text-align: center;">
						                <th>선수</th>
						                <th>종목</th>
						                <th style="width: 150px;">기록</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr class="vics">
						                <td><input id="vicPlayer1" class="vic" type="text" style="width: 100%"></td>
						                <td><input id="vicStyle1" class="vic" type="text" style="width: 100%"></td>
						                <td><input id="vicRecord1" class="vic" type="text" style="width: 100%"></td>
						            </tr>
						        </tbody>
						    </table>
	                        <br><br>
	                        
	                        <button class="btn btn-lg btn-danger disabled">패배팀</button>
	                        
						    <table id="defeatTeam" style="text-align:center" border="1">
						        <thead>
						            <tr style="text-align: center;">
						                <th>선수</th>
						                <th>종목</th>
						                <th style="width: 150px;">기록</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr class="defs">
						                <td><input id="defPlayer1" class="def" type="text" style="width: 100%"></td>
						                <td><input id="defStyle1" class="def" type="text" style="width: 100%"></td>
						                <td><input id="defRecord1" class="def" type="text" style="width: 100%"></td>
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
	
	
		    <script>
		    let $hb = $('#homeTeamButton');
		    let $ab = $('#awayTeamButton');
		    let $hr = $('#homeTeamRadio');
		    let $ar = $('#awayTeamRadio');
		    let $defeat = $('#defeat');
		    
		    $(function(){
		    	$defeat.val('${awayTeam.teamNo}');
		        $(document).on('change', '.vics>td>.vic', function(){
		            inputVic();
		        })
		        $(document).on('change', '.defs>td>.def', function(){
		            inputDef();
		        })
		    });
		    function inputVic(){
	            var turn = $vicParents.children().length;
	            let vicRecords = [];
	            for(i = 0; i < turn; i++){
	                var vicRecord = {
	                        player : $('#vicPlayer' + (i + 1)).val(),
	                        style : $('#vicStyle' + (i + 1)).val(),
	                        record : $('#vicRecord' + (i + 1)).val()
		            }
		                vicRecords.push(vicRecord);
		            }
		            $('#vicRecord').val(JSON.stringify(vicRecords));
		    }
		    function inputDef(){
		            var turn = $defParents.children().length;
		            let defRecords = [];
		            for(i = 0; i < turn; i++){
		                var defRecord = {
		                        player : $('#defPlayer' + (i + 1)).val(),
		                        style : $('#defStyle' + (i + 1)).val(),
		                        record : $('#defRecord' + (i + 1)).val()
		                }
		                defRecords.push(defRecord);
		            }
		            $('#defRecord').val(JSON.stringify(defRecords));
		    }
		    var $vicParents = $('#victoryTeam tbody');
		    var $defParents = $('#defeatTeam tbody');
		    var turn = ''
		    function add(){
		        turn = $vicParents.children().length + 1;
		        if(turn > 8){
		            alert("최대 8개까지 입력가능합니다.");
		            return;
		        }
		        var vicChildren = 
		                `<tr class="vics">
		                    <td><input id="vicPlayer\${turn}" class="vic" type="text" style="width: 100%"></td>
		                    <td><input id="vicStyle\${turn}" class="vic" type="text" style="width: 100%"></td>
		                    <td><input id="vicRecord\${turn}" class="vic" type="text" style="width: 100%"></td>
		                </tr>`;
		        var defChildren = 
		                `<tr class="defs">
		                    <td><input id="defPlayer\${turn}" class="def" type="text" style="width: 100%"></td>
		                    <td><input id="defStyle\${turn}" class="def" type="text" style="width: 100%"></td>
		                    <td><input id="defRecord\${turn}" class="def" type="text" style="width: 100%"></td>
		                </tr>`;
		        $vicParents.append(vicChildren);
		        $defParents.append(defChildren);
		    }
	
		    function remove(){
		        turn = $vicParents.children().length;
		        if(turn <= 1){
		            alert("최소 1개는 입력해야 합니다.")
		            return;
		        }
		        
		        $vicParents.children().last().remove();
		        $defParents.children().last().remove();
	
		        inputVic();
		        inputDef();
	
		    }
		    
		    
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


</body>
</html>