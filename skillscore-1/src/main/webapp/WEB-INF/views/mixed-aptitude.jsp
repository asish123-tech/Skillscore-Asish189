<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mixed Aptitude | SkillScore</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Inter',sans-serif; }
        body { background:#AEDEFC; color:#0f172a; }
        .navbar { height:64px; background:#0f172a; color:#fff; display:flex; align-items:center; justify-content:space-between; padding:0 32px; }
        .navbar a { color:#fff; text-decoration:none; font-weight:600; }
        .container { max-width:1200px; margin:30px auto; padding:0 24px; }
        .subtitle { color:#475569; margin-bottom:24px; }
        .grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(280px,1fr)); gap:20px; }
        .card { background:#fff; padding:22px; border-radius:14px; box-shadow:0 8px 20px rgba(0,0,0,0.06); }
        .card p { font-size:14px; color:#475569; margin-bottom:12px; }
        .progress { height:8px; background:#e5e7eb; border-radius:10px; overflow:hidden; margin-bottom:14px; }
        .progress-bar { height:100%; background:#2563eb; }
        button { background:#2563eb; color:#fff; border:none; padding:10px 18px; border-radius:8px; cursor:pointer; }
    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back to Aptitude</a>
</header>

<div class="container">
    <h1>Mixed Aptitude Test</h1>
    <p class="subtitle">Company-level aptitude simulations</p>

    <div class="grid">

        <div class="card">
            <h3>Company Pattern Test</h3>
            <p>Quant + Logical + Verbal</p>
            <div class="progress"><div class="progress-bar" style="width:0%"></div></div>
            <button>Start</button>
        </div>

        <div class="card">
            <h3>Mock Placement Test</h3>
            <p>Real exam experience</p>
            <div class="progress"><div class="progress-bar" style="width:50%"></div></div>
            <button>Resume</button>
        </div>

    </div>
</div>

</body>
</html>
