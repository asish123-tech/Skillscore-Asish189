<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Percentages</title>

<style>
body { background:#FFF1F1; font-family: Arial; margin:0; }

/* ✅ NAVBAR */
.navbar {
    background:#2563eb;
    color:#fff;
    padding:14px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.navbar .brand {
    font-size:20px;
    font-weight:bold;
}
.navbar a {
    color:#fff;
    text-decoration:none;
	
  
    padding:6px 14px;
    border-radius:6px;
}
.navbar button{
	font-size:16px;
}
.navbar button:hover{
	background:#FFF1F1;
	
	color :black;
}

/* EXISTING UI (UNCHANGED) */
.box { background:#fff; padding:30px; width:700px; margin:40px auto; border-radius:12px;  box-shadow: 0 8px 20px rgba(0,0,0,0.3); }
.progress { height:10px; background:#e5e7eb; border-radius:6px; overflow:hidden; }
.fill { height:100%; background:#2563eb; width:${(index*100)/total}%; }
.option { margin:12px 0; display:block; }
button { padding:10px 20px; background:#2563eb; color:#fff; border:none; border-radius:6px; }
button:hover{
	background:#0056b3;
}

</style>
</head>

<body>

<!-- ✅ NAVBAR ADDED -->
<div class="navbar">
    <div class="brand">SkillScore</div>
    <a href="/quantitative"><button>Back</button></a>
</div>

<!-- EXISTING CONTENT (UNCHANGED) -->
<div class="box">

<h2>Percentages</h2>

<div class="progress"><div class="fill"></div></div>
<p>Question ${index + 1} of ${total}</p>

<form method="post" action="/student/aptitude/percentages/next">

<h3>${question.question}</h3>

<c:forEach items="${question.options}" var="opt" varStatus="i">
    <label class="option">
        <input type="radio" name="selectedOption" value="${i.index}" required>
        ${opt}
    </label>
</c:forEach>

<div style="margin-top:20px">
    <c:if test="${index > 0}">
        <button formaction="/student/aptitude/percentages/prev">Previous</button>
    </c:if>

    <button type="submit">
        <c:choose>
            <c:when test="${index + 1 == total}">Submit</c:when>
            <c:otherwise>Next</c:otherwise>
        </c:choose>
    </button>
</div>

</form>

</div>
</body>
</html>
