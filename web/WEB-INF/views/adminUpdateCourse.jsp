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
        <title>Update product</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
            .field--label{
                background: transparent;
                border: unset;
                width: 30%;
            }
            .form--container .field--input{
                height: 40px;
            }
            .select--input{
                width: 50%;
            }
            .dateTime--input{
                width: 250px;
                text-align: center;
                height: 40px;
            }
            .btn-submit{
                margin: 0 auto;
            }
            .course--select--input{
                width: 10%;
            }

        </style>
    </head>
    <body>
        <jsp:include page="headerLogin.jsp"/>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/MainController?btnAction=admin&func=showCreate'/>"aria-current="page" >Create Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" >Update product</a>
                </li>
            </ul>
            <form action="MainController" id="form" class="mt-5 form--container">
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Course id</span>
                    <select class="course-select course--select--input field--input"  required name="courseID">

                    </select>
                </div>
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Course name</span>
                    <input type="text" required name="courseName" class="form-control field--input" placeholder="Course name">
                </div>
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Course image</span>
                    <input type="text" required name="courseImg" class="form-control field--input" placeholder="Course image">
                </div>
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Course description</span>
                    <input type="text" required name="courseDesc" class="form-control field--input" placeholder="Course description">
                </div>

                <!--<div class="d-flex mt-3 mb-3">-->
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Teacher</span>
                    <select class="teacher-select field--input" required name="teacherID" >
                        <c:forEach items="${teacherList}"  var="i">
                            <option value="${i.userID}">${i.username}</option>
                        </c:forEach>
                    </select>
                </div>
                <!--<input type="text" class="form-control course-image" >-->
                <!--</div>-->
                <div class="d-flex justify-content-between mb-4">
                    <div class="input-group p-8">
                        <span class="input-group-text field--label" style="width: auto">Category</span>
                        <!--<div class="w-f-c">-->
                        <select class="level-select select--input" required name="cateID" >
                            <c:forEach items="${cateList}" var="i">
                                <!--<h1>${i}</h1>-->
                                <option value="${i.cateID}">${i.cateName}</option>
                            </c:forEach>
                        </select>
                        <!--</div>-->
                    </div>
                    <div class="input-group p-8">
                        <span class="input-group-text field--label" style="width: auto">Number of slots</span>
                        <!--<div class="w-f-c">-->
                        <input type="number" min="0" name="slot" required class="form-control field--input">
                        <!--</div>-->
                    </div>
                    <div class="input-group p-8">
                        <span class="input-group-text field--label" style="margin-left: 20px; width: auto">Level</span>
                        <select class="category-select select--input" required name="levelID" >
                            <c:forEach items="${levelList}" var="i">
                                <option value="${i.levelID}">${i.levelName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="input-group mb-4">
                    <span class="input-group-text field--label">Start date - end date</span>
                    <input type="text" readonly="" required name="duration" id="startDate" class="dateTime--input">
                </div>
                <div class="input-group mb-5">
                    <span class="input-group-text field--label">Price</span>
                    <input type="text" class="form-control field--input" required name="price" >
                </div>
                <button type="submit" class="btn btn-primary d-flex justify-content-between btn-submit" name="btnAction" value="admin" >Update Course</button>
                <input type="text" hidden  name="func" value="update">
            </form>
        </div>
        <script>
            function formatDate(dateStr) {
                const date = new Date(dateStr);
                const yyyy = date.getFullYear();
                let mm = date.getMonth() + 1; // Months start at 0!
                let dd = date.getDate();

                if (dd < 10)
                    dd = '0' + dd;
                if (mm < 10)
                    mm = '0' + mm;

                const formattedToday = dd + '/' + mm + '/' + yyyy;

                return formattedToday;
            }
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
//                $('#startDate').data('daterangepicker').setStartDate(moment())
//                $('#startDate').data('daterangepicker').setEndDate(moment().add(3, 'y'))
                const courseList = ${courseList};
                const courseSelect = document.querySelector(".course-select");
                courseList.forEach(i => {
                    console.log(i)
                    courseSelect.innerHTML += '<option value="' + i.courseID + '">' + i.courseID + '</option>'
                });
                $('.course-select').select2();
                $('.course-select').on('change.select2', function (e) {
                    console.log();
                    const id = $('.course-select').val();
                    fetch("<c:url value='/MainController?btnAction=ajax'/>&func=getCourse&ID=" + id, {
                        method: "GET"
                    }).then(res => res.json()).then(res => {
                        console.log(res)
                        document.querySelector("input[name=courseName]").value = res.courseName;
                        document.querySelector("input[name=courseImg]").value = res.imageUrl;
                        document.querySelector("input[name=courseDesc]").value = res.description;
                        $('.teacher-select').val(res.teacherID).trigger('change');
                        $('.level-select').val(res.levelID).trigger('change');
                        document.querySelector("input[name=slot]").value = res.slot;

                        $('.category-select').val(res.categoryID).trigger('change');
                        document.querySelector("input[name=duration]").value = formatDate(res.startDate) + " - " + formatDate(res.endDate)
                        document.querySelector("input[name=price]").value = res.tuitionFee;
                    });
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
        <jsp:include page="footer.html"/>
    </body>
</html>
