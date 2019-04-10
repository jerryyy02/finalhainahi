<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
         <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<style>

html,
body{
  height: 100%;
  width: 100%;
}



.section-content{
  padding: 80px 0;
}

.section-title{
  padding-bottom: 20px;
}

#hero{
  background: #222 url('https://hd.unsplash.com/photo-1467703834117-04386e3dadd8') center center no-repeat;
  background-size: cover;
  color: white;
  height: 100%;
  display: flex;
  align-items: center;
  text-align: center;
}

#hero-caption{
  width: 100%;
}

#about{
  background: #ececec url('https://hd.unsplash.com/photo-1414690165279-49ab0a9a7e66') center center no-repeat;
  background-size: cover;
}

.about-text{
  background: rgba(0,0,0,0.75);
  color: #fff;
  padding: 1.8rem;
}

#contact{
  background:#ececec url('https://hd.unsplash.com/38/awhCbhLqRceCdjcPQUnn_IMG_0249.jpg') center center no-repeat;
  background-size: cover;
  color: #fff;
}

#footer-main{
  background-color: #222;
  color: #fff;
  font-size: 0.8em;
  padding: 2em;
  
  a{
    color: #999;
    
    &:hover{
      color: #efefef;
    }
  }
}

/* modals */

.service-modal .modal-dialog {
  margin: auto;
  height: 100%;
  width: auto;
}
.service-modal .modal-content {
  border-radius: 0;
  background-clip: border-box;
  -webkit-box-shadow: none;
  box-shadow: none;
  border: none;
  min-height: 100%;
  padding: 100px 0;
  text-align: center;
}
.service-modal .modal-content h2 {
  margin-bottom: 15px;
  font-size: 3em;
}
.service-modal .modal-content img {
  margin-bottom: 30px;
}
.service-modal .modal-content p {
  margin-bottom: 30px;
}
.service-modal .close-modal {
  position: absolute;
  width: 30px;
  height: 30px;
  background-color: transparent;
  top: 50px;
  right: 50px;
  cursor: pointer;
}
.service-modal .close-modal .close-icon {
  height: 30px;
  width: 1px;
  margin-left: 15px;
  background-color: #555;
  transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  z-index: 1000;
}
.service-modal .close-modal:hover .close-icon{
  background-color: #e74c3c;
}
.service-modal .close-modal .close-icon .close-icon-r {
  height: 30px;
  width: 1px;
  background-color: #555;
  transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  /* IE 9 */
  -webkit-transform: rotate(90deg);
  /* Safari and Chrome */
  z-index: 1000;
}
.service-modal .close-modal:hover .close-icon .close-icon-r {
  background-color: #e74c3c;
}
.w3-lobster {
  font-family: "Lobster", serif;}</style>

         <script type="text/javascript">
         $( document ).ready(function() {
        	  //Page scrolling
        	  $('a.navbar-brand, a.nav-link, .footer-nav-link, .back-to-top').click(function(){
        	    var $link = $(this);
        	    $('html, body').stop().animate({
        	      scrollTop: ($($link.attr('href')).offset().top - 50)
        	    }, 1250);

        	  });

        	  // Highlight the top nav as scrolling occurs
        	  $('body').scrollspy({
        	    target: ".navbar-fixed-top",
        	    offset: 51
        	  });
        	});
function handleSelect(elm)
{
window.location = elm.value;
}
</script>
</head>
<body>
<nav class="navbar navbar-dark navbar-full navbar-fixed-top" style="background-color: #111;">
  <a href="#hero" class="navbar-brand">Academic Portal</a>
  <ul class="nav navbar-nav pull-xs-right">
    <li class="nav-item">
      <a href="#services" class="nav-link">Home</a>
    </li>
    <li class="nav-item">
      <a href="#about" class="nav-link">About</a>
    </li>
    <li class="nav-item">
      <a href="#contact" class="nav-link">Logout</a>
    </li>
  </ul>
</nav>
               

               
                    
                        

<div class="container-fluid">
<br>
    <div class="row">
            <div class="col-md-3 bg-light">
                <nav class="navbar navbar-expand-md navbar-dark bg-secondary">
                    <span class="navbar-text navbar-">PROFILE</span>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a href="" style="color: aliceblue">Edit</a>
                        </li>
                    </ul>
                </nav>

<br><center>
    <picture>
        <img src="https://firebasestorage.googleapis.com/v0/b/grizzly-5a659.appspot.com/o/profile.png?alt=media&token=2c04d156-e6da-41c5-b726-e7301f660ac1" alt="Profile picture" width="50px"></img>
    </picture><br>
    <input id="prodId" name="userId" type="hidden">
    <b><%-- ${user.firstName} --%>Name here</b>
<br><br>
Username: <br> <%-- ${user.userId} --%>userName here

</center>
  </div>

                <div class="col-md-9 bg-light">
            
                    <div class="btn-group col-md-12">
                        <div class="container">
                            
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                              <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#home">What do you wanna Do?</a>
                              </li>
                       
                            </ul>
                          
                            <!-- Tab panes -->
                            <div class="tab-content">
                              <div id="home" class="container tab-pane active"><br>
        						<br><br>
        						<div class="w3-container w3-lobster">
<p class="w3-xlarge">To Register a New User Click <a href="admin/registerUser.html">Here</a></p><br><br>
<p class="w3-xlarge">To Register a New Module Click <a href="admin/addModule.html">Here</a></p><br><br>
<p class="w3-xlarge">For Batch Allocation Click <a href="admin/batchAllocation.html">Here</a></p><br><br>
<p class="w3-xlarge">To Register a New Batch Click <a href="admin/insertBatch.html">Here</a></p><br><br>
<p class="w3-xlarge">To Generate Report Click<a href="admin/generateReport.html">Here</a></p><br><br>
<p class="w3-xlarge">To view Report Click<a href="admin/generateReport1.html">Here</a></p><br><br>
<p class="w3-xlarge">To Enter Skill Details Click<a href="admin/insertSkill.html">Here</a></p>
                        </div>

                        </div>
               
                              </div>
                              <div id="menu1" class="container tab-pane fade"><br>
                              <a href="show.html?id=${doctor.userId}" class="btn btn-secondary form-rounded"  width="50px"> Show Doctors List 
                              </a>
                              </div>
                            </div>
                          </div>
                    </div>
                    <br>
    </div>    

           
</body>
</html>