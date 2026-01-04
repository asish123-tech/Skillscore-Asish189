<!DOCTYPE html>
<html>
<head>
    <title>DSA Sub Topics</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f9ff;
        }

        .section {
            padding: 20px 24px;
        }

        .section h1 {
            font-size: 38px;
            font-weight: 700;
        }

        .section p {
            font-size: 18px;
            color: #475569;
            margin-bottom: 40px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .topic-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }

        .topic-card h4 {
            font-weight: 700;
            margin-bottom: 10px;
        }

        .topic-card span {
            font-size: 15px;
            color: #64748b;
        }

        .progress {
            height: 8px;
            border-radius: 10px;
            margin: 18px 0;
        }

        .progress-bar {
            background-color: #2563eb;
        }

        .btn-primary {
            border-radius: 10px;
            padding: 8px 22px;
            font-weight: 600;
        }

        .status {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 14px;
        }

        .not-started {
            background: #e2e8f0;
            color: #1e293b;
        }

        .in-progress {
            background: #fef3c7;
            color: #92400e;
        }

        .completed {
            background: #dcfce7;
            color: #166534;
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
			  .navbar a:hover{
				color:grey;
			  }
    </style>
</head>

<body>
	<header class="navbar">
	    <div>SkillScore</div>
	    <a href="/technical"> Back</a>
	</header>

<div class="section">

    <h3>Data Structures & Algorithms</h3>
    <p>Master problem-solving with core DSA concepts</p>

    <div class="card-grid">

        <!-- Arrays -->
        <div class="topic-card">
            <span class="status not-started">Not Started</span>
            <h4>Arrays</h4>
            <span>Traversal, Searching, Sorting</span>

            <div class="progress">
                <div class="progress-bar" style="width: 0%"></div>
            </div>

            <button class="btn btn-primary">Start</button>
        </div>

        <!-- Linked List -->
        <div class="topic-card">
            <span class="status in-progress">In Progress</span>
            <h4>Linked List</h4>
            <span>Singly, Doubly, Circular</span>

            <div class="progress">
                <div class="progress-bar" style="width: 40%"></div>
            </div>

            <button class="btn btn-primary">Resume</button>
        </div>

        <!-- Stack -->
        <div class="topic-card">
            <span class="status not-started">Not Started</span>
            <h4>Stack</h4>
            <span>Operations, Applications</span>

            <div class="progress">
                <div class="progress-bar" style="width: 0%"></div>
            </div>

            <button class="btn btn-primary">Start</button>
        </div>

        <!-- Queue -->
        <div class="topic-card">
            <span class="status completed">Completed</span>
            <h4>Queue</h4>
            <span>Simple, Circular, Deque</span>

            <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
            </div>

            <button class="btn btn-primary">View Result</button>
        </div>

        <!-- Trees -->
        <div class="topic-card">
            <span class="status not-started">Not Started</span>
            <h4>Trees</h4>
            <span>Binary Tree, BST, Traversals</span>

            <div class="progress">
                <div class="progress-bar" style="width: 0%"></div>
            </div>

            <button class="btn btn-primary">Start</button>
        </div>

        <!-- Graphs -->
        <div class="topic-card">
            <span class="status not-started">Not Started</span>
            <h4>Graphs</h4>
            <span>BFS, DFS, Shortest Path</span>

            <div class="progress">
                <div class="progress-bar" style="width: 0%"></div>
            </div>

            <button class="btn btn-primary">Start</button>
        </div>

        <!-- Sorting & Searching -->
        <div class="topic-card">
            <span class="status in-progress">In Progress</span>
            <h4>Sorting & Searching</h4>
            <span>Quick, Merge, Binary Search</span>

            <div class="progress">
                <div class="progress-bar" style="width: 55%"></div>
            </div>

            <button class="btn btn-primary">Resume</button>
        </div>

        <!-- Recursion & DP -->
        <div class="topic-card">
            <span class="status not-started">Not Started</span>
            <h4>Recursion & DP</h4>
            <span>Memoization, Tabulation</span>

            <div class="progress">
                <div class="progress-bar" style="width: 0%"></div>
            </div>

            <button class="btn btn-primary">Start</button>
        </div>

    </div>
</div>

</body>
</html>
