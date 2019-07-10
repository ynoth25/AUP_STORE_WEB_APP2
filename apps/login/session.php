
<?php
   include('config.php');
   session_start();
   	$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
   	$user_check = $_SESSION['login_user'];
   	$query=("select username from users where username='$user_check'");
	$result=pg_query($con,$query);
	$row = pg_fetch_assoc($result);
	$login_session =$row['username'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:../../index.php");
      die();
   }
?>