<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SkillScore</title>

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
		    overflow: hidden;
		}


        .splash-container {
            text-align: center;
            color: white;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Logo */
        .logo {
            width: 130px;
            height: auto;
            margin-bottom: 20px;
            animation: float 2.8s ease-in-out infinite;
        }

        h1 {
            font-size: 46px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .tagline {
            font-size: 18px;
            opacity: 0.9;
            margin-top: 8px;
            letter-spacing: 1px;
        }

        /* Loading dots */
        .loader {
            margin-top: 35px;
        }

        .dot {
            height: 10px;
            width: 10px;
            margin: 0 5px;
            background-color: #ffffff;
            border-radius: 50%;
            display: inline-block;
            animation: bounce 1.4s infinite both;
        }

        .dot:nth-child(1) { animation-delay: 0s; }
        .dot:nth-child(2) { animation-delay: 0.2s; }
        .dot:nth-child(3) { animation-delay: 0.4s; }

        /* Animations */
        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-12px); }
            100% { transform: translateY(0); }
        }

        @keyframes bounce {
            0%, 80%, 100% {
                transform: scale(0);
            }
            40% {
                transform: scale(1);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>

<body>

<div class="splash-container">

    <!-- LOGO IMAGE -->
    <img src="${pageContext.request.contextPath}/resources/images/skillscore-logo.png"
         alt="SkillScore Logo"
         class="logo"/>

    <h1>SkillScore</h1>
    <p class="tagline">Measure Skills | Build Futures.</p>

    <!-- LOADING ANIMATION -->
    <div class="loader">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>

<script>
    setTimeout(() => {
        window.location.href = "${pageContext.request.contextPath}/home";
    }, 5000);
</script>

</body>
</html>
