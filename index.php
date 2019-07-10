
<?php
session_start();
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
if (empty($_POST['id']) ) {
$error = "ID not Found! Please look for Sir Elli.";
}
else
{
// Define $username and $password
$id=$_POST['id'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
$con = pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=789456321");
$query = ("select * from users where rf_id='$id'");

$result = pg_query($con,$query);


if (pg_affected_rows($result) == 1) {
  session_start(); // Starting Session
  $myrow = pg_fetch_assoc($result);
  $name = $myrow['username'];
  $_SESSION['login_user']=$id; // Initializing Session
  $_SESSION['name']=$name; // Initializing Session
  header("location:confirm.php"); // Redirecting To Other Page
} else {
  $error = "ID not Found! Please look for Sir Elli.";
}
pg_close($con);
}
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Store| Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <!-- HTML5 Shim and Respond.js sIE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="#"><b>University Store</b></a>
  </div>
  <!-- User name -->
  <div class="lockscreen-name">Daily Time Record</div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image" id="picture">
     <img src="dist/img/aup.png" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials" action="" method="POST">
      <div class="input-group">  
        <input type="text" name="id" id="id" class="form-control" placeholder="  TAP RFID" >
        
        <div class="input-group-btn">

          <button type="submit" name="submit" class="btn"><i class="fa fa-arrow-right text-muted" ></i></button>
        </div>

      </div>
    </form>

    <script>

      window.onload = function() {
  document.getElementById("id").focus();
};

function show_image(src, width, height, alt) {
    var img = document.createElement("img");
    img.src = src;
    img.width = width;
    img.height = height;
    img.alt = alt;

    //setup before functions

     document.getElementById("picture").insertChild(img);


   
}

;(function($){
    $.fn.extend({
        donetyping: function(callback,timeout){
            timeout = timeout || 1e3; // 1 second default timeout
            var timeoutReference,
                doneTyping = function(el){
                    if (!timeoutReference) return;
                    timeoutReference = null;
                    callback.call(el);
                };
            return this.each(function(i,el){
                var $el = $(el);
                // Chrome Fix (Use keyup over keypress to detect backspace)
                // thank you @palerdot
                $el.is(':input') && $el.on('keyup keypress paste',function(e){
                    // This catches the backspace button in chrome, but also prevents
                    // the event from triggering too preemptively. Without this line,
                    // using tab/shift+tab will make the focused element fire the callback.
                    if (e.type=='keyup' && e.keyCode!=8) return;
                    
                    // Check if timeout has been set. If it has, "reset" the clock and
                    // start over again.
                    if (timeoutReference) clearTimeout(timeoutReference);
                    timeoutReference = setTimeout(function(){
                        // if we made it here, our timeout has elapsed. Fire the
                        // callback
                        doneTyping(el);
                    }, timeout);
                }).on('blur',function(){
                    // If we can, fire the event since we're leaving the field
                    doneTyping(el);
                });
            });
        }
    });
})(jQuery);

$('#example').donetyping(function(){
  $('#example-output').text('Event last fired @ ' + (new Date().toUTCString()));
});
</script>



    <!-- /.lockscreen credentials -->

  </div>
  <div class="text-center">
   <font color="red"> <p  style="color=red;"><?php   echo $error; ?></p></font>

  </div>


  <!-- /.lockscreen-item -->

  <div class="lockscreen-footer text-center">
     Diligent hands will rule, but laziness ends in forced labor.<br><b>Proverbs 12:24</b>
      
  </div>
</div>
<!-- /.center -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>


