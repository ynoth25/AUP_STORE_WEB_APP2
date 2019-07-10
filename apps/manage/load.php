<!DOCTYPE html>
<html>
<head>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
</head>
<body>

<?php
$q = intval($_GET['q']);

$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
$query = ("Select * from computer_list where id=$q");
$query2 = ("Select * from operating_system where os_id=$q");
$query3 = ("Select * from anti_virus where av_id=$q");
$query4 = ("Select * from memory where mem_id=$q");
$result = pg_query($con,$query);
$result2 = pg_query($con,$query2);
$result3 = pg_query($con,$query3);
$result4 = pg_query($con,$query4);




 while ($row = pg_fetch_assoc($result)) 
          {
            

              $computer_name = $row['computer_name'];
              $department = $row['department'];
              $department_code = $row['department_code'];
              $name_of_user = $row['name_of_user'] ;
              $equipment_number = $row['equipment_number'] ;
              
              next($row);

           echo"   
               <strong><i class='fa fa-desktop margin-r-5'></i> Computer Details</strong>
              <br>
            </br>
              <p class='text-muted'>
                Name:&nbsp&nbsp&nbsp&nbsp<b>$computer_name</b>
              </p>
               
              <p class='text-muted'>
                Department:&nbsp&nbsp&nbsp&nbsp<b>$department</b>
              </p>
              <p class='text-muted'>
                Department Code:&nbsp&nbsp&nbsp&nbsp<b>$department_code</b>
              </p>

               <p class='text-muted'>
                Property Number:&nbsp&nbsp&nbsp&nbsp<b>$equipment_number</b>
              </p>
               <p class='text-muted'>
                Name of User:&nbsp&nbsp&nbsp&nbsp<b>$name_of_user</b>
              </p>
              <hr>";
              pg_close($con);
            }

            while ($row = pg_fetch_assoc($result2)) 
          {
            
               $brand = $row['brand'];
              $version = $row['version'];
              $last_update = $row['last_update'];
              next($row);

            echo "<strong><i class='fa fa-windows margin-r-5'></i> Operating System</strong>
              <br>
            </br>
              <p class='text-muted'>
                Brand:&nbsp&nbsp&nbsp&nbsp<b>$brand</b>
              </p>
               
              <p class='text-muted'>
                Version:&nbsp&nbsp&nbsp&nbsp<b>$version</b>
              </p>
              <p class='text-muted'>
                Latest Update:&nbsp&nbsp&nbsp&nbsp<b>$last_update</b>
              </p>
              <hr>
                ";
            }

              while ($row = pg_fetch_assoc($result3)) 
          {
            
               $brand = $row['brand'];
              $version = $row['version'];
             
             

              echo "<strong><i class='fa fa-shield margin-r-5'></i> Anti Virus</strong>
              <br>
            </br>
            <p class='text-muted'>
                Brand:&nbsp&nbsp&nbsp&nbsp<b>$brand</b>
              </p>
              <p class='text-muted'>
                Version:&nbsp&nbsp&nbsp&nbsp<b>$version</b>
              </p>

              <hr>";
               next($row);

          }

          while ($row = pg_fetch_assoc($result4)) 
          {
            
               $capacity = $row['capacity'];
              $available = $row['available'];

              echo "<strong><i class='fa fa-navicon margin-r-5'></i> Memory</strong>
              <br>
            </br>
            <p class='text-muted'>
                Installed:&nbsp&nbsp&nbsp&nbsp<b>$capacity</b>
              </p>
              <p class='text-muted'>
                Usable:&nbsp&nbsp&nbsp&nbsp<b>$available</b>
              </p>";

               next($row);
          }

          

             

          
?>
</body>
</html>