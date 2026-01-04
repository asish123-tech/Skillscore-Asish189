<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logical Reasoning | SkillScore</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background:#AEDEFC;
            color: #0f172a;
        }

        /* NAVBAR */
        .navbar {
            height: 64px;
            background: #0f172a;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }

        /* MAIN */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 24px;
        }

        h1 {
            margin-bottom: 6px;
        }

        .subtitle {
            color: #475569;
            margin-bottom: 24px;
        }

        /* CARDS */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .card {
            background: #fff;
            padding: 22px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
        }

        .card h3 {
            margin-bottom: 6px;
        }

        .card p {
            font-size: 14px;
            color: #475569;
            margin-bottom: 12px;
        }

        .progress {
            height: 8px;
            background: #e5e7eb;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 14px;
        }

        .progress-bar {
            height: 100%;
            background: #2563eb;
        }

        button {
            background: #2563eb;
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
        }

        button:hover {
            background: #1d4ed8;
        }
    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back to Aptitude</a>
</header>

<div class="container">
    <h1>Logical Reasoning</h1>
    <p class="subtitle">Improve analytical and problem-solving skills</p>

    <div class="grid">

        <div class="card">
            <h3>Blood Relations</h3>
            <p>Family tree based questions</p>
            <div class="progress"><div class="progress-bar" style="width: 20%"></div></div>
            <button>Start</button>
        </div>

        <div class="card">
            <h3>Series & Patterns</h3>
            <p>Number & letter series</p>
            <div class="progress"><div class="progress-bar" style="width: 0%"></div></div>
            <button>Start</button>
        </div>

        <div class="card">
            <h3>Puzzles</h3>
            <p>Seating, floor & arrangement puzzles</p>
            <div class="progress"><div class="progress-bar" style="width: 40%"></div></div>
            <button>Resume</button>
        </div>

        <div class="card">
            <h3>Syllogism</h3>
            <p>Logical deduction questions</p>
            <div class="progress"><div class="progress-bar" style="width: 0%"></div></div>
            <button>Start</button>
        </div>

    </div>
</div>

</body>
</html>
