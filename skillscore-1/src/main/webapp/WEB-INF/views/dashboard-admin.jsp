<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillScore | Admin Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            margin: 0;
            background: #f4f6fb;
            font-family: 'Segoe UI', sans-serif;
        }

        .wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #0f172a, #020617);
            color: white;
            padding: 20px;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .menu-item {
            margin-bottom: 10px;
        }

        .menu-btn {
            width: 100%;
            background: none;
            border: none;
            color: #e5e7eb;
            text-align: left;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
        }

        .menu-btn:hover {
            background: rgba(255,255,255,0.1);
        }

        .submenu {
            margin-left: 15px;
            display: none;
        }

        .submenu a {
            display: block;
            color: #cbd5f5;
            padding: 8px;
            font-size: 14px;
            text-decoration: none;
        }

        .submenu a:hover {
            color: white;
        }

        /* ===== MAIN CONTENT ===== */
        .content {
            flex: 1;
            padding: 30px;
        }

        .topbar {
            background: white;
            padding: 15px 25px;
            border-radius: 12px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .card-box {
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        .card-box h2 {
            color: #2563eb;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .card-box p {
            margin: 0;
            color: #6b7280;
        }

        /* ===== CHART SECTION ===== */
        .charts {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }

        .chart-box {
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        .chart-box h5 {
            margin-bottom: 20px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="wrapper">

    <!-- ===== SIDEBAR ===== -->
    <div class="sidebar">
        <div class="brand">SkillScore</div>

        <div class="menu-item">
            <button class="menu-btn" onclick="toggleMenu('aptitude')">Aptitude</button>
            <div class="submenu" id="aptitude">
                <a href="/admin/subtopics?topicId=5">Quantitative Aptitude</a>
                <a href="/admin/subtopics?topicId=6">Logical Reasoning</a>
                <a href="/admin/subtopics?topicId=7">Verbal Ability</a>
				<a href="/admin/subtopics?topicId=8">Mixed Aptitude Test</a>
				
            </div>
        </div>

        <div class="menu-item">
            <button class="menu-btn" onclick="toggleMenu('technical')">Technical</button>
            <div class="submenu" id="technical">
                <a href="/admin/subtopics?topicId=9">Data Structures & Algorithms</a>
                <a href="/admin/subtopics?topicId=10">Core Java</a>
                <a href="/admin/subtopics?topicId=11">DBMS & SQL</a>
				<a href="/admin/subtopics?topicId=12">Operating Systems</a>
				<a href="/admin/subtopics?topicId=13">Computer Networks</a>
				
            </div>
        </div>

        <div class="menu-item">
            <button class="menu-btn" onclick="toggleMenu('communication')">Communication</button>
            <div class="submenu" id="communication">
                <a href="/admin/subtopics?topicId=2">Basic Communication</a>
                <a href="/admin/subtopics?topicId=3">Group Discussion</a>
				<a href="/admin/subtopics?topicId=1">Public Speaking</a>



				<a href="/admin/subtopics?topicId=4">Professional Email Writing</a>
				
            </div>
        </div>

        <div class="menu-item">
            <button class="menu-btn" onclick="toggleMenu('hr')">HR</button>
            <div class="submenu" id="hr">
                <a href="/admin/subtopics?topicId=14">HR Interview Basics</a>
                <a href="/admin/subtopics?topicId=15">Behavioral Questions</a>
				<a href="/admin/subtopics?topicId=16">Company Fit Questions</a>
				
            </div>
        </div>

        <div class="menu-item">
            <a href="/logout" class="menu-btn text-danger">Logout</a>
        </div>
    </div>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="content">

        <div class="topbar">
            <h4>Admin Dashboard</h4>
            <span>Admin</span>
        </div>

        <!-- STAT CARDS -->
		<div class="cards">
		    <div class="card-box">
		        <h2>${totalQuestions}</h2>
		        <p>Total Questions</p>
		    </div>
		    <div class="card-box">
		        <h2>${totalStudents}</h2>
		        <p>Total Students</p>
		    </div>
		    <div class="card-box">
		        <h2>${totalTests}</h2>
		        <p>Tests Completed</p>
		    </div>
		    <div class="card-box">
		        <h2>${averageScore}%</h2>
		        <p>Average Score</p>
		    </div>
		</div>


        <!-- CHARTS -->
        <div class="charts">

            <div class="chart-box">
                <h5>Average Performance</h5>
                <canvas id="pieChart"></canvas>
            </div>

            <div class="chart-box">
                <h5>Questions Distribution by Category</h5>
                <canvas id="barChart"></canvas>
            </div>

        </div>

    </div>
</div>

<script>
    function toggleMenu(id) {
        const menu = document.getElementById(id);
        menu.style.display = menu.style.display === "block" ? "none" : "block";
    }

    // Pie Chart
    new Chart(document.getElementById('pieChart'), {
        type: 'pie',
        data: {
            labels: ['Aptitude', 'Technical', 'Communication', 'HR'],
            datasets: [{
                data: [40, 35, 15, 10],
                backgroundColor: ['#2563eb', '#22c55e', '#f59e0b', '#ef4444']
            }]
        }
    });

    // Bar Chart
    new Chart(document.getElementById('barChart'), {
        type: 'bar',
        data: {
            labels: ['Aptitude', 'Technical', 'Communication', 'HR'],
            datasets: [{
                label: 'Tests',
                data: [120, 80, 25, 15],
                backgroundColor: '#2563eb'
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>

</body>
</html>
