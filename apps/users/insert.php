
<?php
$con2 = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
  
  $user_id = $_POST['user_id'];
  $rf_id = $_POST['rf_id'];
  $username = $_POST['username'];
  $password = $_POST['password'];
  $role = $_POST['role'];
  $id=0;
  echo $role;
 

$query2 = "select user_id  from users where username = '$username'";

if($rf_id != 0)
{
  $query = "insert into users (rf_id,username,password,role,deleted,user_id) values ('
$rf_id','$username','$password','$role',0,'$user_id')";
} else {
  $query = "insert into users (username,password,role,deleted,user_id) values ('$username','$password','$role',0,'$user_id')";
}

 
  $result2 = pg_query($con2,$query2);   
   

 while($row = pg_fetch_assoc($result2)) {
      $id= $row['user_id'];

  }



  if($id != 0)
  {
    //if record exist
    echo "Duplicate Values!!";
  } else {
      $result = pg_query($con2,$query);

      if(pg_affected_rows($result) > 0){
        echo $username."  User Inserted Successfully";
      } else {
        echo $username."  User Failed to Insert";
      }
  }
 

?>

 
