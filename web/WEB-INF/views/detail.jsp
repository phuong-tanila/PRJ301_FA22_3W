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
                width: 60%;
            }
            .cate{
                margin-right: 10px;
            }
            .title {
                background-color: RGB(26, 30, 33);
                padding: 32px 10%;
                color: #fff;
                min-height: 200px;
            }
            .title__menu {
                display: flex;
                align-items: center;
            }
            .title__menu a {
                color: #cec0fc;
                text-decoration: unset;
                font-size: 14px;
                font-weight: 600;
            }
            .title__menu i {
                color: #fff;
                font-size: 12px;
                margin: 0 5px;
            }

            .title h1 {
                margin: 20px 0 10px;
            }
            .title h3 {
                font-weight: 400;
            }
            /* content */
            .content {
                padding: 32px 10%;
                padding-bottom: 0px;
                display: flex;
                justify-content: space-between;
            }
            .content__left {
                padding: 24px;
                width: 60%;
                height: fit-content;
                background-color: #fff;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            }
            .content__left h2 {
                margin-bottom: 16px;
            }
            .content__list--learned {
                display: flex;
                flex-wrap: wrap;
            }
            .content__list--learned__item {
                width: 50%;
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .content__list--learned__item span {
                margin-left: 10px;
                font-size: 15px;
            }
            .content__right {
                width: 30%;
                position: relative;
                top: -170px;
                background-color: #fff;
            }
            .content__right__infoCourse {
                padding: 24px;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            }
            .content__right__infoCourse h2 {
                color: #1c1d1f;
                font-size: 32px;
            }
            .btn--addList {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }
            .btn--cart {
                width: calc(100% - 48px - 10px);
                height: 48px;
                color: #fff;
                font-size: 16px;
                font-weight: 700;
                cursor: pointer;
                width: 100%;
            }
            .btn--wishList {
                height: 48px;
                width: 48px;
                background: transparent;
                border: 1px solid black;
                cursor: pointer;
            }
            .btn--wishList i {
                line-height: 48px;
                font-size: 20px;
            }
            .btn--buy {
                height: 48px;
                width: 100%;
                margin-top: 5px;
                font-size: 16px;
                font-weight: 700;
                background: transparent;
                border: 1px solid black;
                cursor: pointer;
            }
            .content__course {
                margin-left: 20px;
            }
            .content__course li {
                margin: 5px 0;
            }
        </style>
    </head>
    <body style="background-color: #efefef">
        <jsp:include page="headerLogin.jsp"/>
        <div class="mt-3">
            <!--title-->
            <div class="title">
                <h4>${course.courseName}</h4>
                <p class="description mt-4">${course.description}</p>
            </div>

            <!--content-->
            <div class="content">
                <div class="content__left">
                    <h2>Course Detail</h2>
                    <div class="content__list--learned">

                        <fmt:setLocale  value="vi_VN"/>
                        <div class="content__list--learned__item">
                            <i class="fa-regular fa-bookmark"></i>
                            <span><strong>Subject: </strong>${category.cateName}</span>
                        </div>
                        <div class="content__list--learned__item">
                        </div>
                        <div class="content__list--learned__item">
                            <i class="fa-solid fa-check"></i>
                            <span><strong>Level: </strong>${level.levelName}</span>
                        </div>
                        <div class="content__list--learned__item">
                            <i class="fa-regular fa-calendar"></i>
                            <span><strong>Start date: </strong><fmt:formatDate pattern="dd/MM/YYYY" value="${course.startDate}"/> - <fmt:formatDate pattern="dd/MM/YYYY" value="${course.endDate}"/></span>
                        </div>
                        <div class="content__list--learned__item">
                            <i class="fa-regular fa-user"></i>
                            <span><strong>Teacher: </strong>${teacherName}</span>
                        </div>
                        <div class="content__list--learned__item">
                            <i class="fa-regular fa-calendar-check"></i></i>
                            <span><strong>Last update: </strong><fmt:formatDate pattern="dd/MM/YYYY" value="${course.lastUpdateDate}"/></span>
                        </div>
                    </div>
                </div>
                <div class="content__right">
                    <img
                        src="${course.imageUrl}"
                        alt=""
                        width="100%"
                        height="200px"
                        style="object-fit: cover"
                        />
                    <div class="content__right__infoCourse">
                        <h2 style="color: red;"><fmt:formatNumber value="${course.tuitionFee}" type="currency"/></h2>
                        <div class="btn--addList">
                            <button type="button" onclick="addCart(${course.courseID}, this)" ${inCart ? "disabled" : ""}  class='btn btn--cart ${inCart ? "btn-outline-success" : "btn-outline-warning"}'>
                                ${inCart ? "This course is already in cart" : "Book this course" }
                            </button>
                        </div>
                        <p style="font-size: 18px; font-weight: 600; margin: 15px 0 0">
                            This course includes:
                        </p>
                        <ul class="content__course">
                            <li>30 mins on-demand video</li>
                            <li>4 downloadable resources</li>
                            <li>Full lifetime access</li>
                            <li>Access on mobile and TV</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/footer.html"/>
        <script src="https://kit.fontawesome.com/1aa19ebad3.js" crossorigin="anonymous"></script>
        <script>
                                function addCart(id, el) {
                                    swal("Add cart successfully", "", "success").then(result => {
                                        if (result) {
                                            console.log(el.classList.replace("btn-outline-warning", "btn-outline-success"))
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
