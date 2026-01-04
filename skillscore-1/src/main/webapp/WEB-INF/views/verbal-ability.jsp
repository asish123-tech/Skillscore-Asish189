<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verbal Ability | SkillScore</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        <%-- SAME STYLE AS ABOVE --%>
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
    <h1>Verbal Ability</h1>
    <p class="subtitle">Strengthen English and communication skills</p>

    <div class="grid">

        <div class="card">
            <h3>Reading Comprehension</h3>
            <p>Passage-based questions</p>
            <div class="progress"><div class="progress-bar" style="width:30%"></div></div>
            <button>Resume</button>
        </div>

        <div class="card">
            <h3>Grammar</h3>
            <p>Tenses, voice, speech</p>
            <div class="progress"><div class="progress-bar" style="width:0%"></div></div>
            <button>Start</button>
        </div>

        <div class="card">
            <h3>Vocabulary</h3>
            <p>Synonyms, antonyms</p>
            <div class="progress"><div class="progress-bar" style="width:60%"></div></div>
            <button>Resume</button>
        </div>

        <div class="card">
            <h3>Error Detection</h3>
            <p>Sentence correction</p>
            <div class="progress"><div class="progress-bar" style="width:0%"></div></div>
            <button>Start</button>
        </div>

    </div>
</div>

</body>
</html>
