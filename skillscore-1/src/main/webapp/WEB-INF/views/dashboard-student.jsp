<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard | SkillScore</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Inter',sans-serif;}
body{background:#f4f6fb;color:#0f172a;}

/* NAVBAR */
/* Modern Done Button */
.avatar-box button {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: #fff;
    border: none;
    padding: 10px 22px;
    border-radius: 999px; /* pill shape */
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 6px 18px rgba(37, 99, 235, 0.35);
}

.avatar-box button:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(37, 99, 235, 0.45);
}

.avatar-box button:active {
    transform: scale(0.96);
}

.dashboard-navbar{
height:64px;
background:#0f172a;
color:#fff;
display:flex;
align-items:center;
justify-content:space-between;
padding:0 32px;
}

.nav-left{font-size:20px;font-weight:700;}
.nav-right{display:flex;align-items:center;gap:14px;}

.avatar-wrapper{position:relative;cursor:pointer;}
.avatar{
width:36px;
height:36px;
border-radius:50%;
}

.avatar-menu{
position:absolute;
right:0;
top:48px;
background:#fff;
border-radius:10px;
box-shadow:0 10px 30px rgba(0,0,0,.15);
width:160px;
display:none;
overflow:hidden;
z-index:999;
}

.avatar-menu.show{display:block;}

.avatar-menu a{
display:block;
padding:12px 16px;
font-size:14px;
color:#0f172a;
text-decoration:none;
}

.avatar-menu a:hover{background:#f1f5f9;}

/* MAIN */
.dashboard-container{max-width:1200px;margin:30px auto;padding:0 24px;}

.welcome-box{
background:linear-gradient(135deg,#2563eb,#1e40af);
color:#fff;
padding:30px;
border-radius:16px;
margin-bottom:30px;
}

.stats-grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
gap:20px;
margin-bottom:30px;
}

.stat-card{
background:#fff;

padding:24px;
border-radius:14px;
text-align:center;
box-shadow:0 8px 20px rgba(0,0,0,.05);
transition:.3s;
cursor:pointer;
}
.stat-card h2{
	color:#338BA8;
}
.action-card{
background:#fff;
padding:24px;
border-radius:14px;
text-align:center;
box-shadow:0 8px 20px rgba(0,0,0,.05);
transition:.3s;
cursor:pointer;
}

.stat-card:hover,.action-card:hover{
transform:translateY(-8px);
box-shadow:0 15px 35px rgba(0,0,0,.15);
}

.action-grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:20px;
margin-bottom:30px;
}
.action-card p{
	padding:6px 10px;
}
.action-card button:hover{
	background: #1E5162;
	
}

.action-card button{
background:#338BA8;
color:#fff;
border:none;
padding:6px 16px;
border-radius:8px;
cursor:pointer;
box-shadow:0px 9px 20px rgba(0,0,0,.2);

}

.activity-box{
background:#fff;
padding:24px;
border-radius:14px;
box-shadow:0 8px 20px rgba(0,0,0,.05);
}

/* AVATAR MODAL */
.avatar-modal{
position:fixed;
inset:0;
background:rgba(0,0,0,.4);
display:none;
align-items:center;
justify-content:center;
}

.avatar-box{
background:#fff;
padding:30px;
border-radius:16px;
width:380px;
text-align:center;
}

.avatar-grid{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:14px;
margin:20px 0;
}

.avatar-grid img{
width:60px;height:60px;border-radius:50%;
cursor:pointer;border:3px solid transparent;
}

.avatar-grid img.selected,
.avatar-grid img:hover{border-color:#2563eb;}

/* PROGRESS SECTION */
.progress-box {
    background: #ffffff;
    padding: 24px;
    border-radius: 14px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.05);
    margin-bottom: 30px;
}

.progress-box h2 {
    margin-bottom: 20px;
}

.progress-item {
    display: flex;
    flex-direction: column;
    gap: 6px;
    margin-bottom: 16px;
    font-size: 14px;
}

.progress-item span {
    display: flex;
    justify-content: space-between;
    font-weight: 500;
}

.progress-bar {
    height: 10px;
    background: #e5e7eb;
    border-radius: 20px;
    overflow: hidden;
}

