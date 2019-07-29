<?php

$user_id = $_GET["user_id"];
$password = $_GET["password"]; 

//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");

$result = pg_query($db_connection, "SELECT user_id from users where user_id='$user_id' and password='$password'");

$rows2 = pg_num_rows($result);
//echo $rows2 . " row(s) returned.\n";

if ($rows2 ==0) {
  echo "Login Failed";
 
}

while ($row = pg_fetch_row($result)) {
  echo $row[0];
}
pg_close($db_connection);
?>