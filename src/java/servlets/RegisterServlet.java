package servlets;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import org.mindrot.jbcrypt.BCrypt;
import com.mysql.jdbc.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBUtil;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        System.out.println(username);
        System.out.println(password);
        System.out.println(email);

        try {
            Connection conn = (Connection) DBUtil.getConnection();
            PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement("select * from users where email=?");
            pstmt.setString(1, email);
            ResultSet rs = (ResultSet) pstmt.executeQuery();
            if (rs.next()) {
                response.sendRedirect("register.jsp?email=exists");
            } else {
                String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                String query = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
                PreparedStatement preparedStatement = (PreparedStatement) conn.prepareStatement(query);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, hashedPassword);
                preparedStatement.setString(3, email);
                preparedStatement.executeUpdate();
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
