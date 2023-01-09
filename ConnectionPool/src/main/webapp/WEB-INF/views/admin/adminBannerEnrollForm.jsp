<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool</title>

    <style>


        .banner-enroll-table {
            padding: 30px;
            text-align: center;
        }



    </style>

</head>
<body>


    <jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
    



    <div class="admin-outer">
        

        <div class="banner-enroll-table">
        	<form action="bannerInsert.ad" method="post" enctype="multipart/form-data">
        		<input type="hidden" value="${ loginMember.memNo }" name="memNo">
	            <table class="table table-bordered">
	                <thead>
	                  <tr>
	                    <th>미리보기</th>
	                  </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>
	                            <div class="banner-image-container">
	                                <div class="img-thumbnail">
	                                    <img id="bannerImg" width="500" src="https://media.istockphoto.com/id/1224108634/ko/%EB%B2%A1%ED%84%B0/%EC%97%AC%EB%A6%84-%EC%88%98%EC%98%81%EC%9E%A5-%ED%8C%8C%ED%8B%B0-%EC%B4%88%EB%8C%80-%EB%B0%B0%EB%84%88%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%95%BC%EC%9E%90%EC%88%98-%EC%9E%8E%EA%B3%BC-%EC%88%98%EC%98%81%EC%9E%A5-%EC%88%98%EB%A0%88%EA%B0%80%EC%9E%88%EB%8A%94-%EC%88%98%EC%98%81%EC%9E%A5.jpg?s=1024x1024&w=is&k=20&c=KjU-kl4id1DWT5MYjY-D_wPZweMzJiQjVY3jxYwMu6U=" alt="">
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>파일첨부</th>
	                    </tr>
	                    <tr>
	                        <td><input type="file" name="upfile" id="bannerFile" onchange="loadImg(this);" required></td>
	                    </tr>
	                    <tr>
	                    	<td><button type="submit" class="btn btn-primary">등록</button>
	                    </tr>
	                </tbody>
	            </table>
        	</form>
        
        </div>

    </div>
	

    
	<jsp:include page="../common/footer.jsp" />

	
	
	<script>
	
	
		// 파일이 첨부되면 미리보기로 띄워주기
		function loadImg(inputFile) { 
	     	
			
			if(inputFile.files.length == 1) { // 파일이 첨부!
	
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				// 해당 파일을 읽어들이는 순간, 파일만의 고유한 url이 부여됨
				// => 해당 url을 src속성으로 부여할 것 ==> (자바스크립트 / 제이쿼리) attr사용
	
				// 파일 읽기가 완료되면 실행할 함수를 정의
				reader.onload = function(e) {
					// e의 target => e.target => 이벤트당한놈
					
					// e.target.result에 각 파일의 url이 담긴다
					$('#bannerImg').attr('src', e.target.result);
				}
				
			} else {
				$('#bannerImg').attr('src', '');
			}
	  	
	  	}
	
	
	
	
	
	</script>

	



</body>
</html>