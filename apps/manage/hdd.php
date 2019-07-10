<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	
	<?php

	$q = intval($_GET['q']);
	$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
	$query5 = ("Select * from hdd where hdd_id=$q");
	$result5 = pg_query($con,$query5);

	echo "
       
            <div class='box-body table-responsive no-padding'  >
	 <table class='table table-hover'>
                <tr>
                  <th>Partition</th>
                  <th>Capacity</th>
                  <th>Used</th>
                  <th>Available</th>
                  
                </tr>";
       

       while($row = pg_fetch_assoc($result5)) {
    echo "<tr>";
    echo "<td>" . $row['partition'] . "</td>";
    echo "<td>" . $row['capacity']. "</td>";
    echo "<td>" . $row['used'] . "</td>";
    echo "<td>" . $row['available']  . "</td>";
    
    echo "</tr>";
}

echo "</table>";
echo "</div>";
      ?>
      
            

</body>
</html>