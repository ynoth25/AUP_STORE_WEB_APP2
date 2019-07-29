<?php

$barcode = $_GET["barcode"]; 

//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");  

$result = pg_query($db_connection, "SELECT description, unit_cost from product where product_code='$barcode'");

$rows2 = pg_num_rows($result);
//echo $rows2 . " row(s) returned.\n";

if ($rows2 ==0) {
  echo "Product Not Found!";
 
}

while ($row = pg_fetch_row($result)) {
  echo "Description: ".$row[0]."\n"."Unit Cost: ".str_replace('$', '₱',$row[1])."\n";
}
pg_close($db_connection);
?>