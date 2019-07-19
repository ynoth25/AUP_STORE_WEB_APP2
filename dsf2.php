
<?php
if(isset($_POST['date_range'])){
   $q = $_POST['date_range'];

   $line ="_________";
 } else {

 }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Top Navigation</title>
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
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="index2.html" class="navbar-brand"><b>AUP</b>DTR</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Labor Report <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Summary Report</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
                <li class="divider"></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">
            </div>
          </form>
        </div>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- Messages: style can be found in dropdown.less-->
            <li class="dropdown messages-menu">
              <!-- Menu toggle button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-envelope-o"></i>
                <span class="label label-success">4</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 4 messages</li>
                <li>
                  <!-- inner menu: contains the messages -->
                  <ul class="menu">
                    <li><!-- start message -->
                      <a href="#">
                        <div class="pull-left">
                          <!-- User Image -->
                          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <!-- Message title and timestamp -->
                        <h4>
                          Support Team
                          <small><i class="fa fa-clock-o"></i> 5 mins</small>
                        </h4>
                        <!-- The message -->
                        <p>Why not buy a new awesome theme?</p>
                      </a>
                    </li>
                    <!-- end message -->
                  </ul>
                  <!-- /.menu -->
                </li>
                <li class="footer"><a href="#">See All Messages</a></li>
              </ul>
            </li>
            <!-- /.messages-menu -->

            <!-- Notifications Menu -->
            <li class="dropdown notifications-menu">
              <!-- Menu toggle button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o"></i>
                <span class="label label-warning">10</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 10 notifications</li>
                <li>
                  <!-- Inner Menu: contains the notifications -->
                  <ul class="menu">
                    <li><!-- start notification -->
                      <a href="#">
                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                      </a>
                    </li>
                    <!-- end notification -->
                  </ul>
                </li>
                <li class="footer"><a href="#">View all</a></li>
              </ul>
            </li>
            <!-- Tasks Menu -->
            <li class="dropdown tasks-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-flag-o"></i>
                <span class="label label-danger">9</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 9 tasks</li>
                <li>
                  <!-- Inner menu: contains the tasks -->
                  <ul class="menu">
                    <li><!-- Task item -->
                      <a href="#">
                        <!-- Task title and progress text -->
                        <h3>
                          Design some buttons
                          <small class="pull-right">20%</small>
                        </h3>
                        <!-- The progress bar -->
                        <div class="progress xs">
                          <!-- Change the css width attribute to simulate progress -->
                          <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                            <span class="sr-only">20% Complete</span>
                          </div>
                        </div>
                      </a>
                    </li>
                    <!-- end task item -->
                  </ul>
                </li>
                <li class="footer">
                  <a href="#">View all tasks</a>
                </li>
              </ul>
            </li>
            <!-- User Account Menu -->
            <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <!-- The user image in the navbar-->
                <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                <span class="hidden-xs">AUP DSF</span>
              </a>
              <ul class="dropdown-menu">
                <!-- The user image in the menu -->
                <li class="user-header">
                  <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                  <p>
                    AUP Department of Student Finance
                    <small>Member since Nov. 2012</small>
                  </p>
                </li>
                <!-- Menu Body -->
                <li class="user-body">
                  <div class="row">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </div>
                  <!-- /.row -->
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="content">
      <!-- Content Header (Page header) -->
      <!-- Main content -->
      <section class="content">
        <div class="box box-default">
          <div class="box-header with-border">
            <h3 class="box-title">Labor Report</h3>
            <form method="POST" action="dsf2.php">
            	<div class="form-group">
            		<label>Date Range:</label>
            		<div class="input-group">
            			<div class="input-group-addon">
                    		<i class="fa fa-calendar-o"></i>
                  		</div>
                  		<input type="text" class="form-control pull-left" name="date_range" id="reservation" value="<?php echo $q; ?>">
            		</div>
            	</div>
            	<button type="submit" id="search" name="search" class="btn btn-info pull-left" value="Submit">Search</button>
            </form>
            <button id="export" onclick="exportTableToExcel('tblData',reservation.value+' Labor')" name="export" class="btn btn-success pull-right">Export to CSV/Excel</button>
          </div>
          <!-- /.box-body -->
        </div>
       <div class="box-body">

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
            ?>

            <table id="tblData" class="table table-bordered table-hover" cellspacing="0" width="100%" border="10%">
                <thead>
                    <tr>
                        <th>ID Number</th>
                        <th>Course</th>
                        <th>Name</th>
                        <th>Subsidy</th>
                        
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
                        <th>Rate</th>
                        <th>Total</th>
                        <th>Gross</th>
                        <th>Tithe</th>
                        <th>Net</th>
                        <th>Subsidy</th>
                        <th>Credit</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        while($row4 = pg_fetch_assoc($result_dept)) {

                            $dept_id = $row4['id'];
                            $department = $row4['department'];
                            echo"<tr><td></td><td></td><td><strong>".$department."</strong></td></tr>";
                            $id_query = "select rf_id,user_id,
                            username, course.course course,rate,dormitory,
                            units,is_caf,required_hours from users
                            inner join course on users.course = course.id
                            where department='$dept_id' group by rf_id, 
                            course.course order by username;";

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
                                  if($dormitory != 16 &&$is_caf > 0){
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
                                  //echo "<td>".$rate."</td>";
                                  $hours_query = " select date_trunc('week',(transact_date + interval'1 day')) - interval '1 day' as week, sum (round(extract (epoch from ((timeout::time - timein::time)/3600))::numeric,2)) as total from dtr where rf_id='$rf_id' and transact_date between
                                      '$from2'::date and '$to2'::date group by 1";
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
                                            //counter to get subtotal Idea by Sir Arvin Ramos
                                            if($nweek == 1 && $nweek!=0){
                                                $totalwe1 +=$totalw1;
                                                $oat_totalwe1 +=$totalw1;
                                            } else if($nweek == 2 && $nweek!=0){
                                                $totalwe1 +=$totalw1;
                                                $totalwe2 +=$totalw2;

                                                $oat_totalwe1 +=$totalw1;
                                                $oat_totalwe2 +=$totalw2;
                                            } else if($nweek == 3 && $nweek!=0){
                                                $totalwe1 +=$totalw1;
                                                $totalwe2 +=$totalw2;
                                                $totalwe3 +=$totalw3;

                                                $oat_totalwe1 +=$totalw1;
                                                $oat_totalwe2 +=$totalw2;
                                                $oat_totalwe3 +=$totalw3;
                                            } else if($nweek == 4 && $nweek!=0){
                                                $totalwe1 +=$totalw1;
                                                $totalwe2 +=$totalw2;
                                                $totalwe3 +=$totalw3;
                                                 $totalwe4 +=$totalw4;

                                                $oat_totalwe1 +=$totalw1;
                                                $oat_totalwe2 +=$totalw2;
                                                $oat_totalwe3 +=$totalw3;
                                                $oat_totalwe4 +=$totalw4;

                                            } else {
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
                                            //count if required hours was met
                                            if($total2 >= $required_hours){
                                                $count++;
                                            }
                                            $i++;
                                        } // end of while (compute total hours per week)
                                            //if week has total
                                            if($stotal >= 0){
                                                $week = count($weekends);
                                                $loop = $week-$output;
                                                //print blank
                                                for($i=0; $i <=$loop-1;++$i){
                                                    echo "<td>-</td>";
                                                }
                                                //display subtotal
                                                echo "<td style=color:blue;>".$count."</td>";
                                                echo "<td style=color:blue;>".$rate."</td>";
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
                                                $stotal=0;
                                                $count=0;
                                                $output=0;
                                            }// end of if there is total
                                            echo "</tr>";
                            } //end of while (Users)
                            if($week == 1){
                                echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><strong><td style=color:red;>".$totalwe1."</td><td></td><td></td>
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
                                echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td></td><td></td>
                                    <td style=color:red;><strong>".$sum_of_total."</td>
                                    <td style=color:red;><strong>".$sum_of_gross."</td>
                                    <td style=color:red;><strong>".$sum_of_tithe."</td>
                                    <td style=color:red;><strong>".$sum_of_net."</td>
                                    <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                    <td style=color:red;><strong>".$sum_of_credit."</td>
                                    <td style=color:red;><strong>".$sum_of_balance."</td>
                                    </tr>";
                            }else if($week == 3){
                                    echo "<tr><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td style=color:red;><strong>".$totalwe3."</td><td></td><td></td>
                                        <td style=color:red;><strong>".$sum_of_total."</td>
                                        <td style=color:red;><strong>".$sum_of_gross."</td>
                                        <td style=color:red;><strong>".$sum_of_tithe."</td>
                                        <td style=color:red;><strong>".$sum_of_net."</td>
                                        <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                        <td style=color:red;><strong>".$sum_of_credit."</td>
                                        <td style=color:red;><strong>".$sum_of_balance."</td>
                                        </tr>";
                                } else if($week == 4){
                                    echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td style=color:red;><strong>".$totalwe3."</td><td style=color:red;><strong>".$totalwe4."</td><td></td><td></td>
                                        <td><strong>".$sum_of_total."</td>
                                        <td style=color:red;><strong>".$sum_of_gross."</td>
                                        <td style=color:red;><strong>".$sum_of_tithe."</td>
                                        <td style=color:red;><strong>".$sum_of_net."</td>
                                        <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                        <td style=color:red;><strong>".$sum_of_credit."</td>
                                        <td style=color:red;><strong>".$sum_of_balance."</td>
                                        </tr>";
                                } else if($week == 5){
                                    echo "<tr style=color:red;><td></td><td><strong>Sub Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$totalwe1."</td><td style=color:red;><strong>".$totalwe2."</td><td style=color:red;><strong>".$totalwe3."</td><td style=color:red;><strong>".$totalwe4."</td><td style=color:red;><strong>".$totalwe5."</td><td></td><td></td>
                                        <td style=color:red;><strong>".$sum_of_total."</td>
                                        <td style=color:red;><strong>".$sum_of_gross."</td>
                                        <td style=color:red;><strong>".$sum_of_tithe."</td>
                                        <td style=color:red;><strong>".$sum_of_net."</td>
                                        <td style=color:red;><strong>".$sum_of_subsidy."</td>
                                        <td style=color:red;><strong>".$sum_of_credit."</td>
                                        <td style=color:red;><strong>".$sum_of_balance."</td>
                                        </tr>";
                                }
                                //reset counter and values of subtotals
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
                        }//end of while (Department)
                        if($week == 1){
                                echo "<td></td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td><td>".$line."</td></h1>
                                    <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><strong><td style=color:red;>".$oat_totalwe1."</td><td></td><td></td>
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
                                        <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td style=color:red;><strong>".$oat_totalwe2."</td><td></td><td></td>
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
                                        <tr><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td style=color:red;><strong>".$oat_totalwe2."</td><td style=color:red;><strong>".$oat_totalwe3."</td><td></td><td></td>
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
                                        <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td style=color:red;><strong>".$oat_totalwe2."</td><td><strong>".$oat_totalwe3."</td><td style=color:red;><strong>".$oat_totalwe4."</td><td></td><td></td>
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
                                            <tr style=color:red;><td></td><td><strong>Over All Total: </strong></td><td></td><td></td><td style=color:red;><strong>".$oat_totalwe1."</td><td style=color:red;><strong>".$oat_totalwe2."</td><td style=color:red;><strong>".$oat_totalwe3."</td><td style=color:red;><strong>".$oat_totalwe4."</td><td style=color:red;>".$oat_totalwe5."</td><td></td><td></td>
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


                            function dateRange($begin, $end, $interval = null){
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
        <!-- /.box -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="container">
      <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.13
      </div>
      <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
      reserved.
    </div>
    <!-- /.container -->
  </footer>
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
