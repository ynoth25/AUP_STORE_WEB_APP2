
<?php
$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
  $computername = $_POST['computername'];
 



$query = "delete from computer_list where computer_name='$computername'";
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $computername."  Deleted Successfully";
      } else {
        echo $computername."  Delete Failed Account does not exist!";
      }
  
 

?>

 
