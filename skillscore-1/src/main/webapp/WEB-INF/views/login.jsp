<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | SkillScore</title>
    <style>
		body {
		    margin: 0;
		    height: 100vh;
		    font-family: 'Segoe UI', sans-serif;
		    background: linear-gradient(135deg, #4e73df, #1cc88a);
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}

		.login-card {
		    width: 360px;
		    max-width: 90%;
		    background: #ffffff;
		    padding: 32px 28px;
		    border-radius: 14px;
		    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.40);
		    text-align: center;
		}

		.login-card h2 {
		    margin-bottom: 24px;
		    font-weight: 600;
		    color: #333;
		}

		.login-card input {
		    width: 90%;
		    padding: 12px 14px;
			box-shadow: 0 18px 40px rgba(0, 0, 0, 0.20);
			margin: 0 auto 16px auto;
		    margin-bottom: 16px;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		    font-size: 14px;
		}

		.login-card input:focus {
		    border-color: #4e73df;
		    box-shadow: 0 0 0 2px rgba(78, 115, 223, 0.2);
		}


		.login-card button {
		    width: 100%;
		    padding: 12px;
		    border: none;
		    border-radius: 8px;
		    background: #4e73df;
		    color: #fff;
		    font-size: 15px;
		    font-weight: 500;
		    cursor: pointer;
		}

		.login-card button:hover {
		    background: #3b5bdb;
		}

		.login-card p {
		    margin-top: 16px;
		    font-size: 14px;
		}

		.login-card a {
		    color: #4e73df;
		    text-decoration: none;
		    font-weight: 500;
		}


        .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }

        .register-link {
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #4e73df;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-card">
    <h2>SkillScore Login</h2>

    <form action="/login" method="post">
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

    <div class="error">
        ${error}
    </div>

    <div class="register-link">
        Don’t have an account?
        <a href="/register">Register</a>
    </div>
</div>

</body>
</html>
