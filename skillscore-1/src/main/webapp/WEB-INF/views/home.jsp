<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillScore | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            background: #f5f7fb;
            color: #333;
        }

        /* NAVBAR */
		/* Navbar */
		.dropdown {
		    position: relative;
		}

		.dropdown-menu {
		    position: absolute;
		    top: 35px;
		    left: 0;
		    background: #0b1c3d;
		    border-radius: 8px;
		    padding: 10px 0;
		    min-width: 180px;
		    display: none;
		    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
		}

		.dropdown-menu li {
		    list-style: none;
		}

		.dropdown-menu a {
		    display: block;
		    padding: 10px 18px;
		    color: #fff;
		    font-size: 14px;
		}

		.dropdown-menu a:hover {
		    background: rgba(255,255,255,0.1);
		}

		.dropdown:hover .dropdown-menu {
		    display: block;
		}
		.navbar {
		    position: sticky;
		    top: 0;
		    z-index: 1000;
		    backdrop-filter: blur(12px);
		    background: rgba(15, 23, 42, 0.85);
		    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
		}

		/* Container */
		.nav-container {
		    max-width: 1200px;
		    margin: auto;
		    padding: 16px 24px;
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		}

		/* Logo */
		.logo {
		    font-size: 24px;
		    font-weight: 700;
		    color: #ffffff;
		}
		/* FIX for dropdown navbar menu */
		.nav-menu {
		    display: flex;
		    align-items: center;
		    gap: 20px;
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}

		.nav-menu > li > a {
		    color: #ffffff;
		    text-decoration: none;
		    font-weight: 500;
		    padding: 8px 12px;
		    display: inline-block;
		}

		.nav-menu > li > a:hover {
		    color: #38bdf8;
		}


		/* Links */
		.nav-links {
		    display: flex;
		    align-items: center;
		    gap: 16px;
		}

		/* Buttons */
		.btn-outline {
		    padding: 8px 18px;
		    border-radius: 8px;
		    border: 1px solid #38bdf8;
		    color: #38bdf8;
		    text-decoration: none;
		    font-weight: 500;
		    transition: 0.3s;
		}

		.btn-outline:hover {
		    background: #38bdf8;
		    color: #020617;
		}

		.btn-primary {
		    padding: 8px 18px;
		    border-radius: 8px;
		    background: #38bdf8;
		    color: #020617;
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.3s;
		}

		.btn-primary:hover {
		    background: #0ea5e9;
		}

		/* User Avatar */
		.user-avatar img {
		    width: 38px;
		    height: 38px;
		    border-radius: 50%;
		    cursor: pointer;
		    border: 2px solid #38bdf8;
		}

		/* Hamburger */
		.hamburger {
		    display: none;
		    font-size: 26px;
		    color: white;
		    cursor: pointer;
		}

		/* Mobile Menu */
		.mobile-menu {
		    display: none;
		    flex-direction: column;
		    background: rgba(2, 6, 23, 0.95);
		    padding: 15px;
		}

		.mobile-menu a {
		    color: white;
		    padding: 10px 0;
		    text-decoration: none;
		    font-weight: 500;
		}

		/* Responsive */
		@media (max-width: 768px) {
		    .nav-links {
		        display: none;
		    }

		    .hamburger {
		        display: block;
		    }

		    .mobile-menu.show {
		        display: flex;
		    }
		}

        /* HERO SECTION */
		.hero {
		    min-height: 100vh;
		    display: flex;
		    align-items: center;
		    padding: 0 80px;

		    /* Background Image */
		    background: 
		        linear-gradient(
		            rgba(0, 0, 0, 0.45),
		            rgba(0, 0, 0, 0.45)
		        ),
		        url("/images/home.png");

		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;

		    color: white;
		}


        .hero-text {
            max-width: 50%;
        }

        .hero-text h1 {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .hero-text p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .hero-text button {
            padding: 12px 30px;
            border: none;
            background: #38bdf8;
            color: #000;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .hero-text button:hover {
            background: #0ea5e9;
            color: white;
        }

        .hero img {
            width: 420px;
        }

        /* ABOUT COURSE */
        .section {
            padding: 60px;
        }

        .section h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .course-box {
            display: flex;
            gap: 40px;
        }

        .course-desc {
            width: 60%;
            line-height: 1.8;
        }

        .course-card {
            width: 40%;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .course-card h4 {
            margin-bottom: 10px;
        }

        .course-card button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        /* WHAT YOU WILL LEARN */
        .learn {
            background: #eef2ff;
            text-align: center;
            padding: 60px;
        }

        .learn h2 {
            margin-bottom: 40px;
        }

        .learn-items {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 30px;
        }

        .learn-card {
            background: white;
            width: 220px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.07);
        }

        .learn-card h3 {
            color: #2563eb;
            margin-bottom: 10px;
        }

        /* FOOTER */
        footer {
            background: #0f172a;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }
		

    </style>
</head>

<body>

<!-- NAVBAR -->
<header class="navbar">
    <div class="nav-container">
        <!-- Logo -->
        <div class="logo">SkillScore</div>
		<ul class="nav-menu">
		        <li class="dropdown">
					<a href="#">Aptitude &#9662;</a>


		            <ul class="dropdown-menu">
		                <li><a href="#">Quantitative</a></li>
		                <li><a href="#">Logical Reasoning</a></li>
		                <li><a href="#">Verbal Ability</a></li>
		            </ul>
		        </li>

		        <li class="dropdown">
					<a href="#">Communication &#9662;</a>


		            <ul class="dropdown-menu">
		                <li><a href="#">English Basics</a></li>
		                <li><a href="#">Group Discussion</a></li>
		                <li><a href="#">Interview Speaking</a></li>
		            </ul>
		        </li>

		        <li class="dropdown">
					<a href="#">Technical &#9662;</a>


		            <ul class="dropdown-menu">
		                <li><a href="#">DSA</a></li>
		                <li><a href="#">Core CS</a></li>
		                <li><a href="#">Projects</a></li>
		            </ul>
		        </li>

		        <li class="dropdown">
					<a href="#">HR &#9662;</a>


		            <ul class="dropdown-menu">
		                <li><a href="#">HR Questions</a></li>
		                <li><a href="#">Resume Tips</a></li>
		                <li><a href="#">Mock Interviews</a></li>
		            </ul>
		        </li>
		    </ul>

        <!-- Desktop Menu -->
        <nav class="nav-links">
            <!-- Show only if NOT logged in -->
            <a href="/login" class="btn-outline">Login</a>
            <a href="/register" class="btn-primary">Register</a>

            <!-- Show only if logged in -->
            <!--
            <div class="user-avatar">
                <img src="/images/user.png" alt="User">
            </div>
            -->
        </nav>

        <!-- Mobile Menu Icon -->
        <div class="hamburger" onclick="toggleMenu()">
            ☰
        </div>
    </div>

    <!-- Mobile Menu -->
    <div class="mobile-menu" id="mobileMenu">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </div>
</header>

<script>
function toggleMenu() {
    document.getElementById("mobileMenu").classList.toggle("show");
}
</script>



<!-- HERO -->
<div class="hero">
    <div class="hero-text">
        <h1>Build Skills. Prove Talent. Get Ready.</h1>
        <p>A modern platform to assess, improve, and showcase your skills for placements.</p>
        <button onclick="location.href='/register'">Get Started</button>
    </div>
 </div>

<!-- ABOUT COURSE -->
<div class="section">
    <h2>About SkillScore</h2>
    <div class="course-box">
        <div class="course-desc">
            SkillScore helps students become industry-ready through structured skill assessment,
            real-time feedback, and performance analytics.  
            Improve communication, technical, and problem-solving skills with guided practice.
        </div>

        <div class="course-card">
            <h4>Duration</h4>
            <p>Flexible Learning</p>

            <h4>Format</h4>
            <p>Online Self-Paced</p>

            <h4>Who Can Join?</h4>
            <p>Students & Freshers</p>

            <button>Explore Courses</button>
        </div>
    </div>
</div>

<!-- WHAT YOU WILL LEARN -->
<div class="learn">
    <h2>What You Will Learn</h2>
    <div class="learn-items">
        <div class="learn-card">
            <h3>01</h3>
            <p>Communication & Soft Skills</p>
        </div>
        <div class="learn-card">
            <h3>02</h3>
            <p>Resume & Interview Skills</p>
        </div>
        <div class="learn-card">
            <h3>03</h3>
            <p>Technical Skill Assessment</p>
        </div>
        <div class="learn-card">
            <h3>04</h3>
            <p>Analytics & Performance Tracking</p>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer>
   @ 2025 SkillScore | Build Your Future
</footer>

</body>
</html>
