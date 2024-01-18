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
                if (request.getParameter("email") != null) {
                    if (request.getParameter("email").equals("exists")) {
                        out.println("Email already exits");
                    }
                }
            %>
            <br>
            Username: <input type="text" name="username" id="username"><br>
            Email: <input type="text" name="email" id="email"><br>
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
            var email = document.getElementById("email").value;
            if (username == "") {
                alert("Please enter username");
                return false;
            }
            if(email == ""){
                alert("Please enter email");
                return false;
            }
            if(email.indexOf('@')<=0){
                alert("Invalid @ position");
                return false;
            }
            if((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')){
                alert("Invalid email sturcture");
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
