<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h2>Registration</h2>
        <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <%
                if (request.getParameter("username") != null) {
                    if (request.getParameter("username").equals("exists")) {
                        out.println("Username already exits");
                    }
                }
            %>
            <br>
            Username: <input type="text" name="username" id="username"><br>
            Password: <input type="password" name="password" id="password"><br>
            Confirm Password: <input type="password" name="cpassword" id="cpass"><br>
            <input type="submit" value="Register">
        </form>
    </body>
    <script type="text/javascript">
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var cpass = document.getElementById("cpass").value;
            if (username == "") {
                alert("Please enter username");
                return false;
            }
            if (password == "") {
                alert("Plese enter password");
                return false;
            }
            if ((password.length <= 5) || (password.length > 20)) {
                alert("Passwords length must be between  5 and 20");
                return false;
            }
            if (cpass == "") {
                alert("Plese confirm password");
                return false;
            }
            if (password != cpass) {
                alert("Password does not match the confirm password");
                return false;
            }
        }
    </script>
</html>
