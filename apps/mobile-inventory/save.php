<?php

$barcode = $_GET["barcode"];
$physical_count = $_GET["phy_count"];
$counter= $_GET["counted_by"];
$inventory_tag = $_GET["inventory_tag"];
$location = $_GET["location"];


//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");

$result2 = pg_query($db_connection,"select user_id as user_id from users where user_id='$counter'");
//echo $barcode;
	if ($result2 > 0) {
		$row = pg_fetch_row($result2);
  		$counter2= (int)$row[0];
  	}

$result = pg_query($db_connection, "INSERT INTO inventory (product_code,physical_count,counted_by,date_counted, inventory_tag,location) values ('$barcode','$physical_count','$counter2',now()::timestamp,'$inventory_tag','$location')");

if (!$result) {
  echo "Product Not Found!";
   
  exit;
} else {
	echo "updated successfully";
}


?>