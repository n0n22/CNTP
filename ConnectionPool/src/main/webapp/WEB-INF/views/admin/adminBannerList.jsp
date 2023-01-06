<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<style>

        * {
            box-sizing: border-box;
        }

        .banner-outer {
            margin-left: 150px;
        }

        .banner-image {
            padding: 30px;
        }

        .banner-image>div {
            float: left;
            margin: 50px;
        }

        .page-area div {
            width: 33%;
            display: inline-block;
        }

        .banner-btn {
            text-align: left;
            padding-left: 30px;
        }


    </style>





</head>
<body>
	

 	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	
	


    <div class="banner-outer">
        
        <div class="banner-image">
            
            <div class="banner-image-container">
                <div class="img-thumbnail">
                    <img  width="500" src="https://media.istockphoto.com/id/1224108634/ko/%EB%B2%A1%ED%84%B0/%EC%97%AC%EB%A6%84-%EC%88%98%EC%98%81%EC%9E%A5-%ED%8C%8C%ED%8B%B0-%EC%B4%88%EB%8C%80-%EB%B0%B0%EB%84%88%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%95%BC%EC%9E%90%EC%88%98-%EC%9E%8E%EA%B3%BC-%EC%88%98%EC%98%81%EC%9E%A5-%EC%88%98%EB%A0%88%EA%B0%80%EC%9E%88%EB%8A%94-%EC%88%98%EC%98%81%EC%9E%A5.jpg?s=1024x1024&w=is&k=20&c=KjU-kl4id1DWT5MYjY-D_wPZweMzJiQjVY3jxYwMu6U=" alt="">
                </div>
                <button type="button" class="btn btn-primary btn-sm btn-block">보이기</button>
            </div>

            <div class="banner-image-container">
                <div class="img-thumbnail">
                    <img  width="500" src="https://media.istockphoto.com/id/1224108634/ko/%EB%B2%A1%ED%84%B0/%EC%97%AC%EB%A6%84-%EC%88%98%EC%98%81%EC%9E%A5-%ED%8C%8C%ED%8B%B0-%EC%B4%88%EB%8C%80-%EB%B0%B0%EB%84%88%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%95%BC%EC%9E%90%EC%88%98-%EC%9E%8E%EA%B3%BC-%EC%88%98%EC%98%81%EC%9E%A5-%EC%88%98%EB%A0%88%EA%B0%80%EC%9E%88%EB%8A%94-%EC%88%98%EC%98%81%EC%9E%A5.jpg?s=1024x1024&w=is&k=20&c=KjU-kl4id1DWT5MYjY-D_wPZweMzJiQjVY3jxYwMu6U=" alt="">
                </div>
                <button type="button" class="btn btn-secondary btn-sm btn-block">숨기기</button>
            </div>

            <div class="banner-image-container">
                <div class="img-thumbnail">
                    <img  width="500" src="https://media.istockphoto.com/id/1224108634/ko/%EB%B2%A1%ED%84%B0/%EC%97%AC%EB%A6%84-%EC%88%98%EC%98%81%EC%9E%A5-%ED%8C%8C%ED%8B%B0-%EC%B4%88%EB%8C%80-%EB%B0%B0%EB%84%88%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%95%BC%EC%9E%90%EC%88%98-%EC%9E%8E%EA%B3%BC-%EC%88%98%EC%98%81%EC%9E%A5-%EC%88%98%EB%A0%88%EA%B0%80%EC%9E%88%EB%8A%94-%EC%88%98%EC%98%81%EC%9E%A5.jpg?s=1024x1024&w=is&k=20&c=KjU-kl4id1DWT5MYjY-D_wPZweMzJiQjVY3jxYwMu6U=" alt="">
                </div>
                <button type="button" class="btn btn-secondary btn-sm btn-block">숨기기</button>
            </div>

            <br clear="both">
        </div>

        <div class="page-area">
            
            <div class="banner-btn">
                <a href="bannerEnrollForm.ad" class="btn btn-primary">등록</a>
            </div>
            <div class="banner-page">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
                </ul>
            </div>
            <div class="banner-hidden">

            </div>
            

        </div>



    </div>
	

	<jsp:include page="../common/footer.jsp" />

	



</body>
</html>