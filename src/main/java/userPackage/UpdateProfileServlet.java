package userPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userPackage.DBConnection;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve the updated user details from the form
        String updatedUsername = request.getParameter("username");
        String updatedEmail = request.getParameter("email");
//        String updatedPassword = request.getParameter("password");
        String updatedContactNum = request.getParameter("contactNum");

        //get the userId from session
        HttpSession session = request.getSession();
        int userId = (Integer) session.getAttribute("user_id");

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            //connect to the database
            con = DBConnection.getConnection();
            
            //SQL query to update user details
            String sql = "UPDATE User SET username = ?, email = ?, contactNum = ? WHERE user_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, updatedUsername);
            pstmt.setString(2, updatedEmail);
//            pstmt.setString(3, updatedPassword);  // Handle password hashing if needed
            pstmt.setString(3, updatedContactNum);
            pstmt.setInt(4, userId);

            pstmt.executeUpdate();

            //update session attributes
            session.setAttribute("username", updatedUsername);
            session.setAttribute("email", updatedEmail);
            session.setAttribute("contactNum", updatedContactNum);
            
            // Set success message in session
            session.setAttribute("successMessage", "Profile updated successfully!");

            //redirect back to the profile page
            response.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
