<!--users_area-->
<!--user_registration.php-->
<?php include("../includes/connect.php"); 
include("../functions/common_function.php");
?>
<html>
<head>
	
	<title>user_registration</title>
	<!--bootstrap css link-->
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<script defer src="../js/bootstrap.bundle.min.js"></script>
</head>
<body background="../images/Dune.jpg" style="background-repeat:no-repeat; background-size: cover;">
	<div class="container-fluid">
		<h2 class="text-center text-light mb-3 p-3">New User Registration</h2><br>
		<div class="row d-flex align-items-center justify-content-center m-2">
			<div class="col-lg-12 col-xl-6">
				<form action="" method="post" enctype="multipart/form-data">
					<!--username-->
					<div class="form-outline text-light">
						<label
						for="user_username" class="form-label mb-2"><b>username</b></label>
						<input type="text" name="user_username" id="user_username" placeholder="Enter your username" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--email-->
					<div class="form-outline text-light">
						<label
						for="user_email" class="form-label mb-2"><b>email</b></label>
						<input type="email" name="user_email" id="user_email" placeholder="Enter your email" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--image-->
					<div class="form-outline text-light">
						<label
						for="user_image" class="form-label mb-2"><b>user image</b></label>
						<input type="file" name="user_image" id="user_image" placeholder="Enter your image" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--password-->
					<div class="form-outline text-light">
						<label
						for="user_password" class="form-label mb-2"><b>password</b></label>
						<input type="password" name="user_password" id="user_password" placeholder="Enter your password" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--confirm password-->
					<div class="form-outline text-light">
						<label
						for="conf_user_password" class="form-label mb-2"><b>confirm password</b></label>
						<input type="password" name="conf_user_password" id="conf_user_password" placeholder="Enter confirm password" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--Address-->
					<div class="form-outline text-light">
						<label
						for="user_address" class="form-label mb-2"><b>address</b></label>
						<input type="text" name="user_address" id="user_address" placeholder="Enter your address" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
					<!--contact-->
					<div class="form-outline text-light">
						<label
						for="user_contact" class="form-label mb-2"><b>contact</b></label>
						<input type="text" name="user_contact" id="user_contact" placeholder="Enter your mobile number" class="form-control mb-4" autocomplete="off"
						  required="required" style="width:650px;">
					</div>
				<input type="submit" name="user_registration" value="register" class="bg-info mb-2" style="border:0;width:90;height:40;">
			
				<div>
					<p class="small fw-bold"><b>Already have an account?</b><a href="user_login.php" class="text-danger">Login</a></p>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>

<?php
if(isset($_POST['user_registration']))
{
	$user_username=$_POST['user_username'];
	$user_email=$_POST['user_email'];
	$user_password=$_POST['user_password'];
	$conf_user_password=$_POST['conf_user_password'];
	$password_hash=password_hash($user_password,PASSWORD_DEFAULT);
	$user_address=$_POST['user_address'];
	$user_contact=$_POST['user_contact'];
	$user_image=$_FILES['user_image']['name'];
	$user_image_tmp=$_FILES['user_image']['tmp_name'];
	$user_ip=getIPAddress();





	$select_query="select * from `user_table` where username='$user_username' or user_email='$user_email'";
	$result=mysqli_query($con,$select_query);
	$row_count=mysqli_num_rows($result);
	if($row_count>0)
	{
		echo"<script>alert('username or email is already exist')</script>";
	}
	elseif($user_password!=$conf_user_password)
	{
		echo"<script>alert('your password is incorrect.please enter a correct password')</script>";
	}
	else
	{
		move_uploaded_file($user_image_tmp,"./user_images/$user_image");
		$insert_query="insert into `user_table`(username,user_email,user_password,user_image,user_ip,user_address,user_mobile)
		values('$user_username','$user_email','$password_hash','$user_image','$user_ip','$user_address','$user_contact')";
		$sql_execute=mysqli_query($con,$insert_query);
		
	}
	$select_cart="select*from `cart_details` where ip_address='$user_ip'";
	$result_cart=mysqli_query($con,$select_cart);
	$num=mysqli_num_rows($result_cart);
	if($num>0)
	{
		$_SESSION['username']=$user_username;
		echo"<script>window.open('checkout.php','_self')</script>";
	}
	else
	{
		echo"<script>window.open('user_login.php','_self')</script>";
	}
}
?>





