<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!--update successful message-->
<%
    String successMessage = (String) session.getAttribute("successMessage");
    if (successMessage != null) {
%>
    <script>
        alert("<%= successMessage %>");
    </script>
<%
        session.removeAttribute("successMessage"); // Remove the message from the session to avoid repeated alerts
    }
%>

<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>

		.body{
		
			display: flex;
			justify-content: center;
		
		}

        .profile-container {
        	margin:50px;
            background-color: #1f1f1f; 
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.8); 
            width: 100%;
            
            
            max-width: 400px;
            text-align: left; 
        }

        h2 {
            color: #eaeaea; 
            margin-bottom: 20px;
            font-weight: 300;
            letter-spacing: 1px;
        }
        
	    label {
	    display: block;
	    margin-bottom: 8px; 
	    font-size: 15px; 
	    color: #eaeaea; 
		}

        input {
            font-size: 15px;
            margin-bottom: 18px;
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            background: #2d2d2d; 
            color: #ffffff; 
            text-align: left; 
        }

        input[readonly] {
            background: #2d2d2d; 
        }

        .edit-btn, .save-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #444; 
            color: #ffffff; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            text-align: center;
        }

        .edit-btn:hover, .save-btn:hover {
            background-color: #5c5c5c; 
        }

        .logout-btn {
            display: block;
            width: 95%;
            padding: 10px;
            background-color: #444; 
            color: #ffffff; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            text-align: center;
            text-decoration: none; 
        }

        .logout-btn:hover {
            background-color: #d32f2f; 
        }

        .delete-btn {
            display: block;
            width: 100%;
            padding: 10px;
            color: red; 
            border: none; 
            background-color: transparent; 
            cursor: pointer;
            font-size: 12px; 
            margin-top: 10px; 
            text-transform: uppercase; 
            text-align: center;
        }
        
    </style>
</head>
<body>
	<div class="body">
		<div class="profile-container">
        <h2><center>User Profile</center></h2>
        <form id="profileForm" action="UpdateProfileServlet" method="post">
            <label>Username</label>
            <input type="text" id="username" name="username" value="<%= session.getAttribute("username") %>" readonly>

            <label>Email</label>
            <input type="email" id="email" name="email" value="<%= session.getAttribute("email") %>" readonly>

            

            <label>Contact Number</label>
            <input type="text" id="contactNum" name="contactNum" value="<%= session.getAttribute("contactNum") %>" readonly>

            <!-- Edit and Save buttons -->
            <button type="button" class="edit-btn" id="editBtn" onclick="enableEditing()">Edit</button>
            <button type="submit" class="save-btn" id="saveBtn" style="display:none;">Save</button>
        </form>

        <!-- Logout link with no underline -->
        <a href="logout.jsp" class="logout-btn">Logout</a>

        <!-- Delete Account button with changes applied below logout -->
        <button type="button" class="delete-btn" onclick="confirmDelete()">Delete Account</button>
    	</div>
	</div>
    

    <script>
        function enableEditing() {
            document.getElementById('username').readOnly = false;
            document.getElementById('email').readOnly = false;
            
            document.getElementById('contactNum').readOnly = false;
            document.getElementById('editBtn').style.display = 'none';
            document.getElementById('saveBtn').style.display = 'block';
        }

        function confirmDelete() {
            if (confirm('Are you sure you want to delete your account? This action cannot be undone.')) {
                var form = document.createElement("form");
                form.method = "POST";
                form.action = "DeleteAccountServlet";
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>

<jsp:include page="Footer.jsp" />