<%-- 
    Document   : login
    Created on : Dec 9, 2022, 6:05:39 AM
    Author     : 15tha
--%>

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
                                    <p class="lead fw-normal mb-0 me-3">Sign in with</p>
                                    <!--                                    <button type="button" class="btn btn-primary btn-floating mx-1">
                                                                            <i class="fab fa-facebook-f"></i>
                                                                        </button>
                                    
                                                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                                                            <i class="fab fa-twitter"></i>
                                                                        </button>
                                    
                                                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                                                            <i class="fab fa-linkedin-in"></i>
                                                                        </button>-->
                                </div>

                                <div class="divider d-flex align-items-center my-4">
                                    <p class="text-center fw-bold mx-3 mb-0">Or</p>
                                </div>
                                
                                <!-- Sign with Google -->
                                <div>
                                    <input type="submit" value="" /><a href=""></a>
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
                                <p style="color: red;">${msg}</p>

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
                <section class="mb-4">
                    <!-- Facebook -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-facebook-f"></i
                        ></a>

                    <!-- Twitter -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-twitter"></i
                        ></a>

                    <!-- Google -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-google"></i
                        ></a>

                    <!-- Instagram -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-instagram"></i
                        ></a>

                    <!-- Linkedin -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-linkedin-in"></i
                        ></a>

                    <!-- Github -->
                    <a class="btn btn-outline-warning btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-github"></i
                        ></a>
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                @CopyRight From 3T2P
            </div>
            <!-- Copyright -->
        </footer>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"
        ></script>
        <!-- Pills content -->
    </body>
</html>
