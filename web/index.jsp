<%-- 
    Document   : index
    Created on : Dec 8, 2022, 11:34:52 PM
    Author     : 15tha
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1aa19ebad3.js" crossorigin="anonymous"></script>
        <style>
            .card{ 
                padding: 0px !important;
                margin: 10px 0px!important;
            }
            .row{
                /*gap: 3px;*/
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
    <body style="height: 100vh;">
        <jsp:include page="WEB-INF/views/headerLogin.jsp"/>
        <div class="container">
            <div class="row justify-content-around">
                <fmt:setLocale value="vi_VN"/>
                <c:forEach items="${topSellerCourse}" var="course" varStatus="i">

                    <div class="card col-md-3">
                        <a href="<c:url value="/CourseDetail?id=${course.courseID}" />" style="text-decoration: none; display: inline-block;">
                            <img style="height: 200px;" src="${course.imageUrl}" class="card-img-top" alt="">
                            <div class="card-body">
                                <h5 class="card-title card-title-custom" data-toggle="tooltip" data-placement="top" title="${course.courseName}">${course.courseName}</h5>

 <!--<p class="card-text card-desc" >${course.description}</p>-->
                                <p class="d-flex justify-content-between">
                                    <span class="p-2 bg-secondary text-center text-white" style="width: 102px;">${cateList[i.index].cateName}</span>
                                    <span class="p-2 bg-secondary text-center text-white" style="width: 102px;">${levelList[i.index].levelName}</span>
                                </p>
                                <p class="d-flex justify-content-between">
                                    <span class=" card-text">${teacherList[i.index].fullName}</span>
                                    <span  style="color:red;"><fmt:formatNumber type="currency" value="${course.tuitionFee}"/></span>
                                </p>
                            </div>
                        </a>
                    </div>
                </c:forEach>    
            </div>
        </div>
        <jsp:include page="WEB-INF/views/footer.html"/>
    </body>
</html>
