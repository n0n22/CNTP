<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        

        .admin-outer {
            margin-left: 150px;
            height: 100%;
            padding: 25px;
        }


        .notice-title h2 {
            text-align: center;
        }

    
        .notice-enroll {
            padding: 20px;
        }

        .notice-enroll .editor {
            width: 700px;
            height: 300px;
            padding: 10px;
            resize: none;
        }

        input[type=text] {
            width: 700px;
            padding: 10px;
        }
        
        .enroll-btn-area {
        	text-align: center;
        	padding: 20px;
        }
        


    </style>



</head>
<body>


	<jsp:include page="../common/menubar_nosearch.jsp" />=


    <div class="admin-outer">

        <div class="notice-title">

            <h2>공지사항 작성</h2>


        </div>
        <div class="notice-enroll">
            <div class="container">
            	<form>
	                <table class="table table-bordered">
	                    <tbody>
	                        <tr>
	                            <th>카테고리</th>
	                            <td>
	                                <select name="" id="">
	                                    <option value="">공지</option>
	                                    <option value="">이벤트</option>
	                                    <option value="">대회정보</option>
	                                </select>
	                            
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>제목</th>
	                            <td><input type="text"></td>
	                        </tr>
	                        <tr>
	                            <th>내용</th>
	                            <td>
	                                <textarea class="editor" name="" id=""></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>첨부파일</th>
	                            <td><input type="file"></td>
	                        </tr>
	                    </tbody>                  
	                </table>
                </form>     
                
              </div>
              
              <div class="enroll-btn-area">
              	<button class="btn btn-secondary" onclick="history.back();">취소</button>
              	<button type="submit" class="btn btn-primary">등록</button>
              </div>
              
              
              
        </div>


    </div>


	<jsp:include page="../common/footer.jsp" />



</body>
</html>