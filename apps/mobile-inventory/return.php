<?php


$supplier = $_GET["supplier"];
$barcode = $_GET["barcode"];
$return_qty = $_GET["return_qty"];
$returned_by = $_GET["returned_by"];

$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");
 
$result2 = pg_query($db_connection,"select supplier_id as supplier_id from supplier where supplier_name='$supplier'");
if ($result2 > 0) {
		$row = pg_fetch_row($result2);
  		$supplier2= (int)$row[0];
  		//echo "Supplier".$supplier2;
  	}


$result3 = pg_query($db_connection,"select user_id as user_id from users where username='$returned_by'");
//echo $barcode;
	if ($result3 > 0) {
		$row = pg_fetch_row($result3);
  		$returned_by2= (int)$row[0];
  		//echo "Receiver".$received_by2;
  	}


$result = pg_query($db_connection, "INSERT INTO return (product_code,supplier_id,return_qty,returned_by,date_returned) values ('$barcode','$supplier2','$return_qty','$returned_by2',now()::timestamp)");
	

	if ($result > 0) {
	  echo "Returned";

	  exit;

	}else {
		echo "error";
	}



?>