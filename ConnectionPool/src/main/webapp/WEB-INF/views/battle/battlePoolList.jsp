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
<style>
    .main-top{
        width: 100%;
        height: 120px;
    }

    .date{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .p-card {
    border: 1px solid #eee;
    }

    .p-details {
    padding: 10px;
    border-radius: 0px;
    background: #000;
    color: #fff;
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px;
    }

    .spec span {
    font-size: 13px;
    }

    .spec h6 {
    font-size: 16px;
    font-weight: 500;
    }

    .carousel-indicators li {
    box-sizing: content-box;
    -ms-flex: 0 1 auto;
    flex: 0 1 auto;
    width: 12px;
    height: 12px;
    margin-right: 3px;
    margin-left: 3px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #fff;
    background-clip: padding-box;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    opacity: .5;
    transition: opacity .6s ease;
    }

    .line{

    background-color: #fff;margin-top: 4px;margin-bottom: 4px;height: 0.2px;
    }


</style>

</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
	    <script>
        $(function(){

            let today = new Date();
    
            let year = today.getFullYear();
            let month = today.getMonth() + 1;
            month = month < 10 ? '0' + month : month;  
            let date = today.getDate();
            date = date < 10 ? '0' + date : date;
            let day = '';
            switch(today.getDay()){
                case 1 : day = '월요일'; break; 
                case 2 : day = '화요일'; break;
                case 3 : day = '수요일'; break;
                case 4 : day = '목요일'; break;
                case 5 : day = '금요일'; break;
                case 6 : day = '토요일'; break;
                case 7 : day = '일요일'; break;
            }

            let mainDate = year + '년 ' + month + '월 ' + date + '일 ' + day;
            $('.mainDate').html(mainDate);

        })
    </script>

    <div class="outer">
    	<br>
		<div class="outer-top">
	        <div class="date">
	            <button class="btn btn-outline-dark" >&lt; prev</button>&nbsp;
	            <h2 class="mainDate" style="display: inline;"></h2>
	            &nbsp;<button class="btn btn-outline-dark" style="flex: right;">next &gt;</button>
	        </div>
		</div>
        <div class="search-area" align="center" style="margin-top: 20px">
            <select name="area" id="addressForm">
                <option value="시/도 선택" hidden="" disabled="disabled" selected="selected" >시/도 선택</option>
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
            <select>
                <option>남녀모두</option>
                <option>남자만</option>
                <option>여자만</option>
            </select>
            <select>
                <option>4:4계영 400m</option>
                <option>4:4계영 800m</option>
                <option>4:4혼계영 400m</option>
            </select>
            <select>
                <option>무관</option>
                <option>초보</option>
                <option>중수</option>
                <option>고수</option>
            </select>
            &nbsp;
        </div>
        <div class="btn-area" align="right">
                    <button class="btn">검색하기</button>
                    <a class="btn" href="enrollForm.bt">글 작성하기</a>
         </div>
        <br>
        
        <div class="container mt-5 mb-5">
        
        <div class="row g-1">

            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="http://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button" onclick="location.href='battleDetail.bt?battleNo=1'">배틀 신청</button></div>
                    </div>
                </div>
            </div>

            <!---->
            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="https://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button">배틀 신청</button></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="https://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button">배틀 신청</button></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="https://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button">배틀 신청</button></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="https://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button">배틀 신청</button></div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="p-card">
                    <div class="p-carousel">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"><img class="w-100 d-block" src="https://i.imgur.com/NwKcuYO.jpg" alt="Slide Image"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-details">
                        <div class="d-flex justify-content-between align-items-center mx-2">
                            <h5> [11:00] 서울 영등포 더에프 필드 B구장</h5></div>
                        <div class="mx-2">
                            <hr class="line">
                        </div>
                        <div class="d-flex justify-content-between mt-2 spec mx-2">
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">지역</h6><span>서울</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">성별</h6><span>남녀모두</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">종목</h6><span>혼영</span></div>
                            <div class="d-flex flex-column align-items-center">
                                <h6 class="mb-0">레벨</h6><span>모든</span></div>
                        </div>
                        <div class="buy mt-3"><button class="btn btn-primary btn-block" type="button">배틀 신청</button></div>
                    </div>
                </div>
            </div>
            
          </div>
        </div>
        
	
	
	</div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>