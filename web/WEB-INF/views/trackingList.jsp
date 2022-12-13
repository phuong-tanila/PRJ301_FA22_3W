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
    <body>
        <jsp:include page="headerLogin.jsp"/>
        
        <fmt:setLocale value="vi_VN"/>
        <c:forEach items="${listOrder}" var="i">
            <div class="card mb-4">

                <div class="card-header py-3">
                    <h5 class="mb-0 d-flex justify-content-between">
                        <span class="justify-content-center">OrderID #<span>${i.orderID}</span>  </span>
                        <span><fmt:formatDate value="${i.buyDate}"/></span>
                        <span>Pay by: ${i.paymentMethod.toUpperCase()}</span>
                        <span>Total: <fmt:formatNumber type="currency" value="${i.totalPrice}"/> </span> 
                    </h5>
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
                            <p><strong>${a.course.courseName}</strong></p>
                            <p>${a.user.fullName}</p>
                            <p><fmt:formatDate value="${a.course.startDate}"/> to <fmt:formatDate value="${a.course.endDate}"/> </p>
                            <!-- Data -->
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                            <!-- Price -->
                            <p class="text-start text-md-center">
                                <strong>Tutor fee: <span class="itemMoney"><fmt:formatNumber type="currency" value="${a.price}"/></span></strong>
                            </p>
                            <!-- Price -->
                        </div>
                    </div>
                    </c:forEach>                  
                    <!-- Single item -->
                    <hr class="my-4">
                    <!-- Single item -->
                </div>
            </div>
        </c:forEach>
    </body>
</html>
