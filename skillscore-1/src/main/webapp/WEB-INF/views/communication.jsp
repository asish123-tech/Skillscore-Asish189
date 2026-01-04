<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Communication Skills | SkillScore</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: #f4f6fb;
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

        /* CONTAINER */
        .container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 24px;
        }

        h1 {
            margin-bottom: 6px;
        }

        p.subtitle {
            color: #475569;
            margin-bottom: 24px;
        }

        /* TEST LIST */
        .test-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .test-card {
            background: #fff;
            padding: 22px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .test-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.12);
        }

        .test-card h3 {
            margin-bottom: 8px;
        }

        .test-card p {
            font-size: 14px;
            color: #475569;
            margin-bottom: 12px;
        }

        .status {
            display: inline-block;
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 20px;
            margin-bottom: 14px;
        }

        .not-started {
            background: #e2e8f0;
            color: #334155;
        }

        .completed {
            background: #dcfce7;
            color: #166534;
        }

        .in-progress {
            background: #fef3c7;
            color: #92400e;
        }

        .test-card button {
            background: #2563eb;
            color: #fff;
            border: none;
            padding: 10px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
        }

        .test-card button:hover {
            background: #1d4ed8;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<header class="navbar">
    <div>SkillScore</div>
    <a href="/student/dashboard">← Back to Dashboard</a>
</header>

<!-- MAIN -->
<div class="container">
    <h1>Communication Skills</h1>
    <p class="subtitle">Improve speaking, listening, and professional communication</p>

    <div class="test-grid">

        <div class="test-card">
            <span class="status not-started">Not Started</span>
            <h3>Basic Communication</h3>
            <p>Sentence formation, clarity, tone</p>
            <a href ="basic-communication"><button>Start</button></a>
        </div>

        <div class="test-card">
            <span class="status in-progress">In Progress</span>
            <h3>Group Discussion</h3>
            <p>Ideas, confidence, interaction skills</p>
            <a href ="group-discussion"><button>Resume</button></a>
        </div>

        <div class="test-card">
            <span class="status not-started">Not Started</span>
            <h3>Public Speaking</h3>
            <p>Speech delivery and confidence building</p>
            <a href ="public-speaking"><button>Start</button></a>
        </div>

        <div class="test-card">
            <span class="status completed">Completed</span>
            <h3>Professional Email Writing</h3>
            <p>Formal emails & workplace etiquette</p>
            <a href ="p-email"><button>View Result</button></a>
        </div>

    </div>
</div>

</body>
</html>
