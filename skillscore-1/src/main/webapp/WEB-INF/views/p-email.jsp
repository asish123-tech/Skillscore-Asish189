<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Professional Email Writing</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f6f9fc;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: linear-gradient(90deg, #020617, #0f172a);
            padding: 18px 40px;
            color: white;
        }

        .navbar-custom h4 {
            margin: 0;
            font-weight: bold;
        }

        .back-link {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px;
        }

        .page-header h1 {
            font-size: 40px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .page-header p {
            font-size: 18px;
            color: #475569;
        }

        /* ===== CARDS GRID ===== */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 0 40px 60px;
        }

        .card-box {
            background: white;
            border-radius: 20px;
            padding: 28px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 15px;
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

        .card-box h3 {
            font-weight: bold;
            margin-bottom: 8px;
        }

        .card-box p {
            color: #64748b;
            margin-bottom: 16px;
        }

        .progress {
            height: 8px;
            border-radius: 10px;
            margin-bottom: 18px;
        }

        .btn-primary {
            background: #2563eb;
            border: none;
            padding: 10px 24px;
            border-radius: 10px;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar-custom d-flex justify-content-between align-items-center">
    <h4>SkillScore</h4>
    <a href="communication.jsp" class="back-link">Back</a>
</div>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>Professional Email Writing</h1>
    <p>Write clear, formal, and effective emails for workplace communication</p>
</div>

<!-- ===== CARDS ===== -->
<div class="cards">

    <!-- Card 1 -->
    <div class="card-box">
        <span class="status completed">Completed</span>
        <h3>Email Basics</h3>
        <p>Subject line, greeting, body, closing</p>
        <div class="progress">
            <div class="progress-bar bg-success" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

    <!-- Card 2 -->
    <div class="card-box">
        <span class="status in-progress">In Progress</span>
        <h3>Formal & Informal Emails</h3>
        <p>Professional tone vs casual tone</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 55%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Card 3 -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>Job & HR Emails</h3>
        <p>Leave, follow-up, interview emails</p>
        <div class="progress">
            <div class="progress-bar bg-secondary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 4 -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>Error-Free Writing</h3>
        <p>Grammar, clarity, and etiquette</p>
        <div class="progress">
            <div class="progress-bar bg-secondary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

</div>

</body>
</html>
