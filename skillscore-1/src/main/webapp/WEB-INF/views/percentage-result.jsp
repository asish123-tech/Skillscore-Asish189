<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>SkillScore | Result</title>

<style>
body {
    background:#f4f6f9;
    font-family: Arial;
}

.navbar {
    background:#2563eb;
    color:white;
    padding:14px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.container {
    max-width:600px;
    margin:80px auto;
    background:#fff;
    padding:40px;
    border-radius:14px;
    box-shadow:0 12px 25px rgba(0,0,0,0.08);
    text-align:center;
}

.score {
    font-size:48px;
    font-weight:bold;
    color:#2563eb;
}

.timer {
    margin-top:20px;
    font-size:18px;
    color:#555;
}

.btn {
    margin-top:30px;
    padding:12px 30px;
    background:#2563eb;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div style="font-size:20px;font-weight:bold;">SkillScore</div>
    <a href="/quantitative" style="color:white;text-decoration:none;">Home</a>
</div>

<!-- RESULT CARD -->
<div class="container">
    <h2>🎉 Test Completed</h2>

    <p>Your Score</p>
    <div class="score">${score} / ${total}</div>

    <div class="timer">
        Redirecting to dashboard in <span id="countdown">10</span> seconds...
    </div>

    <button class="btn" onclick="goHome()">Go Now</button>
</div>

<script>
let time = 10;
let el = document.getElementById("countdown");

setInterval(() => {
    time--;
    el.innerText = time;
    if(time === 0){
        window.location.href = "/quantitative";
    }
}, 1000);

function goHome(){
    window.location.href = "/quantitative";
}
</script>

</body>
</html>
