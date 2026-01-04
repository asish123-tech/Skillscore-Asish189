<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | DBMS & SQL</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6fb;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 16px 40px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-custom h5 {
            margin: 0;
            font-weight: bold;
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
            font-weight: 700;
        }

        .page-header p {
            color: #64748b;
            font-size: 18px;
        }

        /* ===== CARD GRID ===== */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
            padding: 0 40px 50px;
        }

        .topic-card {
            background: white;
            padding: 28px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
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
            margin-bottom: 8px;
        }

        .topic-card p {
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
            padding: 10px 26px;
            border-radius: 10px;
            font-weight: 500;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar-custom">
    <h5>SkillScore</h5>
    <a href="technical.jsp" class="back-btn">Back</a>
</div>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>DBMS & SQL</h1>
    <p>Master database concepts for interviews & real-world applications</p>
</div>

<!-- ===== CARDS ===== -->
<div class="card-grid">

    <!-- Card 1 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>DBMS Basics</h3>
        <p>Data, Database, DBMS, RDBMS</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 2 -->
    <div class="topic-card">
        <span class="status in-progress">In Progress</span>
        <h3>Normalization</h3>
        <p>1NF, 2NF, 3NF, BCNF</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 45%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Card 3 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>SQL Queries</h3>
        <p>SELECT, WHERE, GROUP BY, HAVING</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 4 -->
    <div class="topic-card">
        <span class="status completed">Completed</span>
        <h3>Joins</h3>
        <p>INNER, LEFT, RIGHT, FULL</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

    <!-- Card 5 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Indexes & Keys</h3>
        <p>Primary, Foreign, Unique, Indexes</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Card 6 -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Transactions</h3>
        <p>ACID, Commit, Rollback</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

</div>

</body>
</html>
