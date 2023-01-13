
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>



	<meta charset="UTF-8">
	<title>메뉴바(검색X)</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	       
	    

<style>
    
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    div{
        box-sizing: border-box;
    }
    .outer{
    	min-height: 550px;
    	
    }
    .header{
        width: 100%;
        max-height: 80px;
        margin: 0px auto;
        position: sticky;
        padding: 18px 69px;
        z-index: 999;
        background-color: white;
        border-bottom: 2px solid rgb(224, 224, 224);
    }
    .header-inner{
        width: 100%;
        max-width: 1144px;
        height: 44px;
        margin: 0px auto;
        display: flex;
        justify-content: space-between;
    }
    .navigation-menu{
        width: 100%;
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .user-menu{
        margin-left: 5px;
        width: 100%;
        min-width: 200px;
        max-width: 300px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    .logo{
        padding: 0px;
        margin-right: 30px;
    }

    .landing-list{
        width: 100%;
        margin: 0px;
        padding: 0px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-family: 'Pretendard-Regular';
        font-weight: 700;
        transform : rotate(0.04deg);
    }

    .landing-list li{
        cursor: pointer;
        display: block;
        font-size: 16px;
        font-weight: bold;
        color: rgb(112, 112, 112);
        margin-left: 50px;
        white-space: nowrap;
    }

    .search-form{
        min-width: 180px;
        max-width: 230px;
        height: 40px;
        padding-left: 15px;
        background-color: rgb(247, 247, 247);
        border-radius: 10px;
    }

    .inner{
        max-width: 200px;
        height: 100%;
        display: flex;
        align-items: center;
    }
    .search-text{
        color: rgb(178, 178, 178);
        font-size: 14px;
        line-height: 14px;
        font-weight: 400;
        margin-left: 10px;
        margin-top: 1px;
    }
    
    .user-list{
        width: 100%;
        margin: 0px;
        padding: 0px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        font-family: 'Pretendard-Regular';
        font-weight: 400;
        font-style: normal;
    }

    .user-list li{
        cursor: pointer;
        display: block;
        font-size: 14px;
        font-weight: bold;
        line-height: 18px;
        padding-right: 10px;
        white-space: nowrap;
    }
    
    .username{
        text-align: right;
        min-width: 10ch;
        overflow: hidden;
        color: rgb(63, 72, 107);
        text-overflow: ellipsis;
        padding-right: 0px;
    }
    

    .user-menu .user-list li.logout{
        color: rgb(178, 178, 178);
    }

    .user-menu .user-list li.login{
        color: rgb(63, 72, 107);
    }

    .basket-icon{
        cursor: pointer;
    }

    .login{
        font-family:'Pretendard-Regular';
        font-style: normal;
    }


 
</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('알림', '${alertMsg}', function(){ alertify.success('확인 완료'); });
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<div id="modal"></div>


    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <a href="/cntp">
	                        <img src="resources/logo/cntp_logo.png" width="120" height="120">
                        </a>
                    </div>
                </div>
                <ul class="landing-list">
                    <li><a href="teamList.mo">친목풀-팀</a></li>
                    <li><a href="groupList.mo">친목풀-소그룹</a></li>
                    <li><a href="battleList.bt">배틀풀</a></li>
                    <li><a href="list.bo">커뮤니티</a></li>
                    <li><a href="list.di">수영일기</a></li>
                    <li><a href="list.no">공지사항</a></li>
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    
                                       
                    <c:choose>
                    	<c:when test="${ empty loginMember }">
                    		<!-- 로그인 XXX 시작-->
                    		<li class="login"><a href="loginForm.me">로그인</a></li>
							<!-- 관리자페이지 넣으니까 로그인이 작동이안되네요 ?? 왜인진 모르겠서요 -->
		                    <!-- 로그인 XXX 끝-->
                    	</c:when>
                    	<c:otherwise>
                    	 <!-- 로그인 되어있을때 시작 -->
                    	 	<c:if test="${ loginMember.memId eq 'admin' }">
                    	 		<li class="username" data-toggle="modal" data-target="#myModal">${ loginMember.nickName }님</li>
		                    	<li><div><a href="memberList.ad">관리자페이지</a></div></li>
		                    	<li class="logout"><a href="logout.me">로그아웃</a></li>
		                    </c:if>
		                    
							<c:if test="${ loginMember.memId ne 'admin' }">		                    		                   	 
			                    <li class="username" ingido="${loginMember.memNo}" onclick="showProfile(event)">${ loginMember.nickName }님</li>
			                    <li><div><a href="myPageInfo.me">마이페이지</a></div></li>
			                    <li class="logout"><a href="logout.me">로그아웃</a></li>
			                    <div class="basket-icon">
			                        <div class="basket-icon">
			                            <img src="" alt="" width="28" height="28" > <!-- 알림기능 넣는다면 종 모양 들어갈곳-->
			                        </div>
			                    </div>    
		                     <!-- 로그인 되어있을때 끝 -->
		                     </c:if>
		                     
                    	</c:otherwise>
                    </c:choose>
                     
                </ul>
            </section>
        </div>
	
    </div>
    
    <script>
	    <!-- 인기도 보여주는 기능 -->
    	function showProfile(event){
    		
    		// 회원 정보를 조회해오는 기능
    		var $memNo = $(event.target).attr('ingido');
    		
    		$.ajax({
    			url : 'showProfile.me',
    			data : {memNo:$memNo},
    			success : function(m){
    				console.log(m);
    				var gender = m.gender == 'M' ? '남자' : '여자';
    				var grade = '';
    				switch(m.grade){
    				case 'B' : grade = 'resources/images/beginner.jpg'; break;
    				case 'M' : grade = 'resources/images/middle.jpg'; break;
    				case 'S' : grade = 'resources/images/special.jpg'; break;
    				default : grade = 'resources/images/cntp_flamingo.png'; break;
    				}
    				var teamName = m.teaName == '' ? '무소속' : m.teamName;
    				
    				var modal = 
    			        `<div class="modal" id="myModal">
		    		            <div class="modal-dialog">
		    		                <div class="modal-content">
		    		                
		    		                    <!-- Modal Header -->
		    		                    <div class="modal-header">
		    		                        <h4 class="modal-title" align="center">커넥션플 회원 프로필</h4>
		    		                        <button type="button" class="close" data-dismiss="modal">&times;</button>
		    		                    </div>
		    		                
		    		                    <!-- Modal body -->
		    		                    <div class="modal-body">
		    		                        <div class="container">
		    		                            <div class="card" style="width:400px">
		    		                                <img class="card-img-top" src="\${grade}" alt="Card image" style="width:100%">
		    		                                <div class="card-body">
		    		                                    <h4 class="card-title"></h4>
		    		                                    <p class="card-text">성별 : \${gender}</p>
		    		                                    <p class="card-text">지역 : \${m.memArea}</p>
		    		                                    <p class="card-text">팀 : \${teamName}</p>
		    		                                    &nbsp;<button onclick="ingido(\${m.memNo},1)">👍</button">&nbsp;<button onclick="ingido(\${m.memNo},-1)">👎</button>
		    		                                </div>
		    		                            </div>
		    		                        </div>
		    		                    </div>
		    		                
		    		                    <!-- Modal footer -->
		    		                    <div class="modal-footer">
		    		                        <button type="button" class="btn btn-danger" onclick="modalClose(event);">닫기</button>
		    		                    </div>
		    		                
		    		                </div>
		    		            </div>
		    		        </div>`;
    		        $('#modal').html(modal);
    		        $(event.target).attr('data-toggle','modal').attr('data-target','#myModal');
    		        $('#myModal').css('display', 'block');
    			},
    			error : function(){
    			}
    		})
    	}
    	
        function modalClose(event){
            $(event.target).attr('data-dismiss','modal');
            $('#modal').html('');
        }
    
    
    </script>
    
    
</body>
</html>