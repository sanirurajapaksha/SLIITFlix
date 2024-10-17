<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<style>
    #body {
        font-family: Arial, sans-serif;
        background-image: url('wallpaper.jpg'); 
        background-size: cover; 
        background-position: center;
        background-repeat: no-repeat; 
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #ffffff; 
        position: relative;
        animation: backgroundMove 5s ease-in-out infinite alternate;
        flex-direction: column; 
    }

	@keyframes backgroundMove {
        0% {
            background-position: center center;
        }
        100% {
            background-position: center top; 
        }
    }
    
	
    #body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5); 
        z-index: 0; 
    }
    
    form {
        background-color: rgba(31, 31, 31, 0.85); 
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.8); 
        width: 100%;
        max-width: 400px;
        text-align: center;
        z-index: 1;
    }

    h1 {
    	margin-left: 15px;
        color: #eaeaea; 
        margin-bottom: 20px;
        font-weight: 300;
        letter-spacing: 1px;
        text-align: left;.
    }

    input[type="text"], input[type="password"] {
        width: 175%;
        padding: 15px;
        border: 1px solid #888888;
        border-radius: 5px;
        margin: 7px 0;
        box-sizing: border-box;
        background: #2d2d2d; 
        color: #ffffff; 
        font-size: 16px;
    }
    
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
    border-color: #ffffff; 
    outline: none; 
    }

    input[type="text"]::placeholder, input[type="password"]::placeholder {
        color: #888888; 
        font-size: 14px;
    }

    input[type="submit"] {
        width: 175%;
        padding: 15px;
        background-color: #444; 
        color: #ffffff; 
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 20px;
        letter-spacing: 1px;
    }

    input[type="submit"]:hover {
        background-color: #5c5c5c; 
    }

    .error-message {
        color: #e74c3c; 
        background-color: rgba(255, 255, 255, 0.1);
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    .register-link {
        color: #d3d3d3; 
        margin-top: 15px;
    }

    .register-link a {
        text-decoration: none;
        color: #eaeaea; 
        font-weight: bold;
    }

    .register-link a:hover {
        color: #ffffff; 
    }

    @media (max-width: 600px) {
        input[type="submit"] {
            padding: 15px;
        }
    }
</style>
</head>
<body>
	<div id="body">
		<form action="UserLoginServlet" method="post">
        <h1><b>  Sign In</b></h1>

        <!-- Error handling message display -->
        <% 
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="error-message"><%= error %></p>
        <% 
            }
        %>
        
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="username" name="username" placeholder="Username or Email" required>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="password" id="password" name="password" placeholder="Password" required minlength="6" title="Password must be at least 6 characters long">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Login">
                </td>
            </tr>
        </table>
        
        <!-- Link to registration page -->
        <div class="register-link">
            Not a member? <a href="Register.jsp">Sign up now.</a>
        </div>
    	</form>
	</div>
    
</body>
</html>

<jsp:include page="Footer.jsp" />