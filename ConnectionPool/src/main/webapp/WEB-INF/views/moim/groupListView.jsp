<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<style>
        .group{
            display: inline-block;
            background-color: antiquewhite;
            width : 300px;
            margin : 10px;
        }
        
        .group:hover{
        	cursor: pointer;
        }

        .thum{
            padding-top: 5px;
        }

        .group-wrap{
            width: 1000px;
        }

</style>
</head>
<body>
    
    <jsp:include page="../common/menubar_nosearch.jsp"/>
	
	<br>

    <div class="outer" align="center">
        <div class="group-wrap">
            <h3 align="left">소그룹 참여</h3>
            <hr>
            <br>

            <div class="groupCondition-area">
                <table border="1">
                    <tr height="50">
                        <th width="200">지역</th>
                        <td width="500">
                            <select name="groupArea">
                                <option value="all">전체</option>
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
                        </td>
                    </tr>
                    <tr height="50">
                        <th>성별</th>
                        <td>
                            <input type="radio" name="gender" value="A" id="genderA"> <label for="genderA">무관</label>
                            <input type="radio" name="gender" value="M" id="genderM">  <label for="genderM">남</label>
                            <input type="radio" name="gender" value="F" id="genderF"> <label for="genderF">여</label>
                        </td>
                    </tr>
                    <tr height="50">
                        <th>레벨</th>
                        <td>
                            <input type="radio" name="level" value="A" id="levelA"> <label for="levelA">무관</label>
                            <input type="radio" name="level" value="B" id="levelB"> <label for="levelB">초급</label>
                            <input type="radio" name="level" value="M" id="levelM"> <label for="levelM">중급</label>
                            <input type="radio" name="level" value="S" id="levelS"> <label for="levelS">고급</label>
                        </td>
                    </tr>
                    <tr height="50">
                        <th>상태</th>
                        <td>
                            <input type="checkbox" id="groupMember" name="groupMember" value="true"> <label for="groupMember">모집중만 보기</label>
                        </td>
                    </tr>
                </table>

                <div class="btn-area" align="right">
                    <button class="btn">검색하기</button>
                    <a class="btn" href="groupEnrollForm.mo">글 작성하기</a>
                </div>
            </div>

            <div class="grouptList-area">

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    

                <!--이게 하나의 게시물-->
                <div class="group" align="center">
    
                    <div class="thum">
                        <img class="thum" width="290px" src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg">
                    </div>
    
                    <div class="group-info">
                        <table>
                            <tr>
                                <td width="150">#지역 제주도</td>
                                <td width="150">#모집인원 1/10</td>
                            </tr>
                            <tr>
                                <td>#여자만</td>
                                <td>#중수레벨</td>
                            </tr>
                            <tr>
                                <td colspan="2"> #2023-01-10 15:00</td>
                                <input type="hidden" class="groupNo" name="groupNo" value="그룹넘버">
                            </tr>
                        </table>
                    </div>
                </div>
    
            </div>

               
            

            <div class="paging-area">
                
            </div>

        </div>

    </div>

	
	<br>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		// 피드 게시물 클릭하면 해당 피드 게시물의 모임번호와 일치하는 detail페이지로 넘어가야 한다.
		$(function(){
			$('.group').click(function(){
				
				location.href = 'groupDetail.mo?groupNo=' + $(this).find('.groupNo').val();
			})
		})
	</script>

</body>
</html>