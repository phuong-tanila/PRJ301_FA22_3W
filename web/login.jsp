<%-- 
    Document   : login
    Created on : Dec 9, 2022, 6:05:39 AM
    Author     : 15tha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.css"
            rel="stylesheet"
            />
    </head>
    <body class="vh-100">
        <jsp:include page="WEB-INF/views/headerLogin.jsp"/>
        <!-- Pills navs -->
        <div class="">
            <section class="">
                <div class="container-fluid justify-content-center align-items-center h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-9 col-lg-6 col-xl-5">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                                 class="img-fluid" alt="Sample image">
                        </div>
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <form method="POST" action="MainController">
                                <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                    <p class="lead fw-bold mb-0 me-3">Sign in with</p>

                                    <!-- Sign with Google -->
                                    <span id="">
                                        <div id="g_id_onload"
                                             data-client_id="148898507863-35p32uerrpsqcs752loi69eb9ouji8k1.apps.googleusercontent.com"
                                             data-context="signin"
                                             data-ux_mode="popup"
                                             data-callback="handleCredentialResponse"
                                             data-itp_support="true">
                                        </div>

                                        <div class="g_id_signin"
                                             data-type="standard"
                                             data-shape="pill"
                                             data-theme="filled_blue"
                                             data-text="signin_with"
                                             data-size="large"
                                             data-logo_alignment="left">
                                        </div>
                                    </span>
                                </div>


                                <div class="divider d-flex align-items-center my-4">
                                    <p class="text-center fw-bold mb-0">OR</p>
                                </div>

                            
                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="text" required id="form3Example3" name="username" class="form-control form-control-lg"
                                           placeholder="Enter a valid email address" />
                                    <label class="form-label" for="form3Example3">Email address</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-3">
                                    <input type="password" required id="form3Example4" name="password" class="form-control form-control-lg"
                                           placeholder="Enter password" />
                                    <label class="form-label" for="form3Example4">Password</label>
                                </div>
                                <p id='msg' style="color: red;">${msg}</p>

                                <div class="text-center text-lg-start mt-4 pt-2">
                                    <button type="submit" name="btnAction" value="login" class="btn btn-primary btn-lg"
                                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                    <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                                                                                                      class="link-danger">Register</a></p>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- MDB -->
        <footer style="width: 100%;bottom: 0; position: absolute;" class="bg-dark text-center text-white">
            <!-- Grid container -->
            <div class="container p-4">
                <!-- Section: Social media -->
                <section>
                    <!-- Facebook -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-facebook-f"></i
                        ></a>

                    <!-- Twitter -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-twitter"></i
                        ></a>

                    <!-- Google -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-google"></i
                        ></a>

                    <!-- Instagram -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-instagram"></i
                        ></a>

                    <!-- Linkedin -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-linkedin-in"></i
                        ></a>

                    <!-- Github -->
                    <a class="btn btn-outline-light btn-floating m-1 rounded-circle" href="#!" role="button"
                       ><i class="fab fa-github"></i
                        ></a>
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); color: RGB(255, 193, 7);">
                <p>
                    &copy; 2022 TKK-Piano - 3T2P - FPT University<br>
                    Address: Lot E2a-7, D1 Street, Long Thanh My Ward, Thu Duc City, Ho Chi Minh City<br>
                    Phone: (+84) 936 999 999 | Email: info@3t2p.com.vn
                </p>
            </div>
            <!-- Copyright -->
        </footer>
        <form id="googleSignIn">
            <input type="text" id='hiddenEmail' hidden name="email">
        </form>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"
        ></script>
        <!-- Pills content -->
        <script>
            const msg = localStorage.getItem("msg");
            if(msg != null){
                document.querySelector("#msg").innerHTML = msg;
                localStorage.removeItem("msg");
            }
            // function to get response
            function handleCredentialResponse(response) {
                const responsePayload = decodeJwtResponse(response.credential);
                const email = responsePayload.email;
                fetch("<c:url value="/MainController?btnAction=login&func=loginGoogle&email="/>" + email,{
                    method:"GET"
                })
                .then(res => res.json())
                .then(res => {
                    if(res == null){
                        localStorage.setItem("msg", "This email is not existed in our system, please login to another one");
                        window.location.reload(); 
                    }else{
                        window.location.href = '<c:url value="/MainController"/>'
                    }
                });
//                img.src = responsePayload.picture;
//                getName.innerHTML = responsePayload.name;
//                id.innerHTML = responsePayload.sub;
//                email.innerHTML = responsePayload.email;
//                container.style.display = 'inline-block';
//                googleButton.style.display = 'none'

            }

            window.onload = function () {

                // also display the One Tap dialog on right side
                // important for auto login
                google.accounts.id.prompt();
            }

            // function to decode the response.credential
            function decodeJwtResponse(token) {
                var base64Url = token.split('.')[1];
                var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
                var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
                    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
                }).join(''));
                return JSON.parse(jsonPayload);
            }

        </script>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    </body>
</html>
