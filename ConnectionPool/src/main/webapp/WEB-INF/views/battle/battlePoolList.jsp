<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배틀풀 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 스타일 시트 -->
<link rel="stylesheet" href="resources/css/battle/battlePoolList.css">

</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp"/>
		
	    <script>
	    // 전날(prev)을 담을 변수
	    let p = '';
	    // 다음날(next)을 담을 변수
	    let n = '';
	    
        $(function(){
        	// 현재 페이지 날짜
            let now = new Date('${now}');	
            // 현재 페이지 요일
            let day = ''
            switch(now.getDay()){
	            case 0 : day = '<span style="color:red;">일요일</span>'; break;
	            case 1 : day = '월요일'; break;
	            case 2 : day = '화요일'; break;
	            case 3 : day = '수요일'; break;
	            case 4 : day = '목요일'; break;
	            case 5 : day = '금요일'; break;
	            case 6 : day = '<span style="color:blue;">토요일</span>'; break;
            }
            // YYYY-MM-DD를 '-'로 분리하여 배열에 담음 => arr = ['YYYY', 'MM', 'DD']
            // YYYY년 MM월 DD일 몇요일 형태로 값을 뿌려줌
            var arr = formatDate(now).split('-');
            $('.mainDate').html(arr[0] + '년 ' + arr[1] + '월 ' + arr[2] + '일 ' + day);
            
            // 전날 날짜 계산 => YYYY-MM-DD 형식으로 변환
            let prev = new Date(now.setDate(now.getDate() - 1));
            p = formatDate(prev);
            
            // 다음날 날짜 계산 => YYYY-MM-DD 형식으로 변환
            let next = new Date(now.setDate(now.getDate() + 2));
            n = formatDate(next);

        })
        // 날짜 형식을 'YYYY-MM-DD'로 바꿔 반환해주는 함수
        function formatDate(date){
        	let year = date.getFullYear();
        	let month =
        		date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1);
        	let days =
        		date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        	return `\${year}-\${month}-\${days}`;
        }
        // 날짜별로 page 이동을 해줄 함수
        // 매개값이 0이면 전날 / 매개값이 1이면 다음날로 이동
        function page(num){
        	switch(num){
        	case 0 : location.href = 'battleList.bt?cpage=' + p; break;
        	case 1 : location.href = 'battleList.bt?cpage=' + n; break;
        	}
        }
        
        function enrollForm(){
        	$('#enrollFormSubmit').attr("action", "enrollForm.bt").submit();
        }
   	 	</script>
  	 	
  	 	<!-- 검색을 한 경우에만 실행 option요소에 검색한 value가 select되게 하는 함수  -->
   	 	<c:if test="${not empty condition }">
   	 		<script>
   	 			$(function(){
	   	 			$('.search-area select[name="area"] option[value="${condition.area}"]').attr('selected',true);
	   	 			$('.search-area select[name="gender"] option[value="${condition.gender}"]').attr('selected',true);
	   	 			$('.search-area select[name="style"] option[value="${condition.style}"]').attr('selected',true);
	   	 			$('.search-area select[name="level"] option[value="${condition.level}"]').attr('selected',true);
   	 			})
   	 		</script>
   	 	</c:if>
   	 	
    <div class="outer">
    	<br>
		<div class="outer-top">
	        <div class="date">
	            <button class="btn btn-outline-dark" onclick="page(0);">&lt; prev</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <h2 class="mainDate" style="display: inline;"></h2>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button class="btn btn-outline-dark" onclick="page(1);">next &gt;</button>
	        </div>
		</div>
		<form action="search.bt" method="get">
			<input type="hidden" name="cpage" value="${now}">
	        <div class="search-area" align="center" style="margin-top: 20px">
	        	<table>
		        	<tr align="center">
		        		<td>시/도 선택</td>
		        		<td>성별 선택</td>
		        		<td>종목 선택</td>
		        		<td>레벨 선택</td>
		        	</tr>
		        	<tr>
		        		<td>
				            <select name="area" id="addressForm">
				                <option value="">전체</option>
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
		        		<td>
				            <select name="gender">
				                <option value="">전체</option>
				                <option value="A">남녀모두</option>
				                <option value="M">남자만</option>
				                <option value="F">여자만</option>
				            </select>
		        		</td>
		        		<td>
				            <select name="style">
				                <option value="">전체</option>
				                <option value="f4">4:4 자유형</option>
				                <option value="h4">4:4 혼영</option>
				                <option value="hg4">4:4 혼계영</option>
				            </select>
		        		</td>
		        		<td>
				            <select name="level">
				                <option value="">전체</option>
				                <option value="A">무관</option>
				                <option value="B">초보</option>
				                <option value="M">중수</option>
				                <option value="S">고수</option>
				            </select>
		        		</td>
		        	</tr>
	        	</table>
	        	<br>
	            &nbsp;
	        </div>
	        <div class="btn-area" align="center">
		            <button class="btn">검색하기</button>
		            <!-- 팀장일 경우에만 글 작성 가능 -->
		            <c:if test="${loginMember.teamGrade eq 'L' }">
			            <a class="btn" onclick="location.href='enrollForm.bt'">글 작성하기</a>
		            </c:if>
		            <c:if test="${loginMember.teamGrade ne 'L' }">
			            <a class="btn disabled" id="msg-button">글 작성하기</a>
		            </c:if>
	         </div>
	        <br>
		</form>
        
        <div class="container mt-5 mb-5">
        
        <div class="row g-1">
        
        <!-- 게시글이 없는 경우 -->
        <c:if test="${empty battleList}">
        	<div>
				<h2 align="center">조회된 배틀이 없습니다.</h2>        	
        	</div>
        </c:if>
        
        <!-- 게시글이 있는 경우 -->
        <c:if test="${battleList ne null}">
			<c:forEach items="${battleList}" var="bl">
	            <div class="col-md-4">
	                <div class="p-card">
	                    <div class="p-carousel">
	                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
	                            <div class="carousel-inner" role="listbox">
	                                <div class="carousel-item active">
	                                <c:if test="${ bl.changeName != null }">
		                                <img class="w-100 d-block" src="${ bl.changeName }" alt="Slide Image" width="290px" height="300px">
	                                </c:if>
	                                <c:if test="${ bl.changeName == null }">
		                                <img class="w-100 d-block" src="resources/images/cntp_flamingo.png" alt="Slide Image" width="290px" height="300px">
	                                </c:if>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="p-details">
	                        <div class="d-flex justify-content-between align-items-center mx-2">
	                            <h5> [${bl.battleTime}] ${bl.title}</h5></div>
	                        <div class="mx-2">
	                            <hr class="line">
	                        </div>
	                        <div class="d-flex justify-content-between mt-2 spec mx-2">
	                            <div class="d-flex flex-column align-items-center">
	                                <h6 class="mb-0">지역</h6><span>${bl.area}</span></div>
	                            <div class="d-flex flex-column align-items-center">
	                                <h6 class="mb-0">성별</h6><span>${bl.gender}</span></div>
	                            <div class="d-flex flex-column align-items-center">
	                                <h6 class="mb-0">종목</h6><span>${bl.style}</span></div>
	                            <div class="d-flex flex-column align-items-center">
	                                <h6 class="mb-0">레벨</h6><span>${bl.level}</span></div>
	                        </div>
	                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button" onclick="location.href='battleDetail.bt?battleNo=${bl.battleNo}'">배틀 신청</button></div>
	                    </div>
	                </div>
	            </div>
			</c:forEach>
        </c:if>
            
          </div>
        </div>
	
	</div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>