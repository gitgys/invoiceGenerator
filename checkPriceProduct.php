<?php
  if(!isset($_POST['submit'])){
    echo "error";
  }else {
    $name = $_POST['name'];
    $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
    $query = "SELECT * FROM products WHERE name = '$name'";
    $executeQuery = mysqli_query($connection, $query);

    if($executeQuery == true){
      $result = mysqli_fetch_array($executeQuery, MYSQLI_BOTH);
      if($result != null){
        $price = $result['unit_price'];
        echo $price;
      }else {
        echo "error";
      }
    }else {
      echo "error2";
    }
  }

 ?>