.progress-fill {
    height: 100%;
    background: linear-gradient(90deg, #2563eb, #1e40af);
    border-radius: 20px;
    transition: width 0.4s ease;
}

</style>
</head>

<body>

<header class="dashboard-navbar">
<div class="nav-left">SkillScore</div>

<div class="nav-right">
<span>Hi, ${sessionScope.loggedUser.name}</span>

<div class="avatar-wrapper" id="avatarWrapper">
<img id="currentAvatar" src="/avatars/avatar1.png" class="avatar">

<div class="avatar-menu" id="avatarMenu">
<a href="#" onclick="openAvatarModal()">Change Avatar</a>
<a href="/logout">Logout</a>
</div>
</div>
</div>
</header>

<main class="dashboard-container">

<section class="welcome-box">
<h1>Welcome back 👋</h1>
<p>Track your progress, practice skills, and get placement ready.</p>
</section>

<section class="stats-grid">
<div class="stat-card"><h2>12</h2>Tests Attempted</div>
<div class="stat-card"><h2>78%</h2>Average Score</div>
<div class="stat-card"><h2>5</h2>Skills Completed</div>
<div class="stat-card"><h2>3</h2>Mock Interviews</div>
</section>
<!-- PROGRESS SECTION -->
<section class="progress-box">
    <h2>Your Progress</h2>

    <div class="progress-item">
        <span>Aptitude</span>
        <span>60%</span>
        <div class="progress-bar">
            <div class="progress-fill" style="width: 60%"></div>
        </div>
    </div>

    <div class="progress-item">
        <span>Technical</span>
        <span>45%</span>
        <div class="progress-bar">
            <div class="progress-fill" style="width: 45%"></div>
        </div>
    </div>

    <div class="progress-item">
        <span>Communication</span>
        <span>70%</span>
        <div class="progress-bar">
            <div class="progress-fill" style="width: 70%"></div>
        </div>
    </div>

    <div class="progress-item">
        <span>HR</span>
        <span>30%</span>
        <div class="progress-bar">
            <div class="progress-fill" style="width: 30%"></div>
        </div>
    </div>
</section>

<section class="action-grid">
<div class="action-card"><h3>Aptitude</h3><p>Quant, logical</p>	<a href="/aptitude">
	    <button>Start</button>
	</a>
</div>
<div class="action-card"><h3>Technical</h3><p>DSA, Core CS</p><a href ="/technical"><button>Explore</button></a></div>
<div class="action-card"><h3>Communication</h3><p>GD & Speaking</p><a href ="/communication"><button>Practice</button></a></div>
<div class="action-card"><h3>HR Prep</h3><p>Interviews</p><a href ="/hr"><button>Prepare</button></a></div>
</section>

<section class="activity-box">
<h2>Recent Activity</h2>
<ul>
<li>✔ Quant Test – 82%</li>
<li>✔ Mock Interview</li>
<li>✔ Profile Updated</li>
</ul>
</section>

</main>

<!-- AVATAR MODAL -->
<div class="avatar-modal" id="avatarModal">
<div class="avatar-box">
<h3>Select Your Avatar</h3>

<div class="avatar-grid">
<img src="/avatars/avatar1.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar2.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar3.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar4.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar5.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar6.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar7.png" onclick="selectAvatar(this)">
<img src="/avatars/avatar8.png" onclick="selectAvatar(this)">
</div>

<button onclick="closeAvatarModal()" background color= "blue">Done</button>
</div>
</div>

<script>
const avatarWrapper = document.getElementById("avatarWrapper");
const avatarMenu = document.getElementById("avatarMenu");

avatarWrapper.addEventListener("click", (e)=>{
e.stopPropagation();
avatarMenu.classList.toggle("show");
});

document.addEventListener("click", ()=>{
avatarMenu.classList.remove("show");
});

function openAvatarModal(){
avatarMenu.classList.remove("show");
document.getElementById("avatarModal").style.display="flex";
}

function closeAvatarModal(){
document.getElementById("avatarModal").style.display="none";
}

function selectAvatar(img){
document.querySelectorAll(".avatar-grid img").forEach(i=>i.classList.remove("selected"));
img.classList.add("selected");
document.getElementById("currentAvatar").src=img.src;
}
</script>

</body>
</html>
