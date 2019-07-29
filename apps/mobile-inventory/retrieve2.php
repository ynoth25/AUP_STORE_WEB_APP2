<?php

$barcode = $_GET["barcode"];  

//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");

$result = pg_query($db_connection, "SELECT * from product where product_code='$barcode'");

$rows2 = pg_num_rows($result);
//echo $rows2 . " row(s) returned.\n";

if ($rows2 ==0) {
  echo "Product Not Found!";
 
}



while ($row = pg_fetch_row($result)) {
  echo "Description: ".$row[1]."\n"."Unit Cost: ".str_replace('$', '₱',$row[3])."\n"."Selling Price: ".str_replace('$', '₱',$row[4])."\n";

$result2 = pg_query($db_connection, "SELECT supplier_name as supplier_name from supplier where supplier_id='$row[5]'");

	$row2 = pg_num_rows($result2);
	while ($row2 = pg_fetch_row($result2)) {
		echo "Supplier: ".$row2[0];
	}
  
}




pg_close($db_connection);
?>