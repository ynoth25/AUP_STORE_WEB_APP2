
<?php
//include('../login/session.php');
$con = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");
  $user_id = $_POST['user_id'];
 



$query = "update users set deleted=1 where user_id='$user_id' and deleted=0";
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $user_id."  Deleted Successfully";
      } else {
        echo $user_id."  Delete Failed Account does not exist!";
      }
  
 

?>

 
