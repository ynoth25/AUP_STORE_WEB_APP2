
<?php
//include('../login/session.php');

  $user_id = $_POST['user_id'];
  $rf_id = $_POST['rf_id'];
  $username = $_POST['username'];
  $password = $_POST['password'];
  $con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
  
if($rf_id != 0)
{

$query = "update users set user_id = '$user_id', rf_id='$rf_id', username='$username',password='$password', deleted=0 where user_id='$user_id';";
} else {
	$query = "update users set user_id = '$user_id', username='$username',password='$password', deleted=0 where user_id='$user_id';";
}
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $username."  Updated Successfully";
      } else {
        echo $username."  Updated Failed! Computer Name does not Exist";
      }
  
 

?>

 
