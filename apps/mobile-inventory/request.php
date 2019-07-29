<?php

$barcode = $_GET["barcode"];
$prod_desc = $_GET["prod_desc"];
$physical_count = $_GET["phy_count"];
$requested_by = $_GET["requested_by"]; 

//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");

$result2 = pg_query($db_connection,"select user_id as user_id from users where username='$requested_by'");
//echo $barcode;
	if ($result2 > 0) {
		$row = pg_fetch_row($result2);
  		$requested_by2= (int)$row[0];
  	}

$result = pg_query($db_connection, "INSERT INTO req_prod_encode(prod_code,prod_desc,physical_count,request_by) values 
	('$barcode','$prod_desc','$physical_count','$requested_by2')");

$affected = pg_affected_rows($result);

if ($affected ==0) {
  echo "Request Failed";
 
} else {
	echo "Request Sent";
}


pg_close($db_connection);

?>