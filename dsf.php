<?php
if(isset($_POST['date_range'])){
   $q = $_POST['date_range'];

   $line ="_________";
 }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Individual Timecard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style type="text/css">
        hr {
            width: 50%;
            height: 20px;
            background-color: red;
            margin-right: auto;
            margin-left: auto;
            margin-top: 5px;
            margin-bottom: 5px;
            border-width: 2px;
            border-color: green;
        }
    </style>

</head>
<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="layout-top-nav">
<!-- Site wrapper -->
<div class="">

  <div class="">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
       <!-- right column -->
        <div class="col-md-8"> 
          <div class="box box-primary">
            <div class="box-header ">
             <form action="dsf.php" method="POST">
              <div class="form-group">
                <label>Date Range:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar-o"></i>
                  </div>
                  <input type="text" class="form-control pull-right" name="date_range" id="reservation" value="<?php echo $q; ?>">
                </div>
                <!-- /.input group -->
              </div>
              <button type="submit" id="search" name="search" class="btn btn-info pull-left" value="Submit">Search</button>
              </form>
              <button id="export" onclick="exportTableToExcel('tblData',reservation.value+' Labor')" name="export" class="btn btn-success pull-right">Export to CSV/Excel</button>
            <!-- /.box-header -->
            <div class="box-body" >
            </div>
            <!-- /.box-body -->
          </div>
        </div>
      <!-- /.box -->
       <div >
            <div class="box-header">
              <h3 class="box-title">Labor Report</h3>
            </div>
            <!-- /.box-header -->
            <div class="">

              <?php
                $week =0;
                $output = 0;
                $dormitory = 0;
                $is_caf = 0;
                $subsidy = 0;
                $total = 0;
                $gtotal = 0;
                $stotal = 0;
                $gross = 0;
                $rate = 0;
                $req_hours = 0;
                $count = 0;
                $temp_name = '';
                $week = '';
                $total2 = 0;

                //sub total of :)
                $sum_of_total = 0;
                $sum_of_gross = 0;
                $sum_of_tithe = 0;
                $sum_of_net = 0;
                $sum_of_subsidy = 0;
                $sum_of_credit = 0;
                $sum_of_balance = 0;

                //over all total :)
                $oat_totalwe1 = 0;
                $oat_totalwe2 = 0;
                $oat_totalwe3 = 0;
                $oat_totalwe4 = 0;
                $oat_totalwe5 = 0;

                $oat_total = 0;
                $oat_gross = 0;
                $oat_tithe = 0;
                $oat_net = 0;
                $oat_subsidy = 0;
                $oat_credit = 0;
                $oat_balance = 0;


                $i=0;
                 if(isset($_POST['search'])){

                    $q = $_POST['date_range'];
                    $subsidy = 0;
                    list($from, $to) = preg_split('/(:|-|\*|=)/', $q,-1, PREG_SPLIT_NO_EMPTY);
                    $from= strtotime($from);
                    $to= strtotime($to);
                    $from2 = date('Y-m-d',$from);
                    $to2 = date('Y-m-d',$to);

                    $dates = dateRange($from2, $to2);

                    $weekends = array_filter($dates, function ($date) {
                        $day = $date->format("N");
                        return $day === '6';
                    });



                    $con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");

                     $dept_query = "select id, department from department order by department";
                    $result_dept = pg_query($con,$dept_query);

                   
                    // echo $query5;
              ?>
              <table id="tblData" class="table table-bordered table-hover" cellspacing="0" width="100%" border="10%">
                    <thead>
                        <tr>
                            <th>ID Number</th>
                            <th>Course</th>
                            <th>Name</th>
                            <th>Subsidy</th>
                            <th>Rate</th>
                            <?php
                                foreach ($weekends as $date) {
                                    $i++;
                                    echo "<th>".$date->format("D Y-m-d") . "</th>";
                                    $week++;
                                    ${"totalw$i"} = 0;
                                    ${"totalwe$i"} = 0;
                                }
                            ?>
                            <th>Count</th>
                            <th>Total</th>
                            <th>Gross</th>
                            <th>Tithe</th>
                            <th>Net</th>
                            <th>Subsidy</th>
                            <th>Credit</th>
                            <th>Balance</th>
                        </tr>
                    </thead>
                    <tfoot>
                    </tfoot>
                    <tbody> 
                    <?php
                    
                    while($row4 = pg_fetch_assoc($result_dept)) {
                            $dept_id = $row4['id'];

                            $department = $row4['department'];
                          echo "<tr><td></td><td></td><td><strong>".$department."</strong></td></tr>";

                           $id_query = "select rf_id,user_id, username, course.course course, rate,dormitory,units,is_caf,required_hours from users 
                            inner join course on users.course = course.id
                            where department='$dept_id' group by rf_id, course.course order by username;";
                            $result2 = pg_query($con,$id_query);

                      while($row2 = pg_fetch_assoc($result2)){
                          $rf_id = $row2['rf_id'];
                          $course= $row2['course'];
                          $user_id = $row2['user_id'];
                          $username = $row2['username'];
                          $rate = $row2['rate'];
                          $dormitory = $row2['dormitory'];
                          $units = $row2['units'];
                          $is_caf = $row2['is_caf'];
                          $required_hours = $row2['required_hours'];

                        echo "<td>".$user_id."</td>";
                        echo "<td>".$course."</td>";
                        echo "<td>".$username."</td>";
                        

                        if($dormitory != 16 &&$is_caf > 0)
                            {
                             

                                    if($units <= 9){
                                        $subsidy = 625;

                                    } else if($units <=12 && $units > 9){
                                        $subsidy = 531.25;
                                
                                    } else if($units > 12){
                                        $subsidy = 500;
                                 
                                    }
                                
                            } else {
                                $subsidy = 0;
                            }
                            echo "<td>".$subsidy."</td>";
                            echo "<td>".$rate."</td>";

                    $hours_query = " select date_trunc('week',(transact_date + interval '1 day')) - interval '1 day' as week, sum (round(extract (epoch from ((timeout::time - timein::time)/3600))::numeric,2)) as total
                        from dtr where rf_id='$rf_id' and transact_date between '$from2'::date and '$to2'::date group by 1";

                        $result3 = pg_query($con,$hours_query);
                        $i="1";  
                        while($row3 = pg_fetch_assoc($result3)){
                                $total2 = $row3['total'];
                                
                                if ($i=="1"){
                                    $totalw1 = $total2;

                                } else {
                                    $totalw1=0;
                                } 

                                 if($i =="2"){
                                    $totalw2 = $total2;
                                } else {
                                    $totalw2 =0;
                                }

                                if($i =="3"){
                                    $totalw3 = $total2;
                                } else {
                                    $totalw3 =0;
                                }

                                if($i =="4"){
                                    $totalw4 = $total2;
                                } else {
                                    $totalw4 =0;
                                }
                                if($i =="5"){
                                    $totalw5 = $total2;
                                } else {
                                    $totalw5 =0;
                                }

                                
                                
                                $week = $row3['week'];
                                 echo "<td style=color:green;>".$total2."</td>"; 

                                 $output++;
                                 $nweek = count($weekends);
                                
                                
                                $stotal+=$total2;

                                if($nweek == 1){
                                    $totalwe1 +=$totalw1;
                                    $oat_totalwe1 +=$totalw1;
                                } else if($nweek == 2){
                                    $totalwe1 +=$totalw1;
                                    $totalwe2 +=$totalw2;

                                    $oat_totalwe1 +=$totalw1;
                                    $oat_totalwe2 +=$totalw2;
                                } else if($nweek == 3){
                                    $totalwe1 +=$totalw1;
                                    $totalwe2 +=$totalw2;
                                    $totalwe3 +=$totalw3;

                                    $oat_totalwe1 +=$totalw1;
                                    $oat_totalwe2 +=$totalw2;
                                    $oat_totalwe3 +=$totalw3;
                                } else if($nweek == 4){
                                    $totalwe1 +=$totalw1;
                                    $totalwe2 +=$totalw2;
                                    $totalwe3 +=$totalw3;
                                     $totalwe4 +=$totalw4;

                                    $oat_totalwe1 +=$totalw1;
                                    $oat_totalwe2 +=$totalw2;
                                    $oat_totalwe3 +=$totalw3;
                                    $oat_totalwe4 +=$totalw4;

                                } else if($nweek == 5){
                                    $totalwe1 +=$totalw1;
                                    $totalwe2 +=$totalw2;
                                    $totalwe3 +=$totalw3;
                                    $totalwe4 +=$totalw4;
                                    $totalwe5 +=$totalw5;

                                    $oat_totalwe1 +=$totalw1;
                                    $oat_totalwe2 +=$totalw2;
                                    $oat_totalwe3 +=$totalw3;
                                    $oat_totalwe4 +=$totalw4;
                                    $oat_totalwe5 +=$totalw5;
                                 }
                               
                                
                               

                                 if($total2 >= $required_hours){
                                    $count++;
                                }
                         $i++;        
                        }

                            
                            if($stotal >= 0){
                                $week = count($weekends);
                                 $loop = $week-$output; 
                                 //echo "loop".$loop;
                                 for($i=0; $i <=$loop-1;++$i){
                                    echo "<td>-</td>";
                                 }

                            echo "<td style=color:blue;>".$count."</td>";
                            echo "<td style=color:blue;>".$stotal."</td>";
                            $sum_of_total+=$stotal;
                            $oat_total +=$stotal;

                            $gross = $stotal*$rate;
                            $sum_of_gross +=$gross;
                            $oat_gross +=$gross;
                            echo "<td style=color:blue;>".number_format($gross, 2)."</td>";

                            $tithe = ($gross*0.1)*-1;
                            $sum_of_tithe +=$tithe;
                            $oat_tithe +=$tithe;
                            echo "<td style=color:blue;>".number_format($tithe, 2)."</td>";

                            $net = $gross-$tithe;
                            $sum_of_net +=$net;
                            $oat_net +=$net;
                            echo "<td style=color:blue;>".number_format($net, 2)."</td>";

                            $subsidy2=$count*$subsidy;
                            $sum_of_subsidy += $subsidy2;
                            $oat_subsidy +=$subsidy2;
                            echo "<td style=color:blue;>".number_format($subsidy2, 2)."</td>";

                            $credit=$net+$subsidy2;
                            $sum_of_credit +=$credit;
                            $oat_credit += $credit;
                            echo "<td style=color:blue;>".number_format($credit, 2)."</td>";

                            $balance = $gross+$subsidy2;
                            $sum_of_balance +=$balance; 
                            $oat_balance += $balance;   
                            echo "<td style=color:blue;>".number_format($balance, 2)."</td>";
                            // echo "<tr><td></td><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td style=color:red;>".$gtotal."</td></tr>";
                            
                            $stotal=0;
                            $count=0;
                            $output=0;
                            }
                    ?> 
                         </tr>
                <?php   }

                        
                                if($week == 1){
                                        echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td></td><strong><td style=color:red;>".$totalwe1."</td><td></td>
                                            <td style=color:red;><strong>".$sum_of_total."</td>
                                            <td style=color:red;><strong>".$sum_of_gross."</td>
                                            <td style=color:red;><strong>".$sum_of_tithe."</td>
                                            <td style=color:red;><strong>".$sum_of_net."</td>
                                            <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                            <td style=color:red;><strong>".$sum_of_credit."</td>
                                            <td style=color:red;><strong>".$sum_of_balance."</td>
                                            </tr>
                                           ";
                                } else if($week == 2){
                                        echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td></td>
                                            <td style=color:red;><strong>".$sum_of_total."</td>
                                            <td style=color:red;><strong>".$sum_of_gross."</td>
                                            <td style=color:red;><strong>".$sum_of_tithe."</td>
                                            <td style=color:red;><strong>".$sum_of_net."</td>
                                            <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                            <td style=color:red;><strong>".$sum_of_credit."</td>
                                            <td style=color:red;><strong>".$sum_of_balance."</td>
                                            </tr>";
                                }else if($week == 3){
                                        echo "<tr><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td><strong>".$totalwe2."</td><td><strong>".$totalwe3."</td><td></td>
                                            <td style=color:red;><strong>".$sum_of_total."</td>
                                            <td style=color:red;><strong>".$sum_of_gross."</td>
                                            <td style=color:red;><strong>".$sum_of_tithe."</td>
                                            <td style=color:red;><strong>".$sum_of_net."</td>
                                            <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                            <td style=color:red;><strong>".$sum_of_credit."</td>
                                            <td style=color:red;><strong>".$sum_of_balance."</td>
                                            </tr>";
                                } else if($week == 4){
                                    echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td><strong>".$totalwe2."</td><td><strong>".$totalwe3."</td><td><strong>".$totalwe4."</td><td></td>
                                        <td><strong>".$sum_of_total."</td>
                                            <td style=color:red;><strong>".$sum_of_gross."</td>
                                            <td style=color:red;><strong>".$sum_of_tithe."</td>
                                            <td style=color:red;><strong>".$sum_of_net."</td>
                                            <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                            <td style=color:red;><strong>".$sum_of_credit."</td>
                                            <td style=color:red;><strong>".$sum_of_balance."</td>

                                        </tr>";
                                } else if($week == 5){
                                    echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td style=color:red;><strong>".$totalwe3."</td><td><strong>".$totalwe4."</td><td><strong>".$totalwe5."</td><td></td>
                                            <td style=color:red;><strong>".$sum_of_total."</td>
                                            <td style=color:red;><strong>".$sum_of_gross."</td>
                                            <td style=color:red;><strong>".$sum_of_tithe."</td>
                                            <td style=color:red;><strong>".$sum_of_net."</td>
                                            <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                            <td style=color:red;><strong>".$sum_of_credit."</td>
                                            <td style=color:red;><strong>".$sum_of_balance."</td>
                                        </tr>";
                                }
                            $totalwe1=0;
                            $totalwe2=0;
                            $totalwe3=0;
                            $totalwe4=0;
                            $totalwe5=0;
                            $stotal=0;
                            $count=0;

                            //zero
                            $sum_of_total=0;
                            $sum_of_gross=0;
                            $sum_of_tithe=0;
                            $sum_of_net=0;
                            $sum_of_subsidy=0;
                            $sum_of_credit=0;
                            $sum_of_balance=0;
                        }

                        ?>
                     
                        <?php

                            if($week == 1){
                                echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                        <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td></td><strong><td style=color:red;>".$oat_totalwe1."</td><td></td>
                                            <td style=color:red;><strong>".$oat_total."</td>
                                            <td style=color:red;><strong>".$oat_gross."</td>
                                            <td style=color:red;><strong>".$oat_tithe."</td>
                                            <td style=color:red;><strong>".$oat_net."</td>
                                            <td style=color:red;><strong>".$oat_subsidy."</td>
                                            <td style=color:red;><strong>".$oat_credit."</td>
                                            <td style=color:red;><strong>".$oat_balance."</td>
                                            </tr>";
                                             echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>";
                            } else if($week == 2){
                                echo "     <td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                        <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td style=color:red;><strong>".$oat_totalwe2."</td><td></td>
                                            <td style=color:red;><strong>".$oat_total."</td>
                                            <td style=color:red;><strong>".$oat_gross."</td>
                                            <td style=color:red;><strong>".$oat_tithe."</td>
                                            <td style=color:red;><strong>".$oat_net."</td>
                                            <td style=color:red;><strong>".$oat_subsidy."</td>
                                            <td style=color:red;><strong>".$oat_credit."</td>
                                            <td style=color:red;><strong>".$oat_balance."</td>
                                            </tr>";
                                             echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>";
                            } else if($week == 3){
                                 echo "
                                        <td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                        <tr><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td><strong>".$oat_totalwe2."</td><td><strong>".$oat_totalwe3."</td><td></td>
                                            <td style=color:red;><strong>".$oat_total."</td>
                                            <td style=color:red;><strong>".$oat_gross."</td>
                                            <td style=color:red;><strong>".$oat_tithe."</td>
                                            <td style=color:red;><strong>".$oat_net."</td>
                                            <td style=color:red;><strong>".$oat_subsidy."</td>
                                            <td style=color:red;><strong>".$oat_credit."</td>
                                            <td style=color:red;><strong>".$oat_balance."</td>
                                            </tr>";
                                             echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>";
                            } else if($week == 4){
                                  echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                        <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td><strong>".$oat_totalwe2."</td><td><strong>".$oat_totalwe3."</td><td><strong>".$oat_totalwe4."</td><td></td>
                                            <td style=color:red;><strong>".$oat_total."</td>
                                            <td style=color:red;><strong>".$oat_gross."</td>
                                            <td style=color:red;><strong>".$oat_tithe."</td>
                                            <td style=color:red;><strong>".$oat_net."</td>
                                            <td style=color:red;><strong>".$oat_subsidy."</td>
                                            <td style=color:red;><strong>".$oat_credit."</td>
                                            <td style=color:red;><strong>".$oat_balance."</td>
                                            </tr>";
                                             echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>";
                            } else if($week == 5){
                                    echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                            <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td><strong>".$oat_totalwe2."</td><td><strong>".$oat_totalwe3."</td><td><strong>".$oat_totalwe4."</td><td>".$oat_totalwe5."</td><td></td>
                                            <td style=color:red;><strong>".$oat_total."</td>
                                            <td style=color:red;><strong>".$oat_gross."</td>
                                            <td style=color:red;><strong>".$oat_tithe."</td>
                                            <td style=color:red;><strong>".$oat_net."</td>
                                            <td style=color:red;><strong>".$oat_subsidy."</td>
                                            <td style=color:red;><strong>".$oat_credit."</td>
                                            <td style=color:red;><strong>".$oat_balance."</td>

                                            </tr>";
                                            echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>";

                            } 
              }

              
            

                function dateRange($begin, $end, $interval = null)
                    {
                        $begin = new DateTime($begin);
                        $end = new DateTime($end);
                        // Because DatePeriod does not include the last date specified.
                        $end = $end->modify('+1 day');
                        $interval = new DateInterval($interval ? $interval : 'P1D');

                        return iterator_to_array(new DatePeriod($begin, $interval, $end));
                    }

                ?>     
                    
                    
                      </tbody>   
                    </table>
                </div>
            <!-- /.box-body -->
            </div>
          <!-- /.form-group -->
        </form>
      </div>
    </div>
<!-- ./wrapper -->
<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>

<script type="text/javascript">
  $(function () {
    $('#tblData').DataTable()
    $('#tblData').DataTable({
      'paging'      : true,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : true
    })
  })
</script>
<script type="text/javascript">
  function exportTableToExcel(tableID, filename){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    var date_range = document.getElementById(reservation);
    // Specify file name
    filename = filename?filename+'.xls':'summary.xls';
    // Create download link element
    downloadLink = document.createElement("a");
    document.body.appendChild(downloadLink);
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
        // Setting the file name
        downloadLink.download = filename;
        //triggering the function
        downloadLink.click();
    }
}
</script>
</body>
</html>
