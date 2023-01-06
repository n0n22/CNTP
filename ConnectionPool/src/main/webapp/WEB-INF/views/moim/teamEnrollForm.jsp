<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    
		<!-- th태그들 안은 당연하게 중앙 정렬이라 후에 왼쪽 정렬 바꿔주자 -->
	    <table align="center" border="1" class="teamEnrollFormTable">
	        <tr height="50">
	            <th>팀 이름<br>*팀 이름은 추후 수정 불가</th>
	            <td>
	                <input type="text" name="teamName">
	            </td>
	            <td></td>
	        </tr>
	        <tr height="50">
	            <th width="200">팀 인원</th>
	            <td width="400">
	                <input type="number" name="teamMember" max="12" min="2">명
	            </td>
	            <td></td>
	        </tr>
	        <tr>
	            <th>팀 소개</th>
	            <td>
	                <textarea name="teamIntro" cols="30" rows="10" style="resize:none"></textarea>
	            </td>
	            <td></td>
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
							<option value="Jeonabuk">전라북도</option>
							<option value="Jeonnam">전라남도</option>
							<option value="Gyeongbuk">경상북도</option>
							<option value="Gyeongnam">경상남도</option>
	                </select>
	            </td>
	            <td></td>
	        </tr>
	        <tr height="50">
	            <th>주 활동시간</th>
	            <td>
					<select name="teamTime">
	                    <option value="weekday">평일</option>
	                    <option value="weekend">주말</option>
	                </select>
	            </td>
	            <td></td>
	        </tr>
	        <tr height="50">
	            <th>우리팀 키워드</th>
	            <td colspan="2">
	                <input type="radio" name="keyword" value="battle"> 배틀
	                <input type="radio" name="keyword" value="social"> 친목
	                <input type="radio" name="keyword" value="info"> 정보나눔
	                <input type="radio" name="keyword" value="online"> 온라인모임만
	            </td>
	        </tr>
	        <tr height="50">
	            <th>파워등록</th>
	            <td colspan="2">
	                <input type="checkbox" class="powerDuration" name="powerDuration"> 파워 등록 시 10P가 소요됩니다. 
	            </td>
	        </tr>
	
	    </table>
	    <br><br>
	
	    <div class="TE_point_area" align="center">
	        <p class="cost">소요 포인트 : 50</p>
	        <!-- checkbox 선택됐을 경우 소요포인트를 변경 -->
	        <p>현재 내 포인트 : </p>
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
	        <input type="checkbox"> 위 내용을 숙지하고 동의합니다. <br><br>
	        <a href="#">취소하기</a> <button>팀 생성하기</button>
	    </div>

	</div>
	
	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			$('.powerDuration').on('change', function(){

				if($('.powerDuration').is(':checked')) {
					$('.cost').html('소요 포인트 : 60');
				}
				else{
					$('.cost').html('소요 포인트 : 50');
				}
			})
		})
	</script>
</body>
</html>