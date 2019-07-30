<?php

$tag = $_GET["tag"]; 

//echo $barcode;
$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");  

$result = pg_query($db_connection, "select inventory.inventory_tag, inventory.product_code, product.description description,product.unit_cost::numeric::float8 unit_cost, product.on_hand on_hand,inventory.physical_count,(product.on_hand - inventory.physical_count) as variance, (inventory.physical_count*product.unit_cost::numeric::float8) as total_cost, users.username counted_by, inventory.location,inventory.date_counted from inventory inner join product on product.product_code = inventory.product_code inner join users on users.user_id = inventory.counted_by where inventory.inventory_tag='$tag';");

$rows2 = pg_num_rows($result);
//echo $rows2 . " row(s) returned.\n";

if ($rows2 ==0) {
  echo "Tag Not Found!";
 
}

while ($row = pg_fetch_row($result)) {
  echo "barcode:".$row[1].","."description:".$row[2].","."unit_cost".$row[3].","."physical_count:".$row[5].","."counted_by:".$row[8].","."location:".$row[9].".";
}
pg_close($db_connection);
?>