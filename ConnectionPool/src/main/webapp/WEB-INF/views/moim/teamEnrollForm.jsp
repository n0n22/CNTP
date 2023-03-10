<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.TE_point_area{
		
		background-color: antiquewhite;
		border-radius: 5px;
		width: 600px;
		padding-top: 5px;
		padding-bottom: 5px;
	}

	.teamEnrollFormTable input[type=text], select, textarea{
		width: 95%;
		height: 100%;
		border: 0px;
		padding: 0px;
	}

	.teamEnrollFormTable td{
		padding:0px;
	}

	.teamEnrollFormTable textarea{
		height:100px;
	}
	
	.teamEnrollFormTable th{
		text-align: center;
	}

</style>
</head>
<body>

	<!-- 세션 로그인 유저에서 포인트를 뽑아 -->
	
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>

	<div class="outer" align="center">
	
	    <h3 align="center">팀 만들기 신청</h3>
	    
	    <br>
	    
		<h6 align="center">팀을 생성하여 팀원들을 모집하고 배틀에 참가해보세요!</h6>
	    
	    
	    <form action="insertTeam.mo" method="post" enctype="multipart/form-data">
			<!-- th태그들 안은 당연하게 중앙 정렬이라 후에 왼쪽 정렬 바꿔주자 -->
		    <table align="center" border="1" class="teamEnrollFormTable">
		        <tr height="50">
		            <th>팀 이름<br>*팀 이름은 추후 수정 불가</th>
		            <td>
		                <input type="text" name="teamName" class="teamName" required>
		                <input type="hidden" name="memNo" value="${ loginMember.memNo }">
		                <label class="checkResult"></label>
		            </td>
		        </tr>
		        <tr height="50">
		            <th width="200">팀 인원</th>
		            <td width="400">
		                <input type="number" name="teamMember" max="12" min="2" required value="2">명
		            </td>
		        </tr>
		        <tr>
		            <th>팀 소개</th>
		            <td>
		                <textarea name="teamIntro" cols="30" rows="10" style="resize:none" required placeholder="간략하게 팀 소개를 작성해주세요.(최대 300글자)" maxlength="300"></textarea>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>주 활동지역</th>
		            <td>
		                <select name="teamArea">
		                    <option value="Seoul">서울특별시</option>
							<option value="Gyeonggi">경기도</option>
							<option value="Gangwon">강원도</option>
							<option value="Chungbuk">충청북도</option>
							<option value="Chungnam">충청남도</option>
							<option value="Jeonbuk">전라북도</option>
							<option value="Jeonnam">전라남도</option>
							<option value="Gyeongbuk">경상북도</option>
							<option value="Gyeongnam">경상남도</option>
		                </select>
		                <br>* 팀원 가입 시 지역 변경이 어려우니 신중히 선택해주세요.
		            </td>
		        </tr>
		        <tr height="50">
		            <th>주 활동시간</th>
		            <td>
						<select name="teamTime">
		                    <option value="all">무관</option>
		                    <option value="weekday">평일</option>
		                    <option value="weekend">주말</option>
		                </select>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>우리팀 키워드</th>
		            <td colspan="2">
		            	
		                <input type="radio" id="battle" name="keyword" value="battle" checked>
		                <label for="battle">배틀</label>
		                <input type="radio" id="social" name="keyword" value="social">
		                <label for="social">친목</label>
		                <input type="radio" id="online" name="keyword" value="online">
		                <label for="online">온라인모임만</label>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>팀 사진 등록</th>
		            <td colspan="2">
		                <input type="file" id="upfile" name="upfile" required>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>파워등록</th>
		            <td colspan="2">
		            	<c:choose>
		            		<c:when test="${ loginMember.memPoint >= 60 }">
				                <input type="checkbox" id="powerDuration" class="powerDuration" name="powerDuration" value="true"> 
				                <label for="powerDuration"> 파워 등록 시 10P가 소요됩니다. </label> 
		            		</c:when>
		            		<c:otherwise>
		            			<input type="checkbox" id="powerDuration" class="powerDuration" name="powerDuration" disabled> 
				                <label for="powerDuration"> 파워 등록 시 10P가 소요됩니다. </label> 
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
		
		    </table>
	    <br><br>
	
	    <div class="TE_point_area" align="center">
	        <p class="cost">소요 포인트 : 50</p>
	        <!-- checkbox 선택됐을 경우 소요포인트를 변경 -->
	        <p>현재 내 포인트 : ${ loginMember.memPoint }</p>
	    </div>
	
	    <div class="TE_info_area" align="center">
	        <p>
	            * 팀 생성 시 50P가 차감되며, 팀원 모집 글 작성 시 취소 및 환불이 불가합니다. <br>
	            * 팀장 탈퇴 시 부팀장이 있을 경우 팀장 권한은 부팀장에 승계되며<br>
	            	부팀장 부재 시 팀 가입일시가 가장 빠른 팀원에 팀장 권한이 승계됩니다.<br>
	            * 팀원이 없을 경우 팀장 탈퇴 시 팀은 자동으로 삭제되며 이는 복구가 불가합니다.<br>
	            * 부적절한 팀 활동 시 무통보 삭제 가능
	        </p>
	    </div>
	
	    <br>
	
	    <div align="center">
	        <input id="agreeCheck" type="checkbox" class="agreeCheck">
	        <label for="agreeCheck">위 내용을 숙지하고 동의합니다.</label> <br><br>
	        <c:choose>
	        	<c:when test="${ loginMember.memPoint >= 50 }">
	        		<a href="#">취소하기</a> <button class="teamEnrollBtn" disabled onclick="return checkAgree();">팀 생성하기</button>
	        	</c:when>
	        	<c:otherwise>
	        		<p>포인트가 부족합니다 ㅠㅠ</p>
	        	</c:otherwise>
	        </c:choose>
	    </div>

		</form>
	</div>
	
	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			
			// 파워 글 등록 시 60포인트 소멸 안내로 바뀜
			$('.powerDuration').on('change', function(){

				if($('.powerDuration').is(':checked')) {
					$('.cost').html('소요 포인트 : 60');
				}
				else{
					$('.cost').html('소요 포인트 : 50');
				}
			})
			
			// 팀 이름 입력 시 사용 가능한지 라벨 달아줄 것
			// 팀 이름 적는 input 태그를 변수에 담아줌
			const $teamName = $('.teamEnrollFormTable .teamName');
			
			$teamName.keyup(function(){
				
				if($teamName.val().length > 0){
					$.ajax({
						url : "checkTeamName.mo",
						data : {checkName : $teamName.val()},
						success : function(result){
							
							if(result == 'NNNNN'){
								$('.checkResult').text('이미 사용되고 있는 팀 이름입니다.');
								$('.teamEnrollBtn').attr('disabled', 'true');
							}else{
								$('.checkResult').text('멋진 팀 이름이네요!');
								$('.teamEnrollBtn').removeAttr('disabled');
							}
						},
						error: function(){
							console.log('아이디 중복체크용 ajax 통신 실패');
						}
					});
				} else{
					$('.checkResult').text("팀 이름을 작성해주세요");
					$('.teamEnrollBtn').attr('disabled', 'true');
				}
			})
			
		})
		
		function checkAgree(){
			if($('.agreeCheck').is(':checked')){
				return true;
			} else{
				alert('안내사항에 동의해주시기 바랍니다.');
				return false;
			}
		}
		
		
	</script>
</body>
</html>