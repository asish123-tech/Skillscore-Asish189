<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quantitative Aptitude | SkillScore</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: #AEDEFC;
            color: #0f172a;
        }

        /* NAVBAR */
        .navbar {
            height: 64px;
            background: #0f172a;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }

        /* CONTAINER */
        .container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 24px;
        }

        h1 {
            margin-bottom: 6px;
        }

        .subtitle {
            color: #475569;
            margin-bottom: 24px;
        }

        /* TOPIC GRID */
        .topic-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .topic-card {
            background: #fff;
            padding: 22px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .topic-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 30px rgba(0,0,0,0.12);
        }

        .topic-card h3 {
            margin-bottom: 6px;
        }

        .topic-card p {
            font-size: 14px;
            color: #475569;
            margin-bottom: 12px;
        }

        /* PROGRESS BAR */
        .progress-bar {
            background: #e5e7eb;
            border-radius: 20px;
            height: 8px;
            margin-bottom: 12px;
            overflow: hidden;
        }

        .progress {
            height: 100%;
            background: #2563eb;
        }

        button {
            background: #2563eb;
            color: #fff;
            border: none;
            padding: 10px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
        }

        button:hover {
            background: #1d4ed8;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back to Aptitude</a>
</header>

<!-- MAIN -->
<div class="container">
    <h1>Quantitative Aptitude</h1>
    <p class="subtitle">Practice core quantitative concepts for placements</p>

    <div class="topic-grid">

        <div class="topic-card">
            <h3>Percentages</h3>
            <p>Basics, increase & decrease</p>

            <div class="progress-bar">
                <div class="progress" style="width: 30%"></div>
            </div>

			<button onclick="startPercentages()">Start</button>

			<script>
			function startPercentages() {
			    window.location.href = "/student/aptitude/percentages";
			}
			</script>

        </div>

        <div class="topic-card">
            <h3>Profit & Loss</h3>
            <p>CP, SP, discounts</p>

            <div class="progress-bar">
                <div class="progress" style="width: 0%"></div>
            </div>

			<button onclick="startProfitLoss()">Start</button>

			<script>
			function startProfitLoss() {
			    window.location.href = "/profit-loss";
			}
			</script>

        </div>

        <div class="topic-card">
            <h3>Time & Work</h3>
            <p>Pipes, work efficiency</p>

            <div class="progress-bar">
                <div class="progress" style="width: 60%"></div>
            </div>

			<button onclick="startTimeWork()">Resume</button>

			<script>
			function startTimeWork() {
			    window.location.href = "/time-work";
			}
			</script>

        </div>

        <div class="topic-card">
            <h3>Time, Speed & Distance</h3>
            <p>Trains, boats, relative speed</p>

            <div class="progress-bar">
                <div class="progress" style="width: 0%"></div>
            </div>

			<button onclick="startTSD()">Start</button>

			<script>
			function startTSD() {
			    window.location.href = "/time-speed-distance";
			}
			</script>

        </div>

    </div>
</div>

</body>
</html>
