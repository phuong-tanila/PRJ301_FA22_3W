<%-- 
    Document   : test
    Created on : Dec 11, 2022, 1:29:55 AM
    Author     : 15tha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Test" id="form">
            <input name='b'>
            <input type="file" name="a">
            <button type="button" onclick="handleSubmit()">123123213</button>
        </form>
    </body>
    <script>
        function handleSubmit() {
            const form = new FormData(document.querySelector("form"))
            form.append("lmao", "haha");
            const data = new URLSearchParams();
            for (const pair of form) {
                console.log(pair[0] + "   " + pair[1])
                data.append(pair[0], pair[1]);
            }
            console.log(data)
            fetch("<c:url value="/Test"/>", {
                method: 'post',
                body: data
            }).then(res => res).then(() => document.querySelector("form").reset())
        }
    </script>
</html>
