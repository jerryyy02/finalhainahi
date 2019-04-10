<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<title>Faculty ${user.fName} ${user.lName}</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css'>
<style>

body {
padding-top: 80px;
 background:#F7F7F7;
  color:#666666;
  font-family: 'Roboto', sans-serif;
  font-weight:100;
}

body{
  width: 100%;
  background: -webkit-linear-gradient(left, #22d686, #24d3d3, #22d686, #24d3d3);
  background: linear-gradient(to right, #22d686, #24d3d3, #22d686, #24d3d3);
  background-size: 600% 100%;
  -webkit-animation: HeroBG 20s ease infinite;
          animation: HeroBG 20s ease infinite;
}

#hero {
  padding:20px;
  background-size: cover;
  color: white;
  height: 100%;
  display: flex;
  align-items: center;
  font-family: 'Roboto', sans-serif;
  text-align: center;
  font-weight:100;
}

#hero-caption {
  width: 100%;
}

#welcome {
  padding:20px;
  background-size: cover;
  color: white;
  height: 100%;
  display: flex;
  position:absolute;
  right:30px;
  align-items: center;
  font-family: 'Roboto', sans-serif;
  text-align: center;
  font-weight:100;
}

#welcome-caption {
  width: 100%;
}

/* Profile container */
.profile {
  margin: 2px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
  background: #fff;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 100;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

/* .profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
} */
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

.profile-usermenu ul li a {
  color: #93a3b5;
  font-size: 14px;
  font-weight: 400;
}

.profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px;
}
.profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
}

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
  background-color: #f6f9fb;
  border-left: 2px solid #5b9bd1;
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
border-radius:5px;
  padding: 20px;
  background: #fff;
  min-height: 460px;
}
 button, code, div, img, input, label, li, p, pre, select, span, svg, table, td, textarea, th, ul {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.dashboard-stat, .portlet {
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}
.portlet {
    margin-top: 0;
    margin-bottom: 25px;
    padding: 0;
    border-radius: 4px;
}
.portlet.bordered {
    border-left: 2px solid #e6e9ec!important;
}
.portlet.light {
    padding: 12px 20px 15px;
    background-color: #fff;
}
.portlet.light.bordered {
    border: 1px solid #e7ecf1!important;
}
.list-separated {
    margin-top: 10px;
    margin-bottom: 15px;
}
.profile-stat {
    padding-bottom: 20px;
    border-bottom: 1px solid #f0f4f7;
}
.profile-stat-title {
    color: #7f90a4;
    font-size: 25px;
    text-align: center;
}
.uppercase {
    text-transform: uppercase!important;
}

.profile-stat-text {
    color: #5b9bd1;
    font-size: 10px;
    font-weight: 600;
    text-align: center;
}
.profile-desc-title {
    color: #7f90a4;
    font-size: 17px;
    font-weight: 600;
}
.profile-desc-text {
    color: #7e8c9e;
    font-size: 14px;
}
.margin-top-20 {
    margin-top: 20px!important;
}
[class*=" fa-"]:not(.fa-stack), [class*=" glyphicon-"], [class*=" icon-"], [class^=fa-]:not(.fa-stack), [class^=glyphicon-], [class^=icon-] {
    display: inline-block;
    line-height: 14px;
    -webkit-font-smoothing: antialiased;
}
.profile-desc-link i {
    width: 22px;
    font-size: 19px;
    color: #abb6c4;
    margin-right: 5px;
}

.logout{
background-color: #E8E9EC;
  outline: none;
  color: #2D3B55;
  font-size: 14px;
  width:80px;
  height: auto;
  font-weight: normal;
  padding: 14px 0;
  text-transform: uppercase;
  border: none;
  border-radius: 5px;
  box-shadow: none;
  
}

.logout:hover,
.logout:focus {
  color: #fff;
  background-color: #2D3B55;
}


  
.button {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  height:50%;
  magrin: 0;
  padding: 20px;
  background-color: #3498db;
  border: none;
  border-radius: 6px;
  box-shadow: 0 12px 24px 0 rgba(0, 0, 0, 0.2);
  color: white;
  font-weight: 300;
  text-transform: uppercase;
  overflow: hidden;
}

.button:hover{
background-color: #2D3B55;
}

.button:before {
  position: absolute;
  content: '';
  bottom: 0;
  left: 0;
  width: 0%;
  height: 100%;
  background-color: #54d98c;
}
.button span {
  position: absolute;
  line-height: 0;
}
.button span i {
  transform-origin: center center;
}
.button span:nth-of-type(1) {
  top: 50%;
  transform: translateY(-50%);
}
.button span:nth-of-type(2) {
  top: 100%;
  transform: translateY(0%);
  font-size: 24px;
}
.button span:nth-of-type(3) {
  display: none;
}
    </style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body translate="no">
<nav class="navbar navbar-dark navbar-full navbar-fixed-top" style="background-color: #111;">
<a href="#hero" class="navbar-brand" id="hero">Academy Portal</a><div id="welcome">Welcome: ${user.fName} ${user.lName}</div>
</nav>
<div class="container">
<div class="row profile">
<div class="col-md-3">
<div class="profile-sidebar">

<div class="profile-userpic">
<img src="https://firebasestorage.googleapis.com/v0/b/grizzly-5a659.appspot.com/o/download.png?alt=media&token=fcacad64-5ba4-421b-8c63-020a64d96e7d" class="img-responsive" alt="">
</div>


<div class="profile-usertitle">
<div class="profile-usertitle-name">
${user.fName} ${user.lName}
</div>
Username:
<div class="profile-usertitle-job">

${user.userName}<br><br>
<a href="logout.html" class="form-control btn logout">Logout </a>
</div>
</div>


</div>
</div>
<div class="col-md-9">
<div class="profile-content">
<div class="w3-container w3-lobster">
<a href="faculty/addFaculty.html"><button class="button">
<span class="submit"><p class="w3-xlarge" align="center">To Update Faculty Details</p></span>
</button></a>
<br><br>

<a href="faculty/reportManagement.html"><button class="button">
<span class="submit"><p class="w3-xlarge" align="center">To Enter Report Details</p></span>
</button></a>
<br><br>

<a href="faculty/insertFacultySkill.html"><button class="button">
<span class="submit"><p class="w3-xlarge" align="center">Insert Skill</p></span>
</button></a>
<br><br>
</div>
</div>
</div>
</div>
<script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>
</body>
</html>