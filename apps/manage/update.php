
<?php
$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
  $computername = $_POST['computername'];
  $department = $_POST['department'];
  $deptcode = $_POST['deptcode'];
  $equipmentnumber=$_POST['propertynumber'];
  $nameofuser = $_POST['nameofuser'];



$query = "update computer_list set computer_name='$computername',department='$department',department_code='$deptcode',name_of_user='$nameofuser', equipment_number='$equipmentnumber' where computer_name='$computername';";
  
  $result = pg_query($con,$query);
   // echo pg_affected_rows($result); 
   
      if(pg_affected_rows($result) > 0){
        echo $computername."  Updated Successfully";
      } else {
        echo $computername."  Updated Failed! Computer Name does not Exist";
      }
  
 

?>

 
