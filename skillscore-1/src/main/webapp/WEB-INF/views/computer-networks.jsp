<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Computer Networks</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f7fb;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: linear-gradient(90deg, #0f172a, #020617);
            padding: 16px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-custom h5 {
            margin: 0;
            font-weight: 600;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .back-btn:hover {
            text-decoration: underline;
        }

        /* ===== PAGE HEADER ===== */
        .page-header {
            padding: 40px 50px 20px;
        }

        .page-header h1 {
            font-size: 36px;
            font-weight: 700;
        }

        .page-header p {
            color: #64748b;
            font-size: 18px;
        }

        /* ===== CARDS GRID ===== */
        .cards {
            padding: 20px 50px 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .topic-card {
            background: white;
            padding: 30px;
            border-radius: 22px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
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

        .topic-card h3 {
            font-size: 26px;
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
            padding: 10px 22px;
            border-radius: 10px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar-custom">
    <h5>SkillScore</h5>
    <a href="technical" class="back-btn">Back</a>
</div>

<!-- ===== HEADER ===== -->
<div class="page-header">
    <h1>Computer Networks</h1>
    <p>Understand networking fundamentals & protocols</p>
</div>

<!-- ===== SUB TOPICS ===== -->
<div class="cards">

    <!-- OSI Model -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>OSI Model</h3>
        <p>7 layers, functions & examples</p>
        <div class="progress">
            <div class="progress-bar" style="width:0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- TCP/IP -->
    <div class="topic-card">
        <span class="status in-progress">In Progress</span>
        <h3>TCP/IP Model</h3>
        <p>TCP vs UDP, ports, handshakes</p>
        <div class="progress">
            <div class="progress-bar bg-primary" style="width:45%"></div>
        </div>
        <button class="btn btn-primary">Resume</button>
    </div>

    <!-- Network Devices -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Network Devices</h3>
        <p>Router, Switch, Hub, Bridge</p>
        <div class="progress">
            <div class="progress-bar" style="width:0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- IP Addressing -->
    <div class="topic-card">
        <span class="status completed">Completed</span>
        <h3>IP Addressing</h3>
        <p>IPv4, IPv6, subnetting</p>
        <div class="progress">
            <div class="progress-bar bg-success" style="width:100%"></div>
        </div>
        <button class="btn btn-primary">View Result</button>
    </div>

    <!-- Protocols -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Protocols</h3>
        <p>HTTP, HTTPS, FTP, SMTP, DNS</p>
        <div class="progress">
            <div class="progress-bar" style="width:0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

    <!-- Network Security -->
    <div class="topic-card">
        <span class="status not-started">Not Started</span>
        <h3>Network Security</h3>
        <p>Firewalls, encryption, attacks</p>
        <div class="progress">
            <div class="progress-bar" style="width:0%"></div>
        </div>
        <button class="btn btn-primary">Start</button>
    </div>

</div>

</body>
</html>
