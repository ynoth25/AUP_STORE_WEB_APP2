  
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Individual Timecard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  

  <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <script>
function showUser(str) {
    if (str == "") {
        document.getElementById("demo").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","manage/load.php?q="+str,true);
        xmlhttp.send();
    }

    
}

function showHdd(str)
{
  if (str == "") {
        document.getElementById("hdd").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("hdd").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","manage/hdd.php?q="+str,true);
        xmlhttp.send();
    }
}

function showRemarks(str)
{
  if (str == "") {
        document.getElementById("remarks").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("remarks").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","manage/remarks.php?q="+str,true);
        xmlhttp.send();
    }
}

function showInventory(str)
{
 
   if (str == "") {
        document.getElementById("example1").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("example1").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","manage/showInventory.php?q="+str,true);
        xmlhttp.send();
    }
}
</script>



</head>
<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body >
<!-- Site wrapper -->
<div class="wrapper">

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
      
       <!-- right column -->
        <div class="col-md-8"> 
          <div class="box box-primary">
            <div class="box-header ">
             <form action="summary.php" method="POST">
              <div class="form-group">
                <label>Date Range:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar-o"></i>
                  </div>

                  <input type="text" class="form-control pull-right" name="date_range" id="reservation">

                </div>

                <!-- /.input group -->
              </div>
              <button type="submit" id="search" name="search" class="btn btn-info pull-left" value="Submit">Search</button>
              </form>
              <button id="export" onclick="exportTableToExcel('tblData',reservation.value+' Labor')" name="export" class="btn btn-success pull-right">Export to CSV/Excel</button>
            
            <!-- /.box-header -->
            <div class="box-body" id="demo">
             
              
            </div>
            <!-- /.box-body -->
          </div>
        </div>

      <!-- /.box -->
     
  
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Labor Summary</h3>
            </div>

            <!-- /.box-header -->
            <div class="box-body">

              <?php
              $total = 0;
              $temp_name = '';
               if(isset($_POST['search'])){
              $q = $_POST['date_range'];
                list($from, $to) = preg_split('/(:|-|\*|=)/', $q,-1, PREG_SPLIT_NO_EMPTY);


                $from= strtotime($from);
                $to= strtotime($to);

                $from2 = date('Y-m-d',$from);
                $to2 = date('Y-m-d',$to);

                $con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
                $query5 = ("select users.name user_name, sum (round(extract (epoch from ((timeout::time - timein::time)/3600))::numeric,2)) as total from dtr 
                  INNER JOIN users ON users.rf_id = dtr.rf_id
                  where transact_date between '$from2'::timestamp and '$to2'::timestamp group by dtr.rf_id,user_name order by user_name;");
                $result1 = pg_query($con,$query5);
                
               // echo $query5;
              ?>
              <table id="tblData" class="table table-hover" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>ID Number</th>
                            <th>Hours Worked</th>
                            
                        </tr>
                    </thead>
                    <tfoot>
                        
                    </tfoot>
                    <tbody> 
                    <?php

                    while($row = pg_fetch_assoc($result1)){
                        $rf_id = $row['user_name'];
                        $total= $row['total'];
                    ?> 
                        <tr>
                       
                            <td><?php echo $rf_id; ?></td>
                            <td><?php echo $total; ?></td>
                            
                            
                        </tr>
                <?php   } 

              }

              if(isset($_POST['export'])){
                $q = $_POST['date_range'];
                list($from, $to) = preg_split('/(:|-|\*|=)/', $q,-1, PREG_SPLIT_NO_EMPTY);


                $from= strtotime($from);
                $to= strtotime($to);

                $from2 = date('Y-m-d',$from);
                $to2 = date('Y-m-d',$to);
                $export = "COPY (select 
                    product.description prod_desc,
                    inventory.on_hand,
                    inventory.physical_count,
                    users.username counted_by,
                    inventory.date_counted

                    from inventory
                    INNER JOIN product ON product.product_code = inventory.product_code
                    INNER JOIN users ON users.user_id = inventory.counted_by where date_counted between '$from2'::Date and '$to2'::Date) TO 'D:/Store/inventory/$from2-$to2.csv' DELIMITER ',' CSV HEADER";

                     $result2 = pg_query($con,$export);
                        echo '<script>window.location.href="inventory.php"</script>';
                     
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

<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="../bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="../bower_components/moment/min/moment.min.js"></script>
<script src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="../bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="../plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

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
    $('#example1').DataTable()
    $('#example2').DataTable({
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
