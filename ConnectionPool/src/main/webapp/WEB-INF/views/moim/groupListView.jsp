<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<style>
        .group{
            display: inline-block;
            background-color: antiquewhite;
            width : 300px;
            margin : 10px;
        }
        
        .group:hover{
        	cursor: pointer;
        }

        .thum{
            padding-top: 5px;
        }

        .group-wrap{
            width: 1000px;
        }
        
        .paging-parent{
        	margin: auto;
        	text-align : center;
        }
        
        .paging-area{
        	display : inline-block;
        }

</style>
</head>
<body>
    
    <jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>

    <div class="outer" align="center">
        <div class="group-wrap">
            <h3 align="left">소그룹 참여</h3>
            <hr>
            <br>

            <div class="groupCondition-area">
            	<form action="groupList.mo">
	                <table border="1">
	                    <tr height="50">
	                        <th width="200">지역</th>
	                        <td width="500">
	                            <select name="groupArea">
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
	                        </td>
	                    </tr>
	                    <tr height="50">
	                        <th>성별</th>
	                        <td>
	                            <input type="radio" name="gender" value="A" id="genderA"> <label for="genderA" checked>무관</label>
	                            <input type="radio" name="gender" value="M" id="genderM">  <label for="genderM">남</label>
	                            <input type="radio" name="gender" value="F" id="genderF"> <label for="genderF">여</label>
	                        </td>
	                    </tr>
	                    <tr height="50">
	                        <th>레벨</th>
	                        <td>
	                            <input type="radio" name="level" value="E" id="levelE" checked> <label for="levelE">무관</label>
	                            <input type="radio" name="level" value="B" id="levelB"> <label for="levelB">초급</label>
	                            <input type="radio" name="level" value="M" id="levelM"> <label for="levelM">중급</label>
	                            <input type="radio" name="level" value="S" id="levelS"> <label for="levelS">고급</label>
	                        </td>
	                    </tr>
	                    <tr height="50">
	                        <th>상태</th>
	                        <td>
	                            <input type="checkbox" id="groupMember" name="groupMember" value="recruit"> <label for="groupMember">모집중만 보기</label>
	                        </td>
	                    </tr>
	                </table>
					<br>
	                <div class="btn-area" align="right">
	                    <button class="btn btn-primary">검색하기</button>
	                    <c:if test="${ not empty loginMember }">
		                    <a class="btn btn-primary" href="groupEnrollForm.mo">글 작성하기</a>
	                    </c:if>
	                </div>
	           	</form>
            </div>

			<br>
            <div class="grouptList-area">
            
            	<c:choose>
            		<c:when test="${ empty groupList }">
            			<h3 align="center">모집글이 없습니다</h3>
            		</c:when>
            		<c:otherwise>
            			<c:forEach items="${ groupList }" var="g">
			                <!--이게 하나의 게시물-->
			                <div class="group" align="center">
			    
			                    <div class="thum">
			                        <img class="thum" height="300px" width="290px" src="${ g.changeName }">
			                    </div>
			    
			                    <div class="group-info">
			                        <table>
			                        	<tr>
			                        		<td>#${ g.powerDuration }</td>
			                        	</tr>
			                            <tr>
			                                <td width="150">#지역 ${ g.korArea }</td>
			                                <td width="150">#모집인원 ${ g.groupMember }</td>
			                            </tr>
			                            <tr>
			                                <td>#성별 ${ g.gender }</td>
			                                <td>#레벨 ${ g.level }</td>
			                            </tr>
			                            <tr>
			                                <td colspan="2"> #${ g.startTime }<br> ~ ${ g.endTime }</td>
			                                <input type="hidden" class="groupNo" name="groupNo" value="${ g.groupNo }">
			                            </tr>
			                        </table>
			                    </div>
			                </div>
            			</c:forEach>
            		</c:otherwise>
            	</c:choose>

    

            <br>

               
            
			<div class="paging-parent">
	            <div class="paging-area" align="center">
	                <ul class="pagination" align="center">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item"><a class="page-link" href="groupList.mo?cpage=${ pi.currentPage - 1 }&groupArea=${ group.groupArea }&gender=${ group.gender }&level=${ group.level }&groupMember=${group.groupMember}">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" disabled>Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
							<li class="page-item"><a class="page-link" href="groupList.mo?cpage=${ p }&groupArea=${ group.groupArea }&gender=${ group.gender }&level=${ group.level }&groupMember=${group.groupMember}">${ p }</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item"><a class="page-link" href="groupList.mo?cpage=${ pi.currentPage + 1 }&groupArea=${ group.groupArea }&gender=${ group.gender }&level=${ group.level }&groupMember=${group.groupMember}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" disabled>Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
	            </div>
	        </div>

        </div>

    </div>

	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			
			// 피드 게시물 클릭하면 해당 피드 게시물의 모임번호와 일치하는 detail페이지로 넘어가야 한다.
			$('.group').click(function(){
				
				location.href = 'groupDetail.mo?groupNo=' + $(this).find('.groupNo').val();
			})
			
			// 검색 조건이 기억되게 해놓기
			$('.groupCondition-area option').each(function(index, option){
				if($(this).val() == "${ group.groupArea }"){
					$(this).attr('selected', 'true');
				}
			})
			
			$('.groupCondition-area input[name=gender]').each(function(index, option){
				if($(this).val() == "${ group.gender}"){
					$(this).attr('checked', 'true');
				}
					
			})
			
			$('.groupCondition-area input[name=level]').each(function(index, option){
				if($(this).val() == "${ group.level}"){
					$(this).attr('checked', 'true');
				}
					
			})
			
			$('.groupCondition-area input[name=groupMember]').each(function(index, option){
				if($(this).val() == "${ group.groupMember}"){
					$(this).attr('checked', 'true');
				}
					
			})
			
			
		})
		
	</script>

</body>
</html>