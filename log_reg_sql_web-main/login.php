<?php
$host = "localhost";
$port = "5432";
$dbname = "persona";
$user = "postgres";
$password = "postgres"; 
$connection_string = "host={$host} port={$port} dbname={$dbname} user={$user} password={$password} ";
$dbconn = pg_connect($connection_string);
if(isset($_POST['submit'])&&!empty($_POST['submit'])){
    
    $hashpassword = md5($_POST['pwd']);
    $sql ="select *from public.persona where correo = '".pg_escape_string($_POST['correo'])."' and password ='".$hashpassword."'";
    $data = pg_query($dbconn,$sql); 
    $login_check = pg_num_rows($data);
    if($login_check > 0){ 
        
        echo "Login y";    
    }else{
        
        echo "Datos invalidos";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Topicos Registro y Login persona </title>
  <meta name="keywords" content="">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>Login</h2>
  <form method="post">
  
     
    <div class="form-group">
      <label for="email">correo:</label>
      <input type="email" class="form-control" id="correo" placeholder="Enter correo" name="correo">
    </div>
    
     
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
     
    <input type="submit" name="submit" class="btn btn-primary" value="Submit">
  </form>
</div>
</body>
</html>