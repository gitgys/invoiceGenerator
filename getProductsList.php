<?php
  if(isset($_POST['submit'])){
    $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
    $query = "SELECT * FROM products WHERE quantity_in_stock > 0";
    $executeQuery = mysqli_query($connection, $query);

    if($executeQuery == true){

      $products = array();
      while($resultForEachRow = mysqli_fetch_array($executeQuery, MYSQLI_BOTH)){
        if($resultForEachRow != null){

          $name = $resultForEachRow['name'];
          $price = $resultForEachRow['unit_price'];
          $quantity = $resultForEachRow['quantity_in_stock'];
          $product = array("name" => $name, "price" => $price);
          array_push($products, $product);
        }else{
          break;
        }
      }
      echo json_encode($products);
    }else {
      echo "error";
    }
    mysqli_close($connection);
  }else {
    echo "error";
  }
 ?>
