<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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

    <main class="d-flex align-items-center primary-background banner-background" style="padding-bottom: 80px">
        <div class="container">
           <div class="row">
               <div class="col-md-6 offset-md-3">
                   <div class="card">
                       <div class="card-header primary-background text-white text-center">
                          <span class="fa fa-user-plus fa-2x"></span>
                          <br>
                          <p>Sign up</p>
                       </div>
                       <div class="card-body">
                          <form id="reg-form" action="RegisterServlet" method="POST">
                          
                           <div class="form-group">
                           <label for="user_name">User name</label>
                           <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                           </div>
                          
                           <div class="form-group">
                           <label for="exampleInputEmail1">Email address</label>
                           <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                           <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                           </div>
                           
                           <div class="form-group">
                           <label for="exampleInputPassword1">Password</label>
                           <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                           </div>
                           
                           <div class="form-group">
                           <label for="gender">Select Gender</label>
                           <br>
                           <input type="radio" id="gender" name="gender" value="male">Male
                           <input type="radio" id="gender" name="gender" value="female">Female
                           </div>
                           
                           <div class="form-check">
                           <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                           <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                           </div>
                           
                           <br>
                           <div class="container text-center" id="loader" style="display: none;">
                               <span class="fa fa-refresh fa-spin fa-4x"></span>
                               <h4>Please Wait..</h4>
                           </div>
                           
                           <button id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button>
                          </form>
                       </div>
                       <div class="card-footer">
                          
                       </div>
                   </div>
               </div>
           </div>
        </div>
     </main>


    <!-- JavaScript -->
     <script
       src="https://code.jquery.com/jquery-3.7.1.min.js"
       integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
     crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="js/myjs.js" type="text/javascript"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     
     <script>
     $(document).ready(function(){
    	    console.log("loaded....");

    	    $('#reg-form').on('submit', function(event){
    	        event.preventDefault();

    	        let form = new FormData(this);

    	        $("#sumbimt-btn").hide();
    	        $("#loader").show();

    	        // Send request to RegisterServlet
    	        $.ajax({
    	            url: "RegisterServlet",
    	            type: 'POST',
    	            data: form,
    	            processData: false,
    	            contentType: false,
    	            success: function(data, textStatus, jqXHR){
    	                console.log(data);

    	                $("#sumbimt-btn").show();
    	                $("#loader").hide();

    	                if (data.trim() === 'done') {
    	                    swal("Registration Successful! Redirecting to login page...")
    	                    .then(() => {
    	                        window.location = "login_page.jsp";
    	                    });
    	                } else {
    	                    swal(data);  // Show server response in alert
    	                }
    	            },
    	            error: function(jqXHR, textStatus, errorThrown){
    	                console.log("AJAX Error: ", jqXHR);
    	                $("#sumbimt-btn").show();
    	                $("#loader").hide();
    	                swal("Something went wrong. Please try again.");
    	            }
    	        });
    	    });
    	});

     </script>
   
</body>
</html>