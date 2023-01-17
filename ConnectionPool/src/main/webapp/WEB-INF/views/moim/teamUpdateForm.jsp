<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.teamUpdateFormTable input[type=text], select, textarea{
		width: 95%;
		height: 100%;
		border: 0px;
		padding: 0px;
	}

	.teamUpdateFormTable td{
		padding:0px;
	}

	.teamUpdateFormTable textarea{
		height:100px;
	}
	
	.teamUpdateFormTable th{
		text-align: center;
	}

</style>
</head>


<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br><br>

	<div class="outer">
	
	    <h3 align="center">팀 정보 수정하기</h3>
	    <br>
	
		<form action="updateTeam.mo" method="post" enctype="multipart/form-data">
		
		    <table align="center" border="1" class="teamUpdateFormTable">
		        <tr height="50">
		            <th width="200">팀 이름<br>
		            <td width="400">
						${ team.teamName }					
		            </td>
		        </tr>
		        <tr height="50">
		            <th>팀 인원</th>
		            <td>
		                <input type="number" name="teamMember" value="${ team.teamMember }" max="12" min="${ teamMemberCount}" required>명<br>
		                * 현재 팀원보다는 작게 설정할 수 없습니다.
		            </td>
		        </tr>
		        <tr>
		            <th>팀 소개</th>
		            <td>
		                <textarea name="teamIntro" cols="30" rows="10" style="resize:none" required maxlength="300">${team.teamIntro }</textarea>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>주 활동지역</th>
		            <td>
		            	<c:choose>
		            		<c:when test="${ teamMemberCount > 1 }">
		            			${ team.korArea }<br>
		            			* 팀원이 존재하기 때문에 변경할 수 없습니다.
		            		</c:when>
		            		<c:otherwise>
				                <select name="teamArea" id="teamArea">
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
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>주 활동시간</th>
		            <td>
		                <select name="teamTime" id="teamTime">
		                    <option value="all">무관</option>
		                    <option value="weekday">평일</option>
		                    <option value="weekend">주말</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>우리팀 키워드</th>
		            <td colspan="2">
		                <input type="radio" id="battle" name="keyword" value="battle">
		                <label class="keyword" for="battle">배틀</label>
		                <input type="radio" id="social" name="keyword" value="social">
		                <label class="keyword" for="social">친목</label>
		                <input type="radio" id="online" name="keyword" value="online">
		                <label class="keyword" for="online">온라인모임만</label>
		            </td>
		        </tr>
		        <tr height="50">
		            <th>팀 사진 등록</th>
		            <td colspan="2">
		                <input type="file" id="teamImg" name="reUpfile">
	            		<c:if test="${ not empty team.originName }">
	            			현재 업로드된 파일 : 
	            			<a href="${ team.changeName }" download="${ team.originName }">${ team.originName }</a>
	            		</c:if>
		            </td>
		        </tr>
		        
		        <tr height="50">
		            <th>뱃지 등록</th>
		            <c:choose>
		            	<c:when test="${ team.badgeStatus eq 'N' }">
				            <td colspan="2">
				                * 팀 페이지에서 뱃지 구매 시 사용 가능합니다 
				            </td>
		            	</c:when>
		            	<c:otherwise>
		            		<td colspan="2">
				                <input type="file" id="badgeImg" name="reUpfile">
				                <c:if test="${ not empty team.badgeOriginName }">
	            				현재 업로드된 파일 : 
	            			<a href="${ team.badgeChangeName }" download="${ team.badgeOriginName }">${ team.badgeOriginName }</a>
	            		</c:if>
				            </td>
		            	</c:otherwise>
		            </c:choose>
		        </tr>
		        <!-- 이미 파워 등록을 했는지 확인이 필요 -->
		        <tr height="50">
		            <th>파워등록</th>
		            <td colspan="2">
		            	<c:choose>
					        <c:when test="${ team.powerDuration eq 'false' }">
				                <input type="checkbox" id="powerDuration" class="powerDuration" name="powerDuration" value="true"><br>
			                	<label for="powerDuration"> 파워 등록 시 10P가 소요됩니다. </label> 
					        </c:when>
					        <c:otherwise>
					        	<label>파워등록기간입니다(${team.powerDuration }까지)</label>
					        </c:otherwise>
				        </c:choose>
		            </td>
		        </tr>
		    </table>
		    <br><br>
		
			<input name="originName" value="${ team.originName }" type="hidden">
			<input name="changeName" value="${ team.changeName }" type="hidden">
			<input type="hidden" name="badgeOriginName" value="${ team.badgeOriginName }">
            <input type="hidden" name="badgeChangeName" value="${ team.badgeChangeName }">
            <input type="hidden" name="badgeStatus" value="${ team.badgeStatus }">
			<input name="teamNo" value="${ team.teamNo }" type="hidden">
		    <div align="center">
		        <a href="teamPage.mo?teamNo=${ team.teamNo }" class="btn btn-primary">취소하기</a> <button class="btn btn-primary">수정하기</button>
		    </div>
		</form>
	</div>

	<br><br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$('.teamUpdateFormTable #teamArea option').each(function(index, option){
				if($(this).text() == '${ team.teamArea }'){
					$(this).attr('selected', 'true');
				}
			})
			
			$('.teamUpdateFormTable #teamTime option').each(function(index, option){
				if($(this).text() == '${ team.teamTime }'){
					$(this).attr('selected', 'true');
				}
			})
			
			$('.teamUpdateFormTable .keyword').each(function(index, option){
				if($(this).text() == '${ team.keyword }'){
					$(this).prev().attr('checked', 'true');
				}
			})
		})
	</script>


</body>
</html>