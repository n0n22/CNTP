<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        font-family: 'Pretendard-Regular';
        font-style: normal;
    }


 
</style>
</head>
<body>
    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <img src="" width="85" height="25">
                    </div>
                </div>
                <ul class="landing-list">
                    <li><a href="teamList.mo">친목풀-팀</a></li>
                    <li><a href="groupList.mo">친목풀-소그룹</a></li>
                    <li>배틀풀</li>
                    <li>커뮤니티</li>
                    <li>공지사항</li>
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <!-- 로그인 XXX 시작-->
                    <li class="login"><a href="loginForm.me">로그인</a></li>
					



                    <!-- 로그인 XXX 끝-->

                    <!-- 로그인 되어있을때 시작 -->
                    
                    <li class="username"  data-toggle="modal" data-target="#myModal">커풀님</li>
                    <li><div><a href="myPageInfo.me">마이페이지</a></div></li>
                    <li class="logout">로그아웃</li>
                    <div class="basket-icon">
                        <div class="basket-icon">
                            <img src="" alt="" width="28" height="28" > <!-- 알림기능 넣는다면 종 모양 들어갈곳-->
                        </div>
                     <!-- 로그인 되어있을때 끝 -->
                     
	                </div>
                </ul>
            </section>
        </div>
    </div>
    
    <!-- 인기도 모달 -->
    <div class="modal" id="myModal">
          <div class="modal-dialog">
              <div class="modal-content">
              
                  <!-- Modal Header -->
                  <div class="modal-header">
                      <h4 class="modal-title" align="center">프로필 사진</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
              
                  <!-- Modal body -->
                  <div class="modal-body">
                      <div class="container">
                          <div class="card" style="width:400px">
                              <img class="card-img-top" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHoAegMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUBAgYDB//EADAQAAICAQMDAgQDCQAAAAAAAAABAgMRBAUSITFhQVEkUnGBExQiIzJCYnKRscHR/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAIDAQT/xAAdEQEBAAMAAwEBAAAAAAAAAAAAAQIRMQNBUSES/9oADAMBAAIRAxEAPwD6IAD0sgAAADemqy6fCuDcv8AaGYpyeIpt+EXGm2muOHfLk/aPRIsK6YVRxXFRXhGdznpUx+uejodTNZVMvvhHhOLhJxljK74eTqZw5Qcc91jJz2t0dmll80G+kkdxz2WaRgPsC0gAAAAAAAAAA3qrlbZGuK6yePodHptNXp6lCC+r9yp2aPLVN+0WXiMfJbxeMZABCg1nCM4tSWU/RmwA5vXab8rdhJ8JdYv/AERi63uHw8JeqkUpvjdxnZoABTgAAAAAAACy2R/Ez/pLpFFs2fznbpxfUvUY59aY8ZABDoAAK7en8Kl/MijLre38PDC/i6+ClNsOIy6AAtIAAAAAAAC42GScLY+Uy1Of2q9U6njLtZ+np6Mv0YZ9XjxkAEqADDAjbnJR0Nr90c4W+9XpQVCzyl+pvwVBrhxGXQAGiQAAAAAAAGYy4yUl3TyjqKZqyqE12ksnLFvstsnCyuTbUcOPjJnnPasatgAZLDBkibjbKnS2Tg8Psn9QKbcLfxdXNrsnxX2IwB6JNMgAHQAAAAAAAALjZINV2Ta7tFQlyaiurbwjqKYcK4xx+6kjPO/mlYx6AAyWEXcYc9HaksvGSUav1A5QEnca/wAPW2LGMvkiMeiXcZAAOgAAAPSqmy6XGqLk/HoWWn2j1vnnxH/pNsnXdbVKUpSxFNt+3UnafbL7cOz9nHz3/sXNOnqoWKq1HyepF8nxX8/UXS6Gih5UeUvml1JZgyZ7UAAAAAPHUaaq+OLIJv39Sr1O0zj1olyXyvuXRg7MrHLJXK2V2VPjZBxflYNTqp1xsTjZBSXkr9RtNUutT4P27o0nk+puKlBI1Oju03WyOY/MuqPDD8F9S6eqmFUVCuKUV6I9EsBGTztQAAAAAAAAAAAAADAA1lFNYfYiPbdK23+EuvkmMwDW3//Z" alt="Card image" style="width:100%">
                              <div class="card-body">
                                  <h4 class="card-title">닉네임</h4>
                                  <p class="card-text">레벨 : 중수</p>
                                  <p class="card-text">인기도 : 0 </p>
                                  &nbsp;<button>👍</button>&nbsp;<button>👎</button>
                              </div>
                          </div>
                      </div>
                  </div>
              
                  <!-- Modal footer -->
                  <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                  </div>
              
              </div>
          </div>
    </div>
    
    
    
</body>
</html>