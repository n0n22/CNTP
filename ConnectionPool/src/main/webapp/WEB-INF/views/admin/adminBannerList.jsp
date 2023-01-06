<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<style>

        div {
            border : solid red 1px;
        }



        .banner-outer {
            margin-left: 150px;
        }


        .banner-image {

        }


    </style>





</head>
<body>
	

 	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	
	


    <div class="banner-outer">
        
        <div class="banner-image">
            
            <div class="">


            </div>




        </div>

        <div class="page-area">

            <div class="banner-hidden">

            </div>
            <div class="banner-page">


            </div>
            <div class="banner-btn">

            </div>


        </div>



    </div>
	

	<jsp:include page="../common/footer.jsp" />

	



</body>
</html>