<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/resources/Component_css_js.jsp"%> 

<style type="text/css">

body {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    background: linear-gradient(to right, #b92b27, #1565c0)
}

.box {
    width: 500px;
    padding: 40px;
    position: absolute;
    top: 50%;
    left: 50%;
    background: #191919;
    ;
    text-align: center;
    transition: 0.25s;
    margin-top: 100px
}

.box input[type="text"],
.box input[type="password"],
.box input[type="email"],
.box input[type="number"] {
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s
}

.box h1 {
    color: white;
 /*   // text-transform: uppercase; */
    font-weight: 500
}

.box input[type="text"]:focus,
.box input[type="password"]:focus,
.box input[type="email"]:focus,
.box input[type="number"]:focus {
    width: 300px;
    border-color: #2ecc71
}

.box input[type="button"] {
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #2ecc71;
    padding: 14px 40px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s;
    cursor: pointer
}

.box input[type="button"]:hover {
    background: #2ecc71
}

.forgot {
    text-decoration: underline
}

ul.social-network {
    list-style: none;
    display: inline;
    margin-left: 0 !important;
    padding: 0
}

ul.social-network li {
    display: inline;
    margin: 0 5px
}

.social-network a.icoFacebook:hover {
    background-color: #3B5998
}

.social-network a.icoTwitter:hover {
    background-color: #33ccff
}

.social-network a.icoGoogle:hover {
    background-color: #BD3518
}

.social-network a.icoFacebook:hover i,
.social-network a.icoTwitter:hover i,
.social-network a.icoGoogle:hover i {
    color: #fff
}

a.socialIcon:hover,
.socialHoverClass {
    color: #44BCDD
}

.social-circle li a {
    display: inline-block;
    position: relative;
    margin: 0 auto 0 auto;
    border-radius: 50%;
    text-align: center;
    width: 50px;
    height: 50px;
    font-size: 20px
}

.social-circle li i {
    margin: 0;
    line-height: 50px;
    text-align: center
}

.social-circle li a:hover i,
.triggeredHover {
    transform: rotate(360deg);
    transition: all 0.2s
}

.social-circle i {
    color: #fff;
    transition: all 0.8s;
    transition: all 0.8s
}


</style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <form class="box" id="login-form">
                    <h1>Webmail Sign up</h1>
                    <p class="text-muted"> Please enter your details!</p>
                       <input type="text" name="username" id="username" placeholder="Username"> 
                       <input type="password" name="password" id="password" placeholder="Password"> 
                       <input type="email" name="email" id="email" placeholder="Email"> 
                       <input type="number" name="Mobnumber" id="Mobnumber" placeholder="Enter Mobile Number"> 
                       <input type="text" name="address" id="address" placeholder="Address">
                       <a class="login text-muted" href="${pageContext.request.contextPath}/login">Login account</a><br>
                       <a class="forgot text-muted" href="${pageContext.request.contextPath}/forgotpass">Forgot password?</a><br>
                        <input type="button" id="submit"  onclick="SignupValidate()" value="Signup">
                </form>
            </div>
        </div>
    </div>
</div>
<script>

function SignupValidate(){
	
	var username = $("#username").val();
	var password = $("#password").val();
	var email = $("#email").val();
	var Mobnumber = $("#Mobnumber").val();
	var address = $("#address").val();
	
	var check=0;
	
	if(username==""){
		
		toastr.error("Please enter username");
		check=1;
		
	}
	if(password==""){
		
		toastr.error("Please enter password");
		check=1;
	}
	if(email==""){
		
		toastr.error("Please enter email");
		check=1;
	}
	if(Mobnumber==""){
		
		toastr.error("Please enter Mobnumber");
		check=1;
	}
	if(address==""){
		
		toastr.error("Please enter address");
		check=1;
	}
	
	if(check==1){
		
		return false;
	}
	$.ajax({
		
		type: "POST",
			url: "addUser",
				data:{
					"username":username,
					"password":password,
					"email":email,
					"Mobnumber":Mobnumber,
					"address":address
				},
				success :function(msg){
					if(msg =="****"){
						
						toastr.success("Registration successfull")
						
						location.reload(5000);
						
					}
					else{
						toastr.error("Error adding registration");
					}
				}
				
				
	});
	
	
	
}




</script>

</body>
</html>