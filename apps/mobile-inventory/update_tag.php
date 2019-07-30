<?php

$tag = $_GET["tag"];
$physical_count = $_GET["physical_count"];
$barcode = $_GET["barcode"];
$location = $_GET["location"];

if($physical_count == '' && $tag == '')
{
	$physical_count=0;
	$tag=0;
}


//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");
$sql="update inventory set product_code='$barcode', physical_count='$physical_count',location='$location',date_counted=now()::timestamp::date where inventory_tag='$tag'";
$result = pg_query($db_connection,$sql);

if (!$result) {
  echo "Product Not Found!";
   echo $sql;
  exit;
} else {
	echo "updated successfully";
}

pg_close($db_connection);
?>