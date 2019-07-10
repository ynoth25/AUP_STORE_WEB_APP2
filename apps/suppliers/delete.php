
<?php
include('../login/session.php');

  $username = $_POST['username']; 
 



$query = "update users set deleted=1 where username='$username' and deleted=0";
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $username."  Deleted Successfully";
      } else {
        echo $username."  Delete Failed Account does not exist!";
      }
  
 

?>

 
