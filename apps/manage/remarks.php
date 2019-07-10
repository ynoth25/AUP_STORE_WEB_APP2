<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	
	<?php
  
	$q = intval($_GET['q']);
	$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
	$query5 = ("Select * from software where soft_id=$q");
  $query3 = ("Select * from anti_virus where av_id=$q");
  $query2 = ("Select * from operating_system where os_id=$q");
  $query4 = ("Select * from scan_date_time where id=$q");
  $result4 = pg_query($con,$query4);
  $result2 = pg_query($con,$query2);
  $result3 = pg_query($con,$query3);
	$result5 = pg_query($con,$query5);
  $chrome_flag=0;
  $firefox_flag=0;
  $vlc_flag=0;
  $reader_flag=0;
  $msoffice_flag=0;

      
       while($row = pg_fetch_assoc($result5)) {
        
          
          if(strpos($row['apps'],'Google Chrome' ) !== false )
          {
               $chrome_flag=1;
          } else if(strpos($row['apps'],'Firefox' ) !== false)
          {
             $firefox_flag=1;
          }else if(strpos($row['apps'],'Adobe Acrobat' ) !== false)
          {
            $reader_flag=1;
          }else if(strpos($row['apps'],'Adobe Reader X' ) !== false)
          {
            $reader_flag=1;
          } else if(strpos($row['apps'],'Microsoft Office' ) !== false)
          {
            $msoffice_flag=1;
          } else if(strpos($row['apps'],'VLC' ) !== false)
          {
            $vlc_flag=1;
          }

      }

      if($chrome_flag>0 && $firefox_flag>0 && $reader_flag >0 && $msoffice_flag>0 && $vlc_flag>0)
      {
        echo "<span class='label label-success'>All Essential Apps Installed</span><br>";
      }else if($chrome_flag <= 0)
      {
        echo "<span class='label label-danger' >Chrome is not Installed</span><br>";
      }else if($firefox_flag <= 0)
      {
        echo "<span class='label label-danger' >Firefox is not Installed</span><br>";
      }else if($reader_flag <= 0)
      {
        echo "<span class='label label-danger' >Adobe Reader is not Installed</span><br>";
      }else if($msoffice_flag <= 0)
      {
        echo "<span class='label label-danger' >Microsoft Office is not Installed</span><br>";
      }else if($vlc_flag <= 0)
      {
        echo "<span class='label label-danger' >VLC is not Installed</span><br>";
      }

      //check avira

      while ($row = pg_fetch_assoc($result3)) 
          {
            
               $brand = $row['brand'];
              $version = $row['version'];

              if(strcmp($brand,"None") == 0)
              {
                echo "<span class='label label-danger' >Avira is not Installed</span><br>";
              }

          }

              while ($row = pg_fetch_assoc($result2)) 
          {
            
               $brand = $row['brand'];
              $version = $row['version'];
              $last_update = $row['last_update'];
              
              if($last_update == "None")
              {
                echo "<span class='label label-danger' >Windows Update is Disabled</span><br>";
              }

              if(strcmp($brand, "Others") == 0 || strcmp($version, "Others") == 0)
              {
                 echo "<span class='label label-danger'>Un Authorized Operating System</span><br>";
              }
          }

            while ($row = pg_fetch_assoc($result4)) 
          {
            
               $date = $row['date_scan'];
               echo "<strong><i class='fa fa-calendar-check-o'></i>Date Checked</strong><br>";
               echo "<span class='label label-success'>$date</span><br>";
          }
 
      ?>

</body>
</html>