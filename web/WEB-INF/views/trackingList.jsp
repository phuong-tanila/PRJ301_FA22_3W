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
<<<<<<< HEAD
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
=======

        <fmt:setLocale value="vi_VN"/>


        <c:if  test="${empty listOrder}" >
            <h1 style="text-align: center; color: #696969">Bạn chưa mua sản phẩm nào!!</h1>
        </c:if>

        <c:if  test="${listOrder != null}" >  
            <c:forEach items="${listOrder}" var="i">
                <div class="card mb-4">
                    <div class="card-header py-3">
                        <h5 class="mb-0 d-flex justify-content-between">
                            <span class="justify-content-center">OrderID #<span>${i.orderID}</span>  </span>
                            <span><fmt:formatDate value="${i.buyDate}"/></span>
                            <span>Pay by: ${i.paymentMethod.toUpperCase()}</span>
                            <span>Total: <fmt:formatNumber type="currency" value="${i.totalPrice}"/> </span> 
                        </h5>
>>>>>>> 1634adf9ecff6cbe9b87d245555dc904a34ace82
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
<<<<<<< HEAD
                                    <p><strong>Course: </strong>${a.course.courseName}</p>
                                    <p><strong>Teacher: </strong>${a.user.fullName}</p>
                                    <p><strong>Start date: </strong><fmt:formatDate pattern="dd/MM/YYYY" value="${a.course.startDate}"/> - <fmt:formatDate pattern="dd/MM/YYYY" value="${a.course.endDate}"/> </p>
                                    <p><strong>Tutor fee: </strong><span style="color: red" class="itemMoney"><fmt:formatNumber type="currency" value="${a.price}"/></span></p>
                                    <!-- Data -->
                                </div>
                            </div>
                            <hr class="my-4">
                        </c:forEach>               
=======
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
>>>>>>> 1634adf9ecff6cbe9b87d245555dc904a34ace82
                        <!-- Single item -->
                        <hr class="my-4">
                        <!-- Single item -->
                    </div>
                </div>
<<<<<<< HEAD
            </c:forEach>
        </div>
=======
<<<<<<< HEAD
            </c:forEach>
        </c:if>
=======
            </div>
        </c:forEach>
>>>>>>> 1634adf9ecff6cbe9b87d245555dc904a34ace82
        <jsp:include page="footer.html"/>
>>>>>>> 97871c8e891fef977fd9beb01dca402d22d0c0fa
    </body>
</html>
