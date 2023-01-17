<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

	<style>
		.banner-area{
			margin-top: 3px;
		}
		.ranking-area{
			width: 1100px;
			margin: auto;
		}
		.row1{
			display: flex;
		}
		.row1>.left{
			width: 50%;
			float: left;
		}
		.row1>.right{
			width: 50%;
			float: right;
		}
		.ranking-area img{
			border-radius: 50%;
		}
		.ranking-area tr{
			text-align: center;
		}
		.caption {
			caption-side: top;
			text-align: center;
		}
		
		.ranking-area tbody tr:hover{
			cursor: pointer;
			background: RGB(248,204,215);
		}
	
	</style>
</head>
<body>

	<jsp:include page="menubar_nosearch.jsp"/>
	
	
	<div class="outer">
		<!-- 배너 영역 시작 -->
		<div class="banner-area" align="center">
			
			<div id="demo" class="carousel slide" data-ride="carousel">

				<ul class="carousel-indicators" id="bannerList">

				</ul>
				
				<div class="carousel-inner" id="bannerImgContainer">

				</div>
				
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
		<!-- 배너 영역 끝 -->
		<br>
		<!-- topN 영역 시작 -->
		<div class="ranking-area">
			<!-- 다승 랭킹 시작 -->
			<div class="row1">
				<div class="left">
				    <table id="manyWin" align="center">
				        <caption class="caption">다승 랭킹</caption>
				        <thead>
				            <tr>
				                <th align="center" scope="col" width="60px">랭킹</th>
				                <th align="center" scope="col" width="60px">뱃지</th>
				                <th align="center" scope="col" width="180px">팀이름</th>
				                <th align="center" scope="col" width="150px">승리</th>
				            </tr>
				        </thead>
				        <tbody align="center">

				        </tbody>
				    </table>
				</div>
				<!-- 다승 랭킹 끝-->
				<div class="right">
				<table align="center">
				        <caption  class="caption">승률 랭킹</caption>
				        <thead>
				            <tr>
				                <th align="center" scope="col" width="60px">랭킹</th>
				                <th align="center" scope="col" width="60px">뱃지</th>
				                <th align="center" scope="col" width="150px">팀이름</th>
				                <th align="center" scope="col" width="100px">승률</th>
				            </tr>
				        </thead>
				        <tbody align="center">
				            <tr>
				                <td>1</td>
				                <td>
				                    <img src="https://opgg-static.akamaized.net/images/profile_icons/profileIcon3495.jpg?image=q_auto,f_webp,w_64&amp;v=1673596760664" width="32" alt="profile_image" class="icon" height="32">
				                </td>
				                <td>
				                    <strong>칼과 창 방패</strong>
				                </td>
				                <td>
				                    50%
				                </td>
				            </tr>
				        </tbody>
				    </table>
				
				</div>
			</div>

		</div>
		<!-- topN 영역 끝-->
	</div>
	
	<br><br>
	
	
	<jsp:include page="footer.jsp"/>



	<script>
	
		$(function() {
			
			selectBanner();
			
			topManyWin();
			
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
		
		function topManyWin(){
			$.ajax({
				url : "manyWin.top",
				success : function(data){
					let manyWin = ''
					for(let i in data){
						
						let d = data[i];
						manyWin += 
							`
							<tr onclick="location.href='teamPage.mo?teamNo=?\${d.teamNo}'">
				                <td>\${Number(i) + 1}</td>
				                <td>
				                    <img src="\${d.badge}" width="32" alt="profile_image" class="icon" height="32">
				                </td>
				                <td>
				                    <strong>\${d.teamName}</strong>
				                </td>
				                <td>
				                	\${d.victory}
				                </td>
			            	</tr>`
					}
					$('#manyWin tbody').html(manyWin);
				}
			})
		}
		function topWinRate(){
			
		}





	</script>




</body>
</html>