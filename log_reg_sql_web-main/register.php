<?php
$host = "localhost";
$port = "5432";
$dbname = "persona";
$user = "postgres";
$password = "123456"; 
$connection_string = "host={$host} port={$port} dbname={$dbname} user={$user} password={$password} ";
$dbconn = pg_connect($connection_string);
if(isset($_POST['submit'])&&!empty($_POST['submit'])){
    
      $sql = "insert into public.persona(nombre,telefono,correo,password,direccion,genero)values('".$_POST['nombre']."','".$_POST['telefono']."','".$_POST['correo']."','".md5($_POST['pwd'])."','".$_POST['direccion']."','".$_POST['genero']."')";
    $ret = pg_query($dbconn, $sql);
    if($ret){
        
            echo "Datos Guardados";
    }else{
        
            echo "Datos no guardados";
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
  <h2>Registro </h2>
  <form method="post">
  
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" class="form-control" id="nombre" placeholder="Enter nombre" name="nombre" requuired>
    </div>

     

     <div class="form-group">
      <label for="telefono">Telefono :</label>
      <input type="text" class="form-control" id="telefono " placeholder="Enter telefono " name="telefono " requuired>
    </div>
    
    <div class="form-group">
      <label for="email">Correo:</label>
      <input type="email" class="form-control" id="correo" placeholder="Enter correo" name="correo">
    </div>
    
    
    
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>

     <div class="form-group">
      <label for="direccion ">Direccion  :</label>
      <input type="text" class="form-control" id="direccion  " placeholder="Enter direccion  " name="direccion  " requuired>
    </div>
    
    <div class="form-group">
      <label for="email">genero:</label>
      <input type="email" class="form-control" id="genero" placeholder="Enter genero" name="genero">
    </div>
     
    <input type="submit" name="submit" class="btn btn-primary" value="Submit">
  </form>
</div>
</body>
</html>