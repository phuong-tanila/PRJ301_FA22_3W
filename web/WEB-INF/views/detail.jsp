<%-- 
    Document   : detail
    Created on : Dec 9, 2022, 5:49:23 AM
    Author     : 15tha
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Detail</title>
        <style>
            .description{
                word-wrap: break-word;
                white-space:pre-wrap;
            }
            .cate{
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerLogin.jsp"/>
        ${course}
        <button onclick="addCart(${course.courseID}, this)"> add to cart</button>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h4 class="">${course.courseName}</h4>
                    <p class="description  mt-3 ">${course.description}</p>
                    <p class="d-flex  w-100 ">
                        <span class="p-2 cate col-md-5 bg-secondary text-center text-white" style="width: 102px;">${category.cateName}</span>
                        <span class="p-2 col-md-5 bg-secondary text-center text-white" style="width: 102px;">${level.levelName}</span>
                    </p>
                    <fmt:setLocale  value="vi_VN"/>
                    <p class="d-flex">
                        <span> <i class="fa-regular fa-calendar"></i> start date : <fmt:formatDate pattern="dd/MM/YYYY" value="${course.startDate}"/> - <fmt:formatDate pattern="dd/MM/YYYY" value="${course.endDate}"/></span>

                    </p>    
                    <span><i class="fa-regular fa-calendar-check"></i></i> last update date : <fmt:formatDate pattern="dd/MM/YYYY" value="${course.lastUpdateDate}"/></span>
                    <p style="margin-top: 10px;">
                        <i class="fa-regular fa-user"></i> Teacher name: ${teacherName}
                    </p>    
                    <p>

                    </p>  
                </div>
                <div class="col-md-4">
                    <img  class="w-100" src="${course.imageUrl}">
                    <div style="margin-top: 20px;">
                        Price: <span style="color: red;"><fmt:formatNumber value="${course.tuitionFee}" type="currency"/></span>
                    </div>
                    <div style="margin-top: 20px;">
                        <button type="button" onclick="addCart(${course.courseID}, this)" ${inCart ? "disabled" : ""}  class='btn w-100 ${inCart ? "btn-secondary" : "btn-info"}'>
                            ${inCart ? "This course is already in cart" : "Book this course" }
                        </button>
                    </div>
                </div>

            </div>
        </div>
                        
        <script src="https://kit.fontawesome.com/1aa19ebad3.js" crossorigin="anonymous"></script>
        <script>
            function addCart(id, el) {
                swal("Add cart successfully" , "", "success").then(result => {
                    if (result) {
                        console.log(el.classList.replace("btn-info", "btn-secondary"))
                        el.setAttribute("disabled", "")
                        el.innerHTML = "This course is already in cart";
                        fetch("<c:url value="/MainController"/>" + "?btnAction=cart&func=add&id=" + id, {
                            method: "GET",
                        });
                    }
                })
            }
        </script>
    </body>
</html>
