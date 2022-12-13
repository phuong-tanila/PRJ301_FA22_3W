<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : trackingList
    Created on : Dec 12, 2022, 4:13:51 PM
    Author     : ADmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #efefef">
        <jsp:include page="headerLogin.jsp"/>
        <fmt:setLocale value="vi_VN"/>
        <h1 style="color: #696969; text-align: center; margin: 5px 0px;">Order Tracking</h1>
        <div class="col-md-8" style="margin: 20px auto !important; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
            <c:forEach items="${listOrder}" var="i">
                <div class="card mb-4">
                    <div class="card-header">
                        <p class="mb-0 d-flex justify-content-around">
                            <span class="justify-content-center"><strong>OrderID</strong> #<span>${i.orderID}</span></span>
                            <span><strong>Ordered date: </strong><fmt:formatDate value="${i.buyDate}"/></span>
                            <span><strong>Pay by: </strong>${i.paymentMethod.toUpperCase()}</span>
                            <span><strong>Total: </strong><fmt:formatNumber type="currency" value="${i.totalPrice}"/> </span> 
                        </p>
                    </div>
                    <div class="card-body">
                        <!-- Single item -->
                        <c:forEach var="a" items="${i.items}">
                            <div class="row course-id" course-id="${a.courseID}">
                                <a href="MainController?id=${a.courseID}&amp;btnAction=detail">
                                </a><div class="col-lg-3 col-md-12 mb-4 mb-lg-0"><a href="MainController?id=${a.courseID}&amp;btnAction=detail">
                                        <!-- Image -->
                                    </a><div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light"><a href="MainController?id=${a.courseID}&amp;btnAction=detail">
                                            <img src="${a.course.imageUrl}" class="w-100" alt="Blue Jeans Jacket">
                                        </a><a href="#!">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <!-- Data -->
                                    <p><strong>Course: </strong>${a.course.courseName}</p>
                                    <p><strong>Teacher: </strong>${a.user.fullName}</p>
                                    <p><strong>Start date: </strong><fmt:formatDate pattern="dd/MM/YYYY" value="${a.course.startDate}"/> - <fmt:formatDate pattern="dd/MM/YYYY" value="${a.course.endDate}"/> </p>
                                    <p><strong>Tutor fee: </strong><span style="color: red" class="itemMoney"><fmt:formatNumber type="currency" value="${a.price}"/></span></p>
                                    <!-- Data -->
                                </div>
                            </div>
                            <hr class="my-4">
                        </c:forEach>               
                        <!-- Single item -->
                        <hr class="my-4">
                        <!-- Single item -->
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="footer.html"/>
    </body>
</html>
