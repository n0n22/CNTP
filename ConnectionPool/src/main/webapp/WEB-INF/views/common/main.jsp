<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>

	<jsp:include page="menubar_nosearch.jsp"/>
	
	
	<div class="outer">
	
		<div class="banner-area" align="center">
			
			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators" id="bannerList">

				</ul>
				
				<!-- The slideshow -->
				<div class="carousel-inner" id="bannerImgContainer">

				</div>
				
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
  
		</div>


	
	
	</div>
	
	
	<jsp:include page="footer.jsp"/>



	<script>
	
		$(function() {
			
			selectBanner();
			
			
		});
		
		
		
		
		
		function selectBanner() {
			
			$.ajax({
				url : "mainBanner",
				success : function(result) {
					// console.log(result);
					var imgtags = '';
					var listtags = '';
					for (let i in result) {
						if (i == 0) {
							imgtags += '<div class="carousel-item active">'
								 + '<img src="' + result[i].changeName + '" width="1100" height="500">'
								 + '</div>';
							listtags += '<li data-target="#demo" data-slide-to="' + i + '" class="active"></li>';
						} else {
							imgtags += '<div class="carousel-item">'
									 + '<img src="' + result[i].changeName + '" width="1100" height="500">'
									 + '</div>';
							listtags += '<li data-target="#demo" data-slide-to="' + i + '"></li>';
						}
					}
					$('#bannerImgContainer').html(imgtags);
					$('#bannerList').html(listtags);				
					
				},
				error : function() {
					console.log('통신 실패');
				}
		
			});		
			
		};





	</script>




</body>
</html>