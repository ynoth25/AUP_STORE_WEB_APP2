
<?php

$db_connection = pg_connect("host=localhost dbname=postgres user=postgres password=789456321");

$result = pg_query($db_connection, "SELECT name from users order by name");

$rows2 = pg_num_rows($result);
//echo $rows2 . " row(s) returned.\n";

if ($rows2 ==0) {
  echo "Error";
 
}
echo '<option selected="selected">None</option>';
while ($row = pg_fetch_row($result)) {
  echo "<option>".$row[0]."</option>";
}

?>