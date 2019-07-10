 
<?php



$con2 = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
  $username = $_POST['username'];
  $password = $_POST['password'];
  $role = $_POST['role'];
  $id=0;
  echo $role;
 

$query2 = "select user_id  from users where username = '$username'";

$query = "insert into users (username,password,role,deleted) values ('$username','$password','$role',0)";
 
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

 
