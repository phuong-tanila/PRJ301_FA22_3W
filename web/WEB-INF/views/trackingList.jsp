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
        <h1>${listOrder}</h1>
    <fmt:setLocale value="vi_VN"/>
        <c:forEach items="${listOrder}" var="i">
            <div class="card mb-4">
                
                <div class="card-header py-3">
                    <h5 class="mb-0 d-flex justify-content-between">
                        <span class="justify-content-center">Order #<span>${i.orderID}</span>  </span>
                        <span><fmt:formatDate value="${i.buyDate}"/></span>
                        <span>pay by: ${i.paymentMethod}</span>
                        <span>total: <fmt:formatNumber type="currency" value="${i.totalPrice}"/> </span> 




                    </h5>
                </div>
                <div class="card-body">
                    <!-- Single item -->

                    <div class="row course-id" course-id="36">
                        <a href="MainController?id=36&amp;btnAction=detail">
                        </a><div class="col-lg-3 col-md-12 mb-4 mb-lg-0"><a href="MainController?id=36&amp;btnAction=detail">
                                <!-- Image -->
                            </a><div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light"><a href="MainController?id=36&amp;btnAction=detail">
                                    <img src="https://mythuatbui.edu.vn/wp-content/uploads/2017/02/%E1%BA%A2nh-m%C3%B4-t%E1%BA%A3-2-1.jpg" class="w-100" alt="Blue Jeans Jacket">
                                </a><a href="#!">
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                            <!-- Data -->
                            <p><strong>Khóa học vẽ tại TP. Hồ Chí Minh</strong></p>

                            <p>Lê Văn Toản</p>
                            <p>14/09/2022 - 14/10/2022</p>


                            <!-- Data -->
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">


                            <!-- Price -->
                            <p class="text-start text-md-center">
                                <strong>Tutor fee: <span class="itemMoney">700.000 đ</span></strong>
                            </p>
                            <!-- Price -->
                            <button type="button" onclick="" class="btn w-100 btn-primary btn-sm me-1 mb-2 justify-content-center" data-mdb-toggle="tooltip" title="Remove item">
                                <i class="fas fa-trash" aria-hidden="true"></i>
                            </button>
                        </div>

                    </div>
                    <!-- Single item -->

                    <hr class="my-4">



                    <!-- Single item -->
                </div>
            </div>
        </c:forEach>

        <c:forEach var="a" items="${listOrder}">
            <h3>${a.orderID}</h3>
            <h3>${a.buyDate}</h3>

            <h3>${a.paymentMethod}</h3>
            <h3>${a.totalPrice}</h3>
            <h3>${a.paymentStatus}</h3>



        </c:forEach>

        private int orderID;
        private int userID;
        private Date buyDate;
        private int totalPrice;
        private String paymentMethod;
        private String paymentStatus;
        private List<OrderItemDTO> items;
        <h3>a</h3>
    </body>
</html>
