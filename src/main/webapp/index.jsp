<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>   
<%@ page import="comm.tech.info.helper.ConnectionProvider" %> 

<!DOCTYPE html>
<html>
   <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
     <!--CSS-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <link href="<%=request.getContextPath()%>/css/mystyle.css" rel="stylesheet" type="text/css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
         .banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 94%, 36% 100%, 0 93%, 0 0);
              
         }
     </style>

   </head>
   <body>
   
   <!-- navbar -->
   <%@include file="normal_navbar.jsp" %>
   
   <div class="container-fluid p-0 m-0">
       <div class="jumbotron primary-background text-white banner-background">
           <div class="container">
           <h3 class="display-3">Welcome to TechInfo</h3>
           <h3>Tech Information</h3>
           <p>Welcome to technical information, World of technology</p>
           <p>Programming languages are used for controlling the behavior of a machine (often a computer). Like natural languages, programming languages follow rules for syntax and semantics.</p>
           <p>There are thousands of programming languages[1] and new ones are created every year. Few languages ever become sufficiently popular that they are used by more than a few people, but professional programmers may use dozens of languages in a career.</p>
           
           <button class="btn btn-outline-light btn-lg"><span class="fa fa-edit"></span> Start ! its Free</button>
           <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-sign-in fa-spin"></span> Login</a>
           
           </div>
       </div>
   
   </div>
   
   <!-- Cards -->
   <div class="container">
   
       <div class="row mb-2">
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">C Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">C++ Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">Java Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
          
       </div>
   
       <div class="row">
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">Python Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">JavaScript Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="card">
                   <div class="card-body">
                      <h5 class="card-title">C# Programming</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read More</a>
                   </div>
               </div>
           </div>
          
       </div>
   </div>
     
     
     <!-- JavaScript -->
     <script
       src="https://code.jquery.com/jquery-3.7.1.min.js"
       integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
     crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="js/myjs.js" type="text/javascript"></script>
   
   </body>
</html>