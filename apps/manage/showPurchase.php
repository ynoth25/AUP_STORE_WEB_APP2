<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Data Tables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
	<title></title>
</head>
<body>
	
<?php

          


               if(isset($_GET['date'])){
                $po_date = $_GET['date'];
              $supplier = $_GET['supplier'];
              $merchandiser = $_GET['merchandiser'];
              
              $con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");

          

                $query5 = ("select 
                    purchase_order.product_code,
                    product.description description,
                    po_quantity,
                    users.name po_by,
                    supplier.supplier_name supplier,
                    po_date

                    from purchase_order
                   
                    INNER JOIN product ON product.product_code = purchase_order.product_code
                    INNER JOIN users ON users.user_id = purchase_order.po_by
                    INNER JOIN supplier ON supplier.supplier_id = purchase_order.supplier_id
                     where purchase_order.po_date = '$po_date'::DATE and purchase_order.supplier_id='$supplier' ");
                $result1 = pg_query($con,$query5);
              ?>
             


      
                    <?php
                    
                     
                    
                     
                    while($row = pg_fetch_assoc($result1)){ 

                        $product_code = $row['product_code'];
                        $prod_desc = $row['description'];
                        $po_quantity = $row['po_quantity'];
                        $po_by = $row['po_by'];
                        $po_date= $row['po_date'];

                    ?> 
                        <tr>
                            <td><?php echo $product_code; ?></td>
                            <td><?php echo $prod_desc; ?></td>
                            <td><?php echo $po_quantity; ?></td>
                            <td><?php echo $po_by; ?></td>
                            <td><?php echo $po_date; ?></td>
                        </tr>
                <?php   }  //End of while loop

              }
                ?>     
                    
                    
                      </tbody>   
     
                </table>

	
</body>

<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- page script -->
<script>
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
</html>