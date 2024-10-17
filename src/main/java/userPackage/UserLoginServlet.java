package userPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userPackage.DBConnection;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean isValidUser = false;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        //database connection and validation logic
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            //SQL query to check for matching user name/email and password
            String sql = "SELECT * FROM User WHERE (username = '"+username+"' OR email = '"+username+"') AND password = '"+password+"'";
            rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                isValidUser = true;  //if a match is found
                
                
                //get user details
                int userId = rs.getInt("user_id");
                String email = rs.getString("email");
                String contactNum = rs.getString("contactNum");
                
                //create a session and set user attributes
                HttpSession session = request.getSession();
                session.setAttribute("user_id", userId);
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("contactNum", contactNum);
                
                //redirect to profile page
                String alertMessage = "Login Successful!";
                response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'profile.jsp'</script>");
                
            } else {
                //invalid login
                response.sendRedirect("Login.jsp?error=Invalid%20username%20or%20password");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        
    }
}
