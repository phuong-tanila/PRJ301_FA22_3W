
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <style>
            .card{ 
                padding: 0px !important;
                margin: 10px 0px!important;
            }
            .row{
                /*gap: 3px;*/
                padding: 5px;
            }
            .card-title-custom{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
            }
        </style>
    </head>
    <body style="background-color: #efefef">

        <jsp:include page="headerLogin.jsp"/>


        <div class="row" style="width: 100% !important; margin-left: 130px !important;">
            <fmt:setLocale value="vi_VN"/>
            <c:if test="${list != null}" >
                <c:forEach items="${list}" var="course" varStatus="i">
                    <div class="card" style="width: 20%; margin: 5px !important; padding: 5px !important; box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;">
                        <a href="<c:url value="/CourseDetailController?id=${course.courseID}" />" style="text-decoration: none; display: inline-block;">
                            <img style="height: 200px;" src="${course.imageUrl}" class="card-img-top" alt="">
                            <div class="card-body">
                                <h5 class="card-title card-title-custom" style="color: #696969" data-toggle="tooltip" data-placement="top" title="${course.courseName}">${course.courseName}</h5>

 <!--<p class="card-text card-desc" >${course.description}</p>-->
                                <p class="d-flex justify-content-between">
                                    <span class="p-2 text-center" style="color: #696969; width: 102px; border-radius: 15px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">${cateList[i.index].cateName}</span>
                                    <span class="p-2 text-center" style="color: #696969; width: 102px; border-radius: 15px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">${levelList[i.index].levelName}</span>
                                </p>
                                <p class="d-flex justify-content-between">
                                    <span style="color: #696969">${teacherList[i.index].fullName}</span>
                                    <span  style="color:red;"><fmt:formatNumber type="currency" value="${course.tuitionFee}"/></span>
                                </p>
                            </div>
                        </a>
                    </div>
                </c:forEach>    
            </c:if>
        </div>    

        <c:if  test="${empty list}" >
            <h1 style="text-align: center; color: #696969">No products found!!!</h1>
        </c:if>

        <c:if test="${empty searchValue}" >
            <div class="d-flex justify-content-center g-2">     
                <form action="SearchController">   
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach var="p" varStatus="loop" begin="1" end="${Numpage}">                         
                                <li class="page-item"><a class="page-link" href="<c:url value="/SearchController?cateId=${cateId}&page=${loop.count}"/>">${loop.count}</a></li>    
                                </c:forEach> 
                        </ul>
                    </nav>
                </form>
            </div>
        </c:if>

        <c:if test="${empty cateId}">
            <div class="d-flex justify-content-center g-2">     
                <form action="SearchController">   
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach var="p" varStatus="loop" begin="1" end="${Numpage}">                         
                                <li class="page-item"><a class="page-link" style="color: black;" href="<c:url value="/SearchController?searchValue=${searchValue}&page=${loop.count}"/>">${loop.count}</a></li>    
                                </c:forEach> 
                        </ul>
                    </nav>
                </form>
            </div></c:if> 


        <jsp:include page="footer.html"/>
    </body>
</html>
