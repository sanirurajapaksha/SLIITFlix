<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
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
        width:100%;
        flex-direction:column;
        justify-content: center;
        align-items: center;
        height: 100%;
        color: #ffffff; 
        position: relative;
        animation: backgroundMove 5s ease-in-out infinite alternate; 
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
        background: rgba(0, 0, 0, 0.8);
        z-index: 1; 
    }

    form {
    	margin:50px;
    	align-self:center;
        background-color: rgba(31, 31, 31, 0.85); 
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.8); 
        width: 100%;
        max-width: 400px;
        text-align: center; 
        z-index: 3;
    }

    h2 {
        color: #eaeaea; 
        margin-bottom: 20px;
        font-weight: 300;
        letter-spacing: 1px;
    }

    input[type="text"], input[type="email"], input[type="password"] {
        width: 175%;
        padding: 15px;
        border: 1px solid #888888;
        border-radius: 5px;
        margin: 10px 0;
        box-sizing: border-box;
        background: rgba(45, 45, 45, 0.5);
        color: #ffffff; 
        font-size: 16px;
        text-align: center; 
    }
    
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
    border-color: #ffffff; 
    outline: none; 
}

    input[type="text"]::placeholder, input[type="email"]::placeholder, input[type="password"]::placeholder {
        color: #888888; 
        font-size: 14px;
        text-align: left; 
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
    }

    input[type="submit"]:hover {
        background-color: #5c5c5c; 
    }

    .login-link {
        margin-top: 15px;
        color: #d3d3d3; 
    }

    .login-link a {
        text-decoration: none;
        color: #eaeaea; 
        font-weight: bold;
    }

    .login-link a:hover {
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
			<form action="UserInsertServlet" method="post">
        <h2><b>User Registration</b></h2>
        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="username" name="username" placeholder="User Name" required>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="password" id="password" name="password" placeholder="Password" required minlength="6" title="Password must be at least 6 characters long">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="text" id="contactNum" name="contactNum" placeholder="Contact Number" required pattern="\d+" title="Please enter a valid contact number (numbers only)">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Sign Up">
                </td>
            </tr>
        </table>
        
        <div class="login-link">
            Already a member? <a href="Login.jsp">Sign in</a>
        </div>
    </form>
	</div>
</body>
</html>

<jsp:include page="Footer.jsp" />