
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
        <nav class="navbar navbar-expand-lg bg-light ">
            <div class="container d-flex">
                <a class="navbar-brand" href="<c:url value="/"/>">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <form class="d-flex justify-content-center w-50" role="search" action="MainController" method="GET">
                    <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search" name="searchValue">
                    <button class="btn btn-outline-success" type="submit" name="btnAction" value="search">
                        <i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <button type="button" onclick="window.location.href = '<c:url value="login.html"/>'"class="btn btn-primary">Login</button>
            </div>
        </nav>




        <div class="container">
            <div class="row justify-content-around">
                <fmt:setLocale value="vi_VN"/>
                <c:forEach items="${list}" var="course" varStatus="i">

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
        <div class="d-flex justify-content-center g-2">     
            <form action="SearchController">   
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:forEach var="p" varStatus="loop" begin="1" end="${Numpage}">                         
                            <li class="page-item"><a class="page-link" href="<c:url value="/SearchController?searchValue=${searchValue}&page=${loop.count}"/>">${loop.count}</a></li>    
                            </c:forEach> 
                    </ul>
                </nav>
            </form>
        </div>



        <footer style="width: 100%;bottom: 0;" class="bg-dark text-center text-white">
            <!-- Grid container -->
            <div class="container p-4">
                <!-- Section: Social media -->
                <section class="mb-4">
                    <!-- Facebook -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-facebook-f"></i
                        ></a>

                    <!-- Twitter -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-twitter"></i
                        ></a>

                    <!-- Google -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-google"></i
                        ></a>

                    <!-- Instagram -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-instagram"></i
                        ></a>

                    <!-- Linkedin -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-linkedin-in"></i
                        ></a>

                    <!-- Github -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-github"></i
                        ></a>
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                @CopyRight From 4T1P
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
