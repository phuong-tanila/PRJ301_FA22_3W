<%-- 
    Document   : showCart
    Created on : Dec 10, 2022, 8:38:30 PM
    Author     : 15tha
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show cart</title>
        <style>
            a.text-white.payment-method i{
                opacity: 0.2;
                color: #0D6EFD;
                font-size: 2.5rem;
            }
            .opa-1{
                opacity: 1 !important;
            }
        </style>
    </head>
    <body style="background-color: #efefef">
        <jsp:include page="headerLogin.jsp"/>
        <section class="h-100 gradient-custom">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0 d-flex justify-content-between"><span class="justify-content-center">Cart - <span class='cart-size'>${cartList.size()}</span> ${cartList.size() == 1 ? "item<span class='letter-s'></span>" : "item<span class='letter-s'>s</span>"}</span>
                                    <c:forEach items="${cartList}" var="i" varStatus="loop">
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <!-- Single item -->
                                    <div class="row course-id" course-id='${courseList[loop.index].courseID}'>
                                        <a href='<c:url value="MainController?id=${courseList[loop.index].courseID}&btnAction=detail"/>'>
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                    <img src="${courseList[loop.index].imageUrl}"
                                                         class="w-100" alt="Blue Jeans Jacket" />
                                                    <a href="#!">
                                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>Course: </strong>${courseList[loop.index].courseName}</p>
                                                <fmt:setLocale value="vi_VN"/>
                                                <p><strong>Teacher: </strong>${teacherList[loop.index].fullName}</p>
                                                <p><strong>Start date: </strong><fmt:formatDate pattern="dd/MM/YYYY" value="${courseList[loop.index].startDate}"/> - <fmt:formatDate pattern="dd/MM/YYYY" value="${courseList[loop.index].endDate}"/></p>
                                                <p><strong>Tutor fee: </strong><span style="color: red" class="itemMoney"><fmt:formatNumber  type="currency" value="${i.price}"/></span>
                                             </p>
                                                <!-- Data -->
                                            </div>
                                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                <button type="button" onclick="handleDelete(this, ${i.courseID})" class="btn w-100 btn-outline-danger btn-sm me-1 mb-2 justify-content-center" data-mdb-toggle="tooltip"
                                                        title="Remove item">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- Single item -->

                                    <hr class="my-4" />

                                </c:forEach>

                                <!-- Single item -->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4"  style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                            <div class="card text-black rounded-3">
                                <div class='card-header py-3'>
                                    <h5 class="mb-0">Payment method</h5>
                                </div>
                                <div class="card-body">
                                    <a type="submit" class="text-white payment-method " onclick='handleChangePaymentMethod(this)'>
                                        <i class="fa-solid fa-wallet opa-1"></i>
                                    </a>
                                    <a type="submit" class="text-white payment-method" onclick='handleChangePaymentMethod(this)'>
                                        <i class="fa-brands fa-cc-paypal"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4"  style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">

                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0">(including VAT)</p>
                                            </strong>
                                        </div>
                                        <span><strong class="total-money">0</strong></span>
                                    </li>
                                </ul>


                                <!-- Button trigger modal -->
                                <div ${empty user ? "" : "id='paypal-button-container'"}>
                                    <button type="button"   class="btn btn-success btn-lg btn-block" 
                                            ${empty user ? 
                                              "data-bs-toggle='modal' data-bs-target='#exampleModal' onclick='checkInput()'" 
                                              : "onclick='handlePayment(&#34;logged in&#34;)'"}>
                                                ${empty user ? "Complete your billing profile" : "Go to checkout"}
                                            </button>
                                    </div>

                                    <!-- Modal -->
                                    <c:if test="${empty user}">
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-xl">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Input payment information</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1">@</span>
                                                            <input id='email' type="email" onchange="checkInput()" class="form-control" placeholder="Input your email" aria-label="Email" aria-describedby="basic-addon1">
                                                        </div>
                                                        <p style="color: red" class="email-noti"></p>
                                                        <div class="input-group mb-3">
                                                            <input id='fullName' type="text" onchange="checkInput()" class="form-control" placeholder="Input your full name">
                                                        </div>
                                                        <p style="color: red" class="fullName-noti"></p>
                                                        <div class="input-group mb-3">
                                                            <input id='phone' type="tel" onchange="checkInput()" class="form-control" placeholder="Input your phone">
                                                        </div>
                                                        <p style="color: red" class="phone-noti"></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>-->
                                                        <div id="paypal-button-container">
                                                            <button type="button" class="btn btn-primary" onclick='handlePayment("not logged in")'>Pay</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form id="hiddenForm" action="MainController">
                        <input name='btnAction' value='cart' hidden>
                        <input name='func' value='pay' hidden>
                        <input name='total' id="total" hidden>
                        <input name='email' id='hiddenEmail'  hidden>
                        <input name='fullName' id='hiddenFullName'  hidden>
                        <input name='phone' id='hiddenPhone' hidden>
                        <input name="paymentMethod" id="paymentMethod" hidden>
                    </form>
                </div>
            </section>
            <jsp:include page="footer.html"/>
            <script src="https://www.paypal.com/sdk/js?client-id=AcSATbC34qNTc0kDCzZGDxWFgnsdQpuWt8HMIPQwHfGU2UBgNx6lAPkoOtczUGEpWuHK0dm-ZOupi3iY" data-namespace="paypal_sdk"></script>
            <script>

                                                                let totalMoney = 0;
                                                                const formatter = new Intl.NumberFormat('vi-VN', {
                                                                    style: 'currency',
                                                                    currency: 'VND',
                                                                });
                                                                const handlePayment = (status) => {
                                                                    console.log(status)
                                                                    if (status == 'not logged in') {
                                                                        document.querySelector("#hiddenEmail").value = document.querySelector("#email").value
                                                                        document.querySelector("#hiddenFullName").value = document.querySelector("#fullName").value
                                                                        document.querySelector("#hiddenPhone").value = document.querySelector("#phone").value
                                                                    }
                                                                    document.querySelector("#paymentMethod").value = document.querySelector(".opa-1").classList.contains("fa-cc-paypal") ? "paypal" : "cash";
                                                                    document.querySelector("#total").value = document.querySelector('.total-money').innerHTML.replace(".", "").replace("&nbsp;", "").replace("₫", "");
                                                                    document.querySelector("#hiddenForm").submit();
                                                                }
                                                                const handleDelete = (el, id) => {
                                                                    swal("Do you want to delete this course out of cart?", {
                                                                        dangerMode: true,
                                                                        buttons: true,
                                                                    }).then(result => {
                                                                        if (result) {
                                                                            el.parentElement.parentElement.parentElement.remove()
                                                                            calculateMoney();
                                                                            fetch('<c:url value="MainController?btnAction=cart&func=delete&id="/>' + id)
                                                                        }
                                                                    })
                                                                }
                                                                const calculateMoney = () => {
                                                                    totalMoney = 0
                                                                    cartItems = document.querySelectorAll(".itemMoney");
                                                                    if (cartItems.length == 0) {
                                                                        document.querySelector(".btn.btn-primary.btn-lg.btn-block").disabled = true;
                                                                        return;
                                                                    }
                                                                    cartItems.forEach(i => {
                                                                        console.log(i)
                                                                        totalMoney += parseInt(i.innerHTML.replace("đ", "").replace(".", "").trim())
                                                                    })
                                                                    document.querySelector(".total-money").innerHTML = formatter.format(totalMoney)
                                                                    document.querySelector(".cart-size").innerHTML = cartItems.length;
                                                                    if (cartItems.length <= 1) {
                                                                        document.querySelector('.letter-s').innerHTML = "";
                                                                    } else {
                                                                        document.querySelector('.letter-s').innerHTML = "s";
                                                                    }
                                                                }
                                                                calculateMoney()
            </script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script>
                                                                let prevMethodIsPaypal = false;
                                                                function renderDefaultBuyButton(isLoggedIn, isDisabled) {
                                                                    if (isLoggedIn == 0) {
                                                                        document.querySelector('#paypal-button-container').innerHTML =
                                                                                '<button type="button" ' +
                                                                                'class="btn btn-primary btn-lg btn-block" ' +
                                                                                (isDisabled ? "disabled " : " ") +
                                                                                ' data-bs-toggle="modal" ' +
                                                                                ' data-bs-target="#exampleModal" onclick="handlePayment(&quot;not logged in&quot;)"> ' +
                                                                                ' Go to checkout' +
                                                                                ' </button>'
                                                                    } else {
                                                                        document.querySelector('#paypal-button-container').innerHTML =
                                                                                '<button type="button" ' +
                                                                                'class="btn btn-primary btn-lg btn-block" ' +
                                                                                (isDisabled ? "disabled " : " ") +
                                                                                ' data-bs-toggle="modal" ' +
                                                                                ' data-bs-target="#exampleModal"  onclick="handlePayment(&quot;logged in&quot;)"> ' +
                                                                                ' Go to checkout' +
                                                                                ' </button>'

                                                                    }
                                                                }
                                                                function handleChangePaymentMethod(el) {
                                                                    document.querySelectorAll(".payment-method>i").forEach(i => {
                                                                        i.classList.remove("opa-1");
                                                                    })
                                                                    const classList = el.querySelector("i").classList;
                                                                    if (classList.contains("fa-cc-paypal")) {
                                                                        if (prevMethodIsPaypal == false) {
                                                                            document.querySelector('#paypal-button-container').innerHTML = "";
                                                                            const vndPrice = document.querySelector('#total').value;
                                                                            let price = 0
                                                                            fetch("https://api.apilayer.com/exchangerates_data/convert?to=usd&from=vnd&amount=700000", {
                                                                                headers: {
                                                                                    apikey: 'Egj2knbKqmkBva9q7FsIrUWpEqQ32Dpa'
                                                                                },
                                                                                method: "GET",
                                                                            }).then(res => res.json()).then(res => price = res.result)
                                                                            console.log(price)
                                                                            paypal_sdk.Buttons({
                                                                                onInit: function (data, actions) {
                                                                                    if (document.querySelector('.cart-size') == 0) {
                                                                                        actions.disable();
                                                                                    } else {
                                                                                        actions.enable();
                                                                                    }
                                                                                },
                                                                                createOrder: function (data, actions) {
                                                                                    return actions.order.create({
                                                                                        purchase_units: [{
                                                                                                amount: {
                                                                                                    value: (Math.round(price * 100) / 100).toString(),
                                                                                                }
                                                                                            }]
                                                                                    });
                                                                                },
                                                                                onApprove: function (data, actions) {
                                                                                    return actions.order.capture().then(function (details) {

                                                                                        // This function shows a transaction success message to your buyer.
                                                                                        console.log(details)
                                                                                        handlePayment(${empty user ? 0 : 1})
                                                                                    });
                                                                                }
                                                                                ,
                                                                                style: {
                                                                                    layout: 'vertical',
                                                                                    color: 'blue',
                                                                                    shape: 'rect',
                                                                                    label: 'paypal'
                                                                                }
                                                                            }).render('#paypal-button-container');
                                                                            prevMethodIsPaypal = true;
                                                                        }
                                                                    } else {
                                                                        prevMethodIsPaypal = false;
                                                                        renderDefaultBuyButton(${empty user ? 0 : 1}, false)
                                                                    }
                                                                    classList.add("opa-1");
                                                                }
                                                                function checkInput() {
                                                                    const emailEl = document.querySelector('#email');
                                                                    const email = emailEl.value;
                                                                    const phoneEl = document.querySelector('#phone');
                                                                    const phone = phoneEl.value;
                                                                    const fullNameEl = document.querySelector('#fullName');
                                                                    const fullName = fullNameEl.value;
                                                                    const errorList = []
                                                                    const fullNameRegex = '(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})';
                                                                    if (!email.match(
                                                                            /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                                                                            )) {
                                                                        errorList.push(1)
                                                                        emailEl.style.border = '1.5px solid red';
                                                                        document.querySelector(".email-noti").innerHTML = "Invalid email";
                                                                    } else {
                                                                        let user;
                                                                        fetch('MainController?btnAction=ajax&func=checkEmailExisted&email=' + email)
                                                                                .then(res => res.json())
                                                                                .then(res => {
                                                                                    user = res;
                                                                                    console.log(user)
                                                                                    if (user == null) {
                                                                                        document.querySelector(".email-noti").innerHTML = "";
                                                                                        emailEl.style.border = '1px solid #ced4da';
                                                                                    } else {
                                                                                        emailEl.style.border = '1.5px solid red';
                                                                                        errorList.push(1)
                                                                                        document.querySelector(".email-noti").innerHTML = "This email is existed in our system";
                                                                                    }
                                                                                })

                                                                    }
                                                                    const phoneRegex = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
                                                                    if (!phone.match(phoneRegex)) {
//                                                                        console.log(phone.match(phoneRegex))
                                                                        errorList.push(2)
                                                                        phoneEl.style.border = '1.5px solid red';
                                                                        document.querySelector(".phone-noti").innerHTML = "Invalid phone";
                                                                    } else {
                                                                        document.querySelector(".phone-noti").innerHTML = "";
                                                                        phoneEl.style.border = '1px solid #ced4da';
                                                                    }
                                                                    if (!fullName.match(fullNameRegex)) {
                                                                        document.querySelector(".fullName-noti").innerHTML = "Invalid full name";
                                                                        fullNameEl.style.border = '1.5px solid red';
                                                                        errorList.push(3)
                                                                    } else {
                                                                        document.querySelector(".fullName-noti").innerHTML = "";
                                                                        fullNameEl.style.border = '1px solid #ced4da';
                                                                    }
//                                                                    if (errorList.length == 0) {
                                                                    const selectedPaymentClassList = document.querySelector(".opa-1").classList;
                                                                    if (selectedPaymentClassList.contains('fa-cc-paypal')) {
                                                                        document.querySelector('#paypal-button-container').innerHTML = "";
                                                                        const vndPrice = document.querySelector('#total').value;
                                                                        let price = 0
                                                                        fetch("https://api.apilayer.com/exchangerates_data/convert?to=usd&from=vnd&amount=700000", {
                                                                            headers: {
                                                                                apikey: 'Egj2knbKqmkBva9q7FsIrUWpEqQ32Dpa'
                                                                            },
                                                                            method: "GET",
                                                                        }).then(res => res.json()).then(res => price = res.result)
                                                                        paypal_sdk.Buttons({
                                                                            onInit: function (data, actions) {
                                                                                if (document.querySelector('.cart-size') == 0 || errorList.length != 0) {
                                                                                    actions.disable();
                                                                                } else {
                                                                                    actions.enable();
                                                                                }
                                                                            },
                                                                            createOrder: function (data, actions) {
                                                                                return actions.order.create({
                                                                                    purchase_units: [{
                                                                                            amount: {
                                                                                                value: (Math.round(price * 100) / 100).toString(),
                                                                                            }
                                                                                        }]
                                                                                });
                                                                            },
                                                                            onApprove: function (data, actions) {
                                                                                return actions.order.capture().then(function (details) {

                                                                                    // This function shows a transaction success message to your buyer.
                                                                                    console.log(details)
                                                                                    handlePayment(${empty user ? 0 : 1})
                                                                                });
                                                                            }
                                                                            ,
                                                                            style: {
                                                                                layout: 'vertical',
                                                                                color: 'blue',
                                                                                shape: 'rect',
                                                                                label: 'paypal'
                                                                            }
                                                                        }).render('#paypal-button-container');
                                                                    } else {
                                                                        renderDefaultBuyButton(${empty user ? 0 : 1}, errorList.length != 0);
                                                                    }
//                                                                    }
                                                                    return errorList;
                                                                }

            </script>
        </body>

    </html>
