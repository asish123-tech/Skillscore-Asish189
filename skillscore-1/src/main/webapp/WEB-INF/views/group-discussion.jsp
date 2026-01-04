<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Group Discussion</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f4f6fb;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ===== NAVBAR ===== */
        .navbar {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 16px 30px;
        }

        .navbar-brand {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px 60px 20px;
        }

        .page-header h1 {
            font-size: 40px;
            font-weight: bold;
            color: #111827;
        }

        .page-header p {
            font-size: 18px;
            color: #475569;
            margin-top: 8px;
        }

        /* ===== CARDS GRID ===== */
        .cards {
            padding: 30px 60px 60px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card-box {
            background: white;
            border-radius: 20px;
            padding: 28px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            font-size: 14px;
            border-radius: 20px;
            margin-bottom: 18px;
        }

        .not-started {
            background: #e5e7eb;
            color: #475569;
        }

        .in-progress {
            background: #fef3c7;
            color: #92400e;
        }

        .completed {
            background: #dcfce7;
            color: #166534;
        }

        .card-box h3 {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-box p {
            color: #64748b;
            font-size: 16px;
            margin-bottom: 18px;
        }

        .progress {
            height: 8px;
            border-radius: 10px;
            background: #e5e7eb;
            margin-bottom: 20px;
        }

        .progress-bar {
            background: #2563eb;
            border-radius: 10px;
        }

        .btn-primary {
            background: #2563eb;
            border: none;
            padding: 10px 22px;
            font-size: 16px;
            border-radius: 12px;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar d-flex justify-content-between">
    <div class="navbar-brand">SkillScore</div>
    <a href="communication.jsp">Back</a>
</nav>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>Group Discussion</h1>
    <p>Improve teamwork, leadership, and discussion skills</p>
</div>

<!-- ===== CARDS ===== -->
<div class="cards">

    <!-- Card 1 -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>GD Basics</h3>
        <p>Introduction, rules, and evaluation criteria</p>
        <div class="progress"></div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 2 -->
    <div class="card-box">
        <span class="status in-progress">In Progress</span>
        <h3>Current Affairs Topics</h3>
        <p>Social, political, and economic issues</p>
        <div class="progress">
            <div class="progress-bar" style="width: 55%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Card 3 -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>Abstract Topics</h3>
        <p>Creative and opinion-based discussions</p>
        <div class="progress"></div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 4 -->
    <div class="card-box">
        <span class="status completed">Completed</span>
        <h3>Case Study Discussions</h3>
        <p>Problem-solving and decision-making scenarios</p>
        <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

</div>

</body>
</html>
