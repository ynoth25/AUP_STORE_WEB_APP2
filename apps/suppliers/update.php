
<?php
include('../login/session.php');

 $username = $_POST['username'];
  $password = $_POST['password'];



$query = "update users set username='$username',password='$password', deleted=0 where username='$username';";
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $username."  Updated Successfully";
      } else {
        echo $username."  Updated Failed! Computer Name does not Exist";
      }
  
 

?>

 
