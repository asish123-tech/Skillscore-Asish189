<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | SkillScore</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 45px;
            width: 380px;
            border-radius: 16px;
            backdrop-filter: blur(12px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.35);
            color: #fff;
            animation: fadeIn 1.2s ease;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 22px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 11px 14px;
            border-radius: 10px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        .form-group input::placeholder {
            color: #777;
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            background: #1cc88a;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: #17a673;
        }

        .login-link {
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
        }

        .login-link a {
            color: #1cc88a;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>

<div class="register-container">

    <h2>Create Account</h2>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="form-group">
            <input type="text" name="name" placeholder="Full Name" required>
        </div>

        <div class="form-group">
            <input type="email" name="email" placeholder="Email Address" required>
        </div>

        <div class="form-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <div class="form-group">
			<input type="hidden" name="role" value="STUDENT"/>

        </div>

        <button type="submit" class="register-btn">Register</button>
    </form>

    <div class="login-link">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </div>

</div>

</body>
</html>
