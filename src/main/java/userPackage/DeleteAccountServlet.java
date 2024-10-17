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

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        //check if session exists and userId is present in session
        if (session != null && session.getAttribute("user_id") != null) {
            int userId = (Integer) session.getAttribute("user_id");
            
            try (Connection con = DBConnection.getConnection(); 
                 PreparedStatement pstmt = con.prepareStatement("DELETE FROM user WHERE user_id = ?")) {
                
                //set userId in the query
                pstmt.setInt(1, userId);

                //execute the delete query
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    //invalidate the session to log out the user
                    session.invalidate();

                    //redirect to home page after successful deletion
                    response.sendRedirect("index.jsp");
                } else {
                    //if no rows were affected, show an error (user may not exist)
                    request.setAttribute("errorMessage", "Account deletion failed. Please try again.");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                //forward to profile again with a message
                request.setAttribute("errorMessage", "An error occurred while deleting your account.");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }

        } else {
            //redirect to login if no session exists
            response.sendRedirect("Login.jsp");
        }
    }

    //override doGet to not allow account deletion via GET request (to enforce security)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}
