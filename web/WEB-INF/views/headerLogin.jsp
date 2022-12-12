<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script src="https://kit.fontawesome.com/1aa19ebad3.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1d58ef5eb1.js" crossorigin="anonymous"></script>
        <!--<link href="../../assets/css/headerAfterLogin.css" rel="stylesheet" type="text/css"/>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-4 mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active me-4" aria-current="page" href="<c:url value="/"/>">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Category
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
                                <c:forEach var="c" varStatus="loop" items="${Category}">                         
                                    <li><a class="dropdown-item text-white" href="<c:url value="/SearchController?cateId=${c.cateID}"/>">${c.cateName}</a></li>    
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex w-100 me-4">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="searchValue">
                        <button class="btn btn-outline-warning" type="submit" name="btnAction" value="search">
                            <i class="fa-solid fa-magnifying-glass"></i></button>    
                    </form>
                    <c:if test="${user != null}">
                        <c:if test='${user.role != "AD" }'>
                            <button type="button" onclick="window.location.href = '<c:url value="MainController?btnAction=cart&func=showCart"/>'"class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i></button>
                            </c:if>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.user.fullName}
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <c:if test='${user.role != "AD" }'>
                                    <li><a class="dropdown-item" href="<c:url value="MainController?btnAction=tracking&userId=${user.userID}"/>">Order tracking</a></li>
                                    </c:if>
                                    <c:if test='${user.role == "AD" }'>
                                    <li><a class="dropdown-item" href="<c:url value="MainController?btnAction=admin&func=showCreate"/>">Admin</a></li>
                                    </c:if>

                                <li><a class="dropdown-item" href='<c:url value="MainController?btnAction=logout"/>'>Log out</a></li>
                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${user == null}">
                        <button type="button" onclick="window.location.href = '<c:url value="MainController?btnAction=cart&func=showCart"/>'"class="btn btn-outline-warning me-4"><i class="fa-solid fa-cart-shopping"></i></button>
                        <button type="button" onclick="window.location.href = '<c:url value="login.jsp"/>'"class="btn btn-warning">Login</button>
                    </c:if>
                </div>
            </div>
        </nav>


    </body>

</html>