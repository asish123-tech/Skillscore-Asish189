<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Core Java</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f5f8fd;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ===== NAVBAR ===== */
        .navbar {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 18px 40px;
            color: white;
        }

        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px;
        }

        .page-header h1 {
            font-weight: bold;
        }

        .page-header p {
            color: #64748b;
            font-size: 18px;
        }

        /* ===== CARD GRID ===== */
        .card-grid {
            padding: 0 40px 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        /* ===== CARD ===== */
        .topic-card {
            background: white;
            border-radius: 20px;
            padding: 28px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .badge-status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 12px;
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
            margin-top: 10px;
            font-weight: bold;
        }

        .topic-card p {
            color: #64748b;
        }

        .progress {
            height: 8px;
            margin: 18px 0;
            background: #e5e7eb;
            border-radius: 10px;
        }

        .progress-bar {
            background: #2563eb;
        }

        .btn-primary {
            background: #2563eb;
            border: none;
            padding: 10px 22px;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background: #1e40af;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar d-flex justify-content-between">
    <a class="navbar-brand" href="#">SkillScore</a>
    <a href="technical.jsp" class="back-btn">Back</a>
</div>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>Core Java</h1>
    <p>Build strong Java fundamentals for backend & enterprise development</p>
</div>

<!-- ===== CARD GRID ===== -->
<div class="card-grid">

    <!-- OOPS -->
    <div class="topic-card">
        <span class="badge-status in-progress">In Progress</span>
        <h3>OOP Concepts</h3>
        <p>Encapsulation, Inheritance, Polymorphism, Abstraction</p>
        <div class="progress">
            <div class="progress-bar" style="width: 60%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Collections -->
    <div class="topic-card">
        <span class="badge-status not-started">Not Started</span>
        <h3>Collections Framework</h3>
        <p>List, Set, Map, Queue, Iterators</p>
        <div class="progress">
            <div class="progress-bar" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Exception Handling -->
    <div class="topic-card">
        <span class="badge-status not-started">Not Started</span>
        <h3>Exception Handling</h3>
        <p>Try-catch, Throws, Custom Exceptions</p>
        <div class="progress">
            <div class="progress-bar" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Multithreading -->
    <div class="topic-card">
        <span class="badge-status completed">Completed</span>
        <h3>Multithreading</h3>
        <p>Thread, Runnable, Synchronization</p>
        <div class="progress">
            <div class="progress-bar" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

    <!-- Java 8 -->
    <div class="topic-card">
        <span class="badge-status not-started">Not Started</span>
        <h3>Java 8 Features</h3>
        <p>Lambda, Streams, Functional Interfaces</p>
        <div class="progress">
            <div class="progress-bar" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

</div>

</body>
</html>
