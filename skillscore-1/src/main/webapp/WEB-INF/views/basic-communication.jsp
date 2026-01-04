<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Basic Communication</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f6f9fc;
        }

        /* ===== NAVBAR ===== */
        .navbar {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 18px 40px;
        }

        .navbar-brand {
            color: #fff;
            font-size: 22px;
            font-weight: 700;
            text-decoration: none;
        }

        .navbar a.back-btn {
            color: #fff;
            font-weight: 500;
            text-decoration: none;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px;
        }

        .page-header h1 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .page-header p {
            font-size: 18px;
            color: #475569;
        }

        /* ===== CARDS GRID ===== */
        .cards {
            padding: 20px 40px 60px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .topic-card {
            background: #fff;
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .not-started {
            background: #e2e8f0;
            color: #334155;
        }

        .in-progress {
            background: #fef3c7;
            color: #92400e;
        }

        .completed {
            background: #dcfce7;
            color: #166534;
        }

        .topic-card h3 {
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .topic-card p {
            color: #64748b;
            margin-bottom: 18px;
        }

        .progress {
            height: 8px;
            border-radius: 8px;
            background: #e5e7eb;
            margin-bottom: 20px;
        }

        .progress-bar {
            background: #2563eb;
            border-radius: 8px;
        }

        .action-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 26px;
            border-radius: 12px;
            font-weight: 600;
        }

        .action-btn:hover {
            background: #1e40af;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar d-flex justify-content-between">
    <a class="navbar-brand" href="#">SkillScore</a>
    <a href="communication.jsp" class="back-btn">Back</a>
</nav>

<!-- ===== PAGE HEADER ===== -->
<div class="page-header">
    <h1>Basic Communication</h1>
    <p>Improve your spoken, written, and interpersonal communication skills</p>
</div>

<!-- ===== CARDS ===== -->
<div class="cards">

    <!-- Card 1 -->
    <div class="topic-card">
        <span class="status in-progress">In Progress</span>
        <h3>Introduction & Self-Presentation</h3>
        <p>Greetings, self-introduction, confidence building</p>

        <div class="progress">
            <div class="progress-bar" style="width: 60%"></div>
        </div>

        <button class="action-btn">Resume</button>
    </div>

    <!-- Card 2 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Active Listening</h3>
        <p>Listening skills, understanding & responding</p>

        <div class="progress">
            <div class="progress-bar" style="width: 0%"></div>
        </div>

        <button class="action-btn">Start</button>
    </div>

    <!-- Card 3 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Body Language</h3>
        <p>Posture, gestures, eye contact</p>

        <div class="progress">
            <div class="progress-bar" style="width: 0%"></div>
        </div>

        <button class="action-btn">Start</button>
    </div>

    <!-- Card 4 -->
    <div class="topic-card">
        <span class="status completed">Completed</span>
        <h3>Basic Vocabulary</h3>
        <p>Daily usage words, clarity & fluency</p>

        <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
        </div>

        <button class="action-btn">View Result</button>
    </div>

</div>

</body>
</html>
