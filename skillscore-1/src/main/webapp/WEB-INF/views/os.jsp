<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Operating System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background: #f4f6fb;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 18px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            padding: 40px 50px 20px;
        }

        .page-header h1 {
            font-weight: 700;
        }

        .page-header p {
            color: #475569;
            font-size: 18px;
        }

        /* ===== CARDS ===== */
        .cards {
            padding: 10px 50px 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }

        .card-box {
            background: white;
            border-radius: 20px;
            padding: 28px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 14px;
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

        .card-box h3 {
            font-weight: 700;
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
            border-radius: 10px;
            padding: 10px 22px;
            font-weight: 500;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar-custom">
    <h5>SkillScore</h5>
    <a href="technical">Back</a>
</div>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>Operating Systems</h1>
    <p>Understand process management, memory, and OS internals</p>
</div>

<!-- ===== SUBTOPICS ===== -->
<div class="cards">

    <!-- Process Management -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>Process Management</h3>
        <p>Process states, PCB, context switching</p>
        <div class="progress">
            <div class="progress-bar bg-secondary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- CPU Scheduling -->
    <div class="card-box">
        <span class="status in-progress">In Progress</span>
        <h3>CPU Scheduling</h3>
        <p>FCFS, SJF, Priority, Round Robin</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width: 55%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Deadlocks -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>Deadlocks</h3>
        <p>Deadlock conditions, prevention, avoidance</p>
        <div class="progress">
            <div class="progress-bar bg-secondary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Memory Management -->
    <div class="card-box">
        <span class="status completed">Completed</span>
        <h3>Memory Management</h3>
        <p>Paging, segmentation, virtual memory</p>
        <div class="progress">
            <div class="progress-bar bg-success" style="width: 100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

    <!-- File Systems -->
    <div class="card-box">
        <span class="status not-started">Not Started</span>
        <h3>File Systems</h3>
        <p>File allocation, directories, disk scheduling</p>
        <div class="progress">
            <div class="progress-bar bg-secondary" style="width: 0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

</div>

</body>
</html>
