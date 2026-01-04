<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Public Speaking</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f5f8fd;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: linear-gradient(90deg, #020617, #0f172a);
            padding: 18px 30px;
            color: white;
        }

        .navbar-custom h5 {
            margin: 0;
            font-weight: bold;
        }

        .navbar-custom a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px 40px 20px;
        }

        .page-header h1 {
            font-weight: 700;
            font-size: 36px;
        }

        .page-header p {
            color: #475569;
            font-size: 18px;
            margin-top: 8px;
        }

        /* ===== CARDS GRID ===== */
        .cards {
            padding: 20px 40px 40px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .topic-card {
            background: white;
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .not-started {
            background: #e2e8f0;
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

        .topic-card h3 {
            font-weight: 700;
            margin-bottom: 10px;
        }

        .topic-card p {
            color: #64748b;
            margin-bottom: 15px;
        }

        .progress {
            height: 8px;
            border-radius: 10px;
            margin-bottom: 18px;
        }

        .btn-primary {
            border-radius: 12px;
            padding: 10px 22px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar-custom d-flex justify-content-between align-items-center">
    <h5>SkillScore</h5>
    <a href="communication.jsp">Back</a>
</div>

<!-- ===== PAGE HEADER ===== -->
<div class="page-header">
    <h1>Public Speaking</h1>
    <p>Build confidence and deliver impactful speeches</p>
</div>

<!-- ===== TOPIC CARDS ===== -->
<div class="cards">

    <!-- Card 1 -->
    <div class="topic-card">
        <span class="status in-progress">In Progress</span>
        <h3>Speech Structure</h3>
        <p>Introduction, Body, Conclusion</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 55%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Card 2 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Voice Modulation</h3>
        <p>Pitch, Tone, Pace, Clarity</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 3 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Body Language</h3>
        <p>Posture, Gestures, Eye Contact</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 4 -->
    <div class="topic-card">
        <span class="status completed">Completed</span>
        <h3>Overcoming Stage Fear</h3>
        <p>Confidence building techniques</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View</button>
    </div>

</div>

</body>
</html>
