<%-- 
    Document   : adminCreateProduct
    Created on : Dec 11, 2022, 10:34:16 PM
    Author     : 15tha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create product</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <style>
            .course-image{
                width: 60% !important;
            }.teacher-select{
                width: 35% !important;

            }.selection{
                height: 100% !important;
            }.w-f-c{
                width: fit-content !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerLogin.jsp"/>

        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" >Create Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/MainController?btnAction=admin&func=showUpdate'/>"   >Update product</a>
                </li>
            </ul>
            <form action="MainController" class="mt-5" id="form">
                <div class="input-group">
                    <span class="input-group-text">Course name</span>
                    <input type="text" required name="courseName" class="form-control" placeholder="Course name">
                </div>
                <div class="input-group">
                    <span class="input-group-text">Course image</span>
                    <input type="text" required name="courseImg" class="form-control" placeholder="Course image">
                </div>
                <div class="input-group">
                    <span class="input-group-text">Course description</span>
                    <input type="text" required name="courseDesc" class="form-control" placeholder="Course description">
                </div>

                <div class="d-flex mt-3 mb-3">
                    <div class="input-group">
                        <span class="input-group-text">Teacher</span>
                        <select class="teacher-select " required name="teacherID" >
                            <c:forEach items="${teacherList}"  var="i">
                                <option value="${i.userID}">${i.username}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <!--<input type="text" class="form-control course-image" >-->
                </div>
                <div class="d-flex justify-content-between">
                    <div class="input-group">
                        <span class="input-group-text">Category</span>
                        <div class="w-f-c">
                            <select class="level-select w-100" required name="cateID" >
                                <c:forEach items="${cateList}" var="i">
                                    <!--<h1>${i}</h1>-->
                                    <option value="${i.cateID}">${i.cateName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Number of slots</span>
                        <div class="w-f-c">
                            <input type="number" min="0" name="slot" required class="form-control">
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Level</span>
                        <select class="category-select" required name="levelID" >
                            <c:forEach items="${levelList}" var="i">
                                <option value="${i.levelID}">${i.levelName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-text">Start date - end date</span>
                    <input type="text" readonly="" required name="duration" id="startDate">
                </div>
                <div class="input-group">
                    <span class="input-group-text">Price</span>
                    <input type="text" class="form-control" required name="price" >
                </div>
                <button type="submit" class="btn btn-primary d-flex justify-content-between" name="btnAction" value="admin" >Create</button>
                <input type="text" hidden  name="func" value="create">
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('.teacher-select').select2();
                $('.level-select').select2();
                $('.category-select').select2();
                $('#startDate').daterangepicker({
                    minDate: new Date(),
                    'locale': {
                        format: "DD/MM/YYYY",
                    }
                });
            });
//            function handleSubmit() {
//                const form = new FormData(document.querySelector("#form"))
//                const data = new URLSearchParams();
//                for (const pair of form) {
//                    console.log(pair[0] + "   " + pair[1])
//                    data.append(pair[0], pair[1]);
//                }
//                console.log(data)
//                fetch("<c:url value="/AdminController"/>", {
//                    method: 'post',
//                    body: data
//                }).then(res => res).then((res) => {
//                    console.log(res)
//                    swal("Created successfully", "", "success");
//                    document.querySelector("#form").reset()
//                }
//                )
//            }
        </script>
    </body>
</html>
