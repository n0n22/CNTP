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
		.row2{
			display: flex;
		}
		.row2>.left{
			width: 50%;
			float: left;
		}
		.row2>.right{
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
		<br><br>
		<!-- topN 영역 시작 -->
		<div class="ranking-area">
		
			<div class="row1">
			
				<!-- 다승 랭킹 시작 -->
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
				
				<!-- 승률 랭킹 시작 -->
				<div class="left">
				    <table id="winRate" align="center">
				        <caption class="caption">승률 랭킹</caption>
				        <thead>
				            <tr>
				                <th align="center" scope="col" width="60px">랭킹</th>
				                <th align="center" scope="col" width="60px">뱃지</th>
				                <th align="center" scope="col" width="180px">팀이름</th>
				                <th align="center" scope="col" width="150px">승률</th>
				            </tr>
				        </thead>
				        <tbody>

				        </tbody>
				    </table>
				</div>
				<!-- 승률 랭킹 끝 -->
				
			</div>
			<br><br>
			<div class="row2">
			
				<!--연승 랭킹 시작 -->
				<div class="left">
				    <table id="winningStreak" align="center">
				        <caption class="caption">연승 랭킹</caption>
				        <thead>
				            <tr>
				                <th align="center" scope="col" width="60px">랭킹</th>
				                <th align="center" scope="col" width="60px">뱃지</th>
				                <th align="center" scope="col" width="180px">팀이름</th>
				                <th align="center" scope="col" width="150px">연승</th>
				            </tr>
				        </thead>
				        <tbody align="center">

				        </tbody>
				    </table>
				</div>
				<!-- 연승 랭킹 끝-->
				
				<!-- 경기수 랭킹 시작 -->
				<div class="left">
				    <table id="matches" align="center">
				        <caption class="caption">경기수 랭킹</caption>
				        <thead>
				            <tr>
				                <th align="center" scope="col" width="60px">랭킹</th>
				                <th align="center" scope="col" width="60px">뱃지</th>
				                <th align="center" scope="col" width="180px">팀이름</th>
				                <th align="center" scope="col" width="150px">경기수</th>
				            </tr>
				        </thead>
				        <tbody align="center">

				        </tbody>
				    </table>
				</div>
				<!-- 경기수 랭킹 끝 -->
				
			</div>

		</div>
		<!-- topN 영역 끝-->
	</div>
	
	<br><br>
	
	
	<jsp:include page="footer.jsp"/>



	<script>
	
		$(function() {
			
			selectBanner();
			
			battleRank('win');
			battleRank('winRate');
			battleRank('winningStreak');
			battleRank('matches');
			
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
		
		function battleRank(condition){
			$.ajax({
				url : "battleRank.top",
				data : {condition:condition},
				success : function(data){
					let rank = ''
					for(let i in data){
						
						let d = data[i];
						let difference = '';
						switch(condition){
							case 'win': difference = d.victory + ' 승'; break; 
							case 'winRate': difference = d.winRate + ' %'; break; 
							case 'winningStreak': difference = d.winningStreak + ' 연승'; break; 
							case 'matches': difference = d.record + ' 경기'; break; 
						}
						rank += 
							`
							<tr onclick="location.href='teamPage.mo?teamNo=\${d.teamNo}'">
				                <td>\${Number(i) + 1}</td>
				                <td>
				                    <img src="\${d.badge}" width="32" alt="profile_image" class="icon" height="32">
				                </td>
				                <td>
				                    <strong>\${d.teamName}</strong>
				                </td>
				                <td>
				                	\${difference}
				                </td>
			            	</tr>`
					}
					switch(condition){
						case 'win': $('#manyWin tbody').html(rank); break; 
						case 'winRate': $('#winRate tbody').html(rank); break; 
						case 'winningStreak': $('#winningStreak tbody').html(rank); break; 
						case 'matches': $('#matches tbody').html(rank); break; 
					}
				}
			})
		}
		

	</script>




</body>
</html>