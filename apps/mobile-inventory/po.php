<?php


$supplier = $_GET["supplier"];
$barcode = $_GET["barcode"];
$po_qty = $_GET["po_quantity"];
$po_by = $_GET["po_by"];

$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");
 
$result2 = pg_query($db_connection,"select supplier_id as supplier_id from supplier where supplier_name='$supplier'");
if ($result2 > 0) {
		$row = pg_fetch_row($result2);
  		$supplier2= (int)$row[0];
  		//echo "Supplier".$supplier2;
  	}


$result3 = pg_query($db_connection,"select user_id as user_id from users where username='$po_by'");
//echo $barcode;
	if ($result3 > 0) {
		$row = pg_fetch_row($result3);
  		$po_by2= (int)$row[0];
  		//echo "Receiver".$received_by2;
  	}


$result = pg_query($db_connection, "INSERT INTO purchase_order(supplier_id,product_code,po_quantity,po_by,po_date) values ('$supplier2','$barcode','$po_qty','$po_by2',now()::timestamp)");
	

	if ($result > 0) {
	  echo "Ordered";

	  exit;

	}else {
		echo "error";
	}



?>