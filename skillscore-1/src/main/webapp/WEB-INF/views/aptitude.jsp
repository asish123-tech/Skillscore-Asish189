<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Aptitude Tests | SkillScore</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body { background: #9CC6DB; color: #0f172a; }

        .navbar { height: 64px; background: #0f172a; color: #fff; display: flex;
                  align-items: center; justify-content: space-between; padding: 0 32px; }

        .navbar a { color: #fff; text-decoration: none; font-weight: 600; }

        .container { max-width: 1100px; margin: 30px auto; padding: 0 24px; }

        h1 { margin-bottom: 6px; }

        p.subtitle { color: #475569; margin-bottom: 24px; }

        .test-grid { display: grid;
                     grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 20px; }

        .test-card { background: #fff; padding: 22px; border-radius: 14px;
                     box-shadow: 0 8px 20px rgba(0,0,0,0.06);
                     transition: transform 0.3s ease, box-shadow 0.3s ease; }

        .test-card:hover { transform: translateY(-6px);
                           box-shadow: 0 14px 30px rgba(0,0,0,0.12); }

        .status { display: inline-block; font-size: 12px; padding: 4px 10px;
                  border-radius: 20px; margin-bottom: 14px; }

        .not-started { background: #e2e8f0; color: #334155; }
        .completed   { background: #dcfce7; color: #166534; }
        .in-progress { background: #fef3c7; color: #92400e; }

        .btn { display: inline-block; background: #2563eb; color: #fff; padding: 10px 16px;
               border-radius: 8px; font-weight: 500; text-decoration: none; }

        .btn:hover { background: #1d4ed8; }
    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
    <a href="/student/dashboard">← Back to Dashboard</a>
</header>

<div class="container">
    <h1>Aptitude Tests</h1>
    <p class="subtitle">Practice quantitative, logical, and verbal aptitude</p>

    <div class="test-grid">

        <!-- QUANTITATIVE -->
        <div class="test-card">

            <c:choose>
                <c:when test="${statusMap.quantitative == 'COMPLETED'}">
                    <span class="status completed">Completed</span>
                </c:when>
                <c:when test="${statusMap.quantitative == 'IN_PROGRESS'}">
                    <span class="status in-progress">In Progress</span>
                </c:when>
                <c:otherwise>
                    <span class="status not-started">Not Started</span>
                </c:otherwise>
            </c:choose>

            <h3>Quantitative Aptitude</h3>
            <p>Percentages, profit & loss, time & work</p>

            <c:choose>
                <c:when test="${statusMap.quantitative == 'COMPLETED'}">
                    <a href="quantitative/result" class="btn">View Result</a>
                </c:when>
                <c:when test="${statusMap.quantitative == 'IN_PROGRESS'}">
                    <a href="quantitative/resume" class="btn">Resume</a>
                </c:when>
                <c:otherwise>
                    <a href="quantitative" class="btn">Start Test</a>
                </c:otherwise>
            </c:choose>

        </div>

        <!-- LOGICAL -->
        <div class="test-card">

            <c:choose>
                <c:when test="${statusMap.logical == 'COMPLETED'}">
                    <span class="status completed">Completed</span>
                </c:when>
                <c:when test="${statusMap.logical == 'IN_PROGRESS'}">
                    <span class="status in-progress">In Progress</span>
                </c:when>
                <c:otherwise>
                    <span class="status not-started">Not Started</span>
                </c:otherwise>
            </c:choose>

            <h3>Logical Reasoning</h3>
            <p>Blood relations, puzzles, series</p>

            <c:choose>
                <c:when test="${statusMap.logical == 'COMPLETED'}">
                    <a href="logical/result" class="btn">View Result</a>
                </c:when>
                <c:when test="${statusMap.logical == 'IN_PROGRESS'}">
                    <a href="logical/resume" class="btn">Resume</a>
                </c:when>
                <c:otherwise>
                    <a href="logical" class="btn">Start Test</a>
                </c:otherwise>
            </c:choose>

        </div>

        <!-- VERBAL -->
        <div class="test-card">

            <c:choose>
                <c:when test="${statusMap.verbal == 'COMPLETED'}">
                    <span class="status completed">Completed</span>
                </c:when>
                <c:when test="${statusMap.verbal == 'IN_PROGRESS'}">
                    <span class="status in-progress">In Progress</span>
                </c:when>
                <c:otherwise>
                    <span class="status not-started">Not Started</span>
                </c:otherwise>
            </c:choose>

            <h3>Verbal Ability</h3>
            <p>Grammar, comprehension, vocabulary</p>

            <c:choose>
                <c:when test="${statusMap.verbal == 'COMPLETED'}">
                    <a href="verbal/result" class="btn">View Result</a>
                </c:when>
                <c:when test="${statusMap.verbal == 'IN_PROGRESS'}">
                    <a href="verbal/resume" class="btn">Resume</a>
                </c:when>
                <c:otherwise>
                    <a href="verbal" class="btn">Start Test</a>
                </c:otherwise>
            </c:choose>

        </div>

        <!-- MIXED -->
        <div class="test-card">

            <c:choose>
                <c:when test="${statusMap.mixed == 'COMPLETED'}">
                    <span class="status completed">Completed</span>
                </c:when>
                <c:when test="${statusMap.mixed == 'IN_PROGRESS'}">
                    <span class="status in-progress">In Progress</span>
                </c:when>
                <c:otherwise>
                    <span class="status not-started">Not Started</span>
                </c:otherwise>
            </c:choose>

            <h3>Mixed Aptitude Test</h3>
            <p>Company-level aptitude questions</p>

            <c:choose>
                <c:when test="${statusMap.mixed == 'COMPLETED'}">
                    <a href="mixed/result" class="btn">View Result</a>
                </c:when>
                <c:when test="${statusMap.mixed == 'IN_PROGRESS'}">
                    <a href="mixed/resume" class="btn">Resume</a>
                </c:when>
                <c:otherwise>
                    <a href="mixed" class="btn">Start Test</a>
                </c:otherwise>
            </c:choose>

        </div>

    </div>
</div>

</body>
</html>
