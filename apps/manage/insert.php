
<?php
include('../login/session.php');
$con2 = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
  $computername = $_POST['computername'];
  $department = $_POST['department'];
  $deptcode = $_POST['deptcode'];
  $equipmentnumber=$_POST['propertynumber'];
  $nameofuser = $_POST['nameofuser'];

$query2 = "select id as idname from computer_list where computer_name = '$computername'";

$query = "insert into computer_list(computer_name,department,department_code,name_of_user,equipment_number) values ('$computername','$department','$deptcode','$nameofuser','$equipmentnumber')";
  
  $result2 = pg_query($con2,$query2);
   

 while($row = pg_fetch_assoc($result2)) {
      $id= $row['idname'];

      
  }

  echo $id;

  if($id > 0)
  {
    //if record exist
    echo "Duplicate Values!!";
  } else {
      $result = pg_query($con,$query);

      if(pg_affected_rows($result) > 0){
        echo $computername."  Computer Inserted Successfully";
      } else {
        echo $computername."  Computer Failed to Insert";
      }
  }
 

?>

 
