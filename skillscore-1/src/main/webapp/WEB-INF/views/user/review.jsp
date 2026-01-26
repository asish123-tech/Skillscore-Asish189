<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Review Summary</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 40px auto;
            background: #fff;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .circle-wrapper {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        /* Circular progress */
        .progress {
            width: 160px;
            height: 160px;
            background: conic-gradient(#4CAF50 calc(var(--p) * 1%), #ddd 0%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .progress-value {
            font-size: 32px;
            font-weight: 600;
            position: absolute;
        }

        /* Score badge */
        .badge {
            text-align: center;
            margin-top: 20px;
            font-size: 22px;
            font-weight: 600;
        }

        .gold { color: #DAA520; }
        .silver { color: #9E9E9E; }
        .bronze { color: #CD7F32; }
        .fail { color: #E53935; }

        /* Time card */
        .time-card {
            margin: 25px auto;
            width: 50%;
            background: #eef3ff;
            border-left: 5px solid #3f51b5;
            padding: 18px;
            border-radius: 8px;
            font-size: 18px;
            text-align: center;
        }

        /* Results Table */
        table {
            width: 100%;
            margin-top: 40px;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #3f51b5;
            color: #fff;
            text-align: left;
        }

        .tick { color: green; font-size: 22px; }
        .cross { color: red; font-size: 22px; }

        /* Confetti */
        #confetti {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }
    </style>
</head>

<body>

<canvas id="confetti"></canvas>

<div class="container">

    <h2>Test Review</h2>

    <%
        int score = (int) request.getAttribute("score");
        long timeTaken = (long) request.getAttribute("timeTaken"); // milliseconds
        Map<Long,String> answers = (Map<Long,String>) request.getAttribute("answers");

        int total = answers.size();
        double percent = ((double) score / total) * 100;

        long seconds = timeTaken / 1000;
        long minutes = seconds / 60;
        seconds %= 60;

        String rank = "";
        String badgeClass = "";

        if (percent >= 90) { rank = "Gold Performer 🥇"; badgeClass = "gold"; }
        else if (percent >= 70) { rank = "Silver Performer 🥈"; badgeClass = "silver"; }
        else if (percent >= 50) { rank = "Bronze Performer 🥉"; badgeClass = "bronze"; }
        else { rank = "Needs Improvement 🔴"; badgeClass = "fail"; }
    %>

    <!-- Circular Graph -->
    <div class="circle-wrapper">
        <div class="progress" style="--p:<%= percent %>;">
            <div class="progress-value" id="scoreCounter">0%</div>
        </div>
    </div>

    <!-- Rank Badge -->
    <div class="badge <%= badgeClass %>">
        <%= rank %>
    </div>

    <!-- Time Taken -->
    <div class="time-card">
        ⏱ Time Taken: <b><%= minutes %> min <%= seconds %> sec</b>
    </div>

    <!-- Table -->
    <table>
        <tr>
            <th>Q. No</th>
            <th>Your Answer</th>
            <th>Status</th>
        </tr>

        <%
            int i = 1;
            for (Map.Entry<Long,String> e : answers.entrySet()) {
                String userAns = e.getValue();
        %>
            <tr>
                <td><%= i++ %></td>
                <td><%= userAns %></td>
                <td>
                    <% if (userAns != null) { %>
                        ✔ <span class="tick"></span>
                    <% } else { %>
                        ✘ <span class="cross"></span>
                    <% } %>
                </td>
            </tr>
        <% } %>
    </table>

</div>


<script>
    /* Animated score counter */
    let counter = document.getElementById("scoreCounter");
    let target = <%= (int) percent %>;
    let x = 0;

    let interval = setInterval(() => {
        counter.innerHTML = x + "%";
        x++;
        if (x > target) clearInterval(interval);
    }, 20);

    /* Confetti effect for > 80% */
    if (target >= 80) {
        startConfetti();
    }

    /* Simple Confetti Canvas */
    function startConfetti() {
        const canvas = document.getElementById('confetti');
        const ctx = canvas.getContext('2d');
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        const pieces = [];
        for (let i = 0; i < 150; i++) {
            pieces.push({
                x: Math.random() * canvas.width,
                y: Math.random() * canvas.height - canvas.height,
                size: 8,
                speed: Math.random() * 3 + 2
            });
        }

        function draw() {
            ctx.clearRect(0,0,canvas.width,canvas.height);
            pieces.forEach(p => {
                ctx.fillStyle = "hsl(" + Math.random()*360 + ",100%,50%)";
                ctx.fillRect(p.x, p.y += p.speed, p.size, p.size);
                if (p.y > canvas.height) p.y = -20;
            });
            requestAnimationFrame(draw);
        }
        draw();
    }
</script>

</body>
</html>
