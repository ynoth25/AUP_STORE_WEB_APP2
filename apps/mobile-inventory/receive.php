<?php

$invoice_number = $_GET["invoice_number"];
$supplier = $_GET["supplier"];
$barcode = $_GET["barcode"];
$qty_received = $_GET["qty_received"];
$received_by = $_GET["received_by"];

$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");
 
$result2 = pg_query($db_connection,"select supplier_id as supplier_id from supplier where supplier_name='$supplier'");
if ($result2 > 0) {
		$row = pg_fetch_row($result2);
  		$supplier2= (int)$row[0];
  		//echo "Supplier".$supplier2;
  	}


$result3 = pg_query($db_connection,"select user_id as user_id from users where username='$received_by'");
//echo $barcode;
	if ($result3 > 0) {
		$row = pg_fetch_row($result3);
  		$received_by2= (int)$row[0];
  		//echo "Receiver".$received_by2;
  	}


$result = pg_query($db_connection, "INSERT INTO receiving (invoice_number,supplier_id,product_code,qty_received,date_received,received_by) values ('$invoice_number','$supplier2','$barcode','$qty_received',now()::timestamp, '$received_by2')");
	

	if ($result > 0) {
	  echo "Recorded";

	  exit;

	}else {
		echo "error";
	}


pg_close($db_connection);
?>