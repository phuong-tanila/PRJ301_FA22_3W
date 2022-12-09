<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script src="https://kit.fontawesome.com/1d58ef5eb1.js" crossorigin="anonymous"></script>
        <!--<link href="../../assets/css/headerAfterLogin.css" rel="stylesheet" type="text/css"/>-->
    </head>

    <body>
        <nav class="navbar navbar-expand-lg bg-light ">
            <div class="container d-flex">
                <a class="navbar-brand" href="<c:url value="/"/>">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <form class="d-flex justify-content-center w-50" role="search" action="MainController" method="GET">
                    <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search" name="searchValue">
                    <button class="btn btn-outline-success" type="submit" name="btnAction" value="search">
                        <i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <button type="button" onclick="window.location.href = '<c:url value="login.html"/>'"class="btn btn-primary">Login</button>
            </div>
        </nav>
    </body>

</html>