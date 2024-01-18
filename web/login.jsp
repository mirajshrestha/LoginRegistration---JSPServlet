<%-- 
    Document   : login
    Created on : Jan 17, 2024, 5:01:01 PM
    Author     : MODERN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
        <form action="LoginServlet" method="post" onsubmit="return validateForm()">
            Username: <input type="text" name="username" id="username"><br>
            Password: <input type="password" name="password" id="password"><br>
            <input type="submit" value="Login">
        </form>
    </body>
    <script type="text/javascript">
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if (username == "") {
                alert("Please enter username");
                return false;
            }
            if (password == "") {
                alert("Plese enter password");
                return false;
            }
        }
    </script>
</html>
