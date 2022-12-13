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
                                    <p class="lead fw-bold mb-0 me-3">Sign in with</p>

                                    <!-- Sign with Google -->
                                    <span id="google-button"></span>
                                </div>


                                <div class="divider d-flex align-items-center my-4">
                                    <p class="text-center fw-bold mb-0">OR</p>
                                </div>
<<<<<<< HEAD

=======
                                
                                <!-- Sign with Google -->
                                <div>
                                    
                                </div>
                                
>>>>>>> a2da7ebbee50f2add177515ffc70b9a790fe889a
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
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"
        ></script>
        <!-- Pills content -->
        <script>
            var googleButton = document.getElementById('google-button');
            var container = document.getElementsByClassName('container')[0];
            var img = document.getElementsByClassName('img')[0];
            var getName = document.getElementsByClassName('name')[0];
            var id = document.getElementsByClassName('id')[0];
            var email = document.getElementsByClassName('email')[0];

            // function to get response
            function handleCredentialResponse(response) {
                const responsePayload = decodeJwtResponse(response.credential);
                img.src = responsePayload.picture;
                getName.innerHTML = responsePayload.name;
                id.innerHTML = responsePayload.sub;
                email.innerHTML = responsePayload.email;
                container.style.display = 'inline-block';
                googleButton.style.display = 'none'
            }

            window.onload = function () {
                google.accounts.id.initialize({
                    // replace your client id below
                    client_id: "148898507863-35p32uerrpsqcs752loi69eb9ouji8k1.apps.googleusercontent.com",
                    callback: handleCredentialResponse,
                    auto_select: true,
                    auto: true
                });
                google.accounts.id.renderButton(
                        document.getElementById("google-button"),
                        {theme: "filled_blue", size: "medium", width: '200'}  // customization attributes
                );
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

            function signOut() {
                google.accounts.id.disableAutoSelect();
                // do anything on logout
                location.reload();
            }
        </script>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    </body>
</html>
