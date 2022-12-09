<%-- 
    Document   : detail
    Created on : Dec 9, 2022, 5:49:23 AM
    Author     : 15tha
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .description{
                word-wrap: break-word;
                white-space:pre-wrap;
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerLogin.jsp"/>
        ${course}
        <button onclick="addCart(${course.courseID})"> add to cart</button>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h4 class="">${course.courseName}</h4>
                    <p class="description  ">${course.description}</p>
                </div>
                <div class="col-md-4">
                    <img  class="w-100" src="${course.imageUrl}">
                </div>
            </div>
        </div>
        <script>
            function addCart(id) {
                fetch("<c:url value="/CartController"/>" + "?func=add&id=" + id, {

                    method: "GET",
//                    body: JSON.stringify({
//                        func: "add",
//                        id: id
//                    })
                }).then(data => data.json())
            }
        </script>
    </body>
</html>
