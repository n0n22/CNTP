<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 참여</title>

<style>
	.teamListTable tbody tr:hover{
		cursor: pointer;
	}

	.pagingArea{
		align-content: center;
		align-items:center;
	}
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>
	
	<div class="outer" align="center">
	<br><br>
		<div style="width:1300px">
			<div class="teamListTitle" align="left">
				<h3>팀 참여</h3>
				<h5>팀에 소속되어 친목 및 배틀을 즐겨보세요</h5>
				<hr>
			</div>
	
			<br>
			
			<div class="teamListCondition" align="right">
				모집여부
				<select name="teamMember" class="teamMember">
					<option value="all">전체</option>
					<option value="recruit">모집중만</option>
					<option value="end">모집완료</option>
				</select>
				지역
				<select name="teamArea" class="teamArea">
					<option value="all">전체</option>
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
				키워드
				<select name="keyword" class="keyword">
					<option value="all">전체</option>
					<option value="battle">배틀</option>
					<option value="social">친목</option>
					<option value="online">온라인만</option>
				</select>
			</div>
			
			<br>
			
			<table class="table table-hover teamListTable" border="1">
				<thead class="thead-dark">
					<tr>
						<th width="150">유형</th>
						<th width="150">지역</th>
						<th width="100">팀장</th>
						<th width="200">팀명</th>
						<th width="150">모집인원</th>
						<th width="200">키워드</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ empty teamList }">
							<tr>
								<td colspan="7">조회된 팀이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ teamList }" var="team" varStatus="i">
								<tr>
									<td  style="display:none" >
										${ i.count }
										<p style="display:none" class="thisTeamNo">${ team.teamNo }</p>
									</td>
									<td>${ team.powerDuration }</td>
									<td>${ team.korArea }</td>
									<td>${ team.nickname }</td>
									<td>${ team.teamName }</td>
									<td>${ team.teamMember }</td>
									<td>${ team.keyword }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<div id="pagingArea" align="center">
				<ul class="pagination" align="center">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link" href="teamList.mo?cpage=${ pi.currentPage - 1 }&teamArea=${ team.teamArea }&teamMember=${ team.teamMember }&keyword=${ team.keyword }">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" disabled>Previous</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="teamList.mo?cpage=${ p }&teamArea=${ team.teamArea }&teamMember=${ team.teamMember }&keyword=${ team.keyword }">${ p }</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link" href="teamList.mo?cpage=${ pi.currentPage + 1 }&teamArea=${ team.teamArea }&teamMember=${ team.teamMember }&keyword=${ team.keyword }">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" disabled>Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			<c:choose>
				<c:when test="${ empty loginMember }">
				
				</c:when>
				<c:when test="${ not empty loginMember and empty loginMember.teamNo }">
					<div align="right">
						<a href="teamEnrollFrom.mo" class="btn btn-primary">팀 만들기</a>
					</div>
				</c:when>
				<c:otherwise>
					<div align="right">
						<button disabled class="btn btn-primary">팀 만들기</button>
						<p>현재 팀에 소속되어 있어 새 팀 생성이 불가합니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
			
		</div>
			
	</div>
	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function(){
			
			// teamPage로 보내주는 메소드
			$('.teamListTable tbody tr').click(function(){
				location.href = 'teamPage.mo?teamNo=' + $(this).find('.thisTeamNo').text();
			})
			
			$('.teamMember option').each(function(index, option){
				if($(this).val() == "${team.teamMember}"){
					$(this).attr('selected', 'true');
				}
			})
			
			$('.teamArea option').each(function(index, option){
				if($(this).val() == "${team.teamArea}"){
					$(this).attr('selected', 'true');
				}
			})
			
			$('.keyword option').each(function(index, option){
				if($(this).val() == "${team.keyword}"){
					$(this).attr('selected', 'true');
				}
			})
			
			
			
			
			
			// 카테고리 바뀔 때마다 ajax 메소드 쏴주기
			$('.teamListCondition select').on('change', function(){
				
				var $teamMember = $(this).parent().children('.teamMember').val();
				var $teamArea = $(this).parent().children('.teamArea').val();
				var $keyword = $(this).parent().children('.keyword').val();
				
				console.log($teamMember);
				console.log($teamArea);
				console.log($keyword);
				
				location.href = "teamList.mo?teamArea=" + $teamArea + "&keyword=" + $keyword + "&teamMember=" + $teamMember;
			})
			
			
			
			
			
			
		})
	</script>

	
	
	
</body>
</html>