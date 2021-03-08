<?php
if(isset($_POST['submit'])){
  require_once("functionsOfSave.php");
  $invoice = $_POST['invoice'];
  $createdDate = date("Y-m-d");
  $dueDate = $_POST['dueDate'];
  $street = $_POST['street'];
  $city = $_POST['city'];
  $state = $_POST['state'];
  $products = $_POST['products'];
  $jsonProducts = json_decode($products, true);
  $productsLength = count($jsonProducts);

  $addressId = insertAddress($street, $city, $state);
  if($addressId == "error"){
    echo "error";
    return;
  }

  $invoiceId = insertInvoice($invoice, 'Created', $addressId, $createdDate, $dueDate);

  if($invoiceId == "error"){
    echo "error";
    return;
  }

  for($i=0; $i<$productsLength; $i++){
    $name = $jsonProducts[$i]["name"];
    $productId = getProductId($name);
    $quantity = $jsonProducts[$i]["quantity"];
    $comment = $jsonProducts[$i]["description"];

    $checkForError = insertInvoicesProducts($invoiceId, $productId, $quantity, $comment);
    if($checkForError == "error"){
      echo "error";
      return;
    }else if($checkForError == "vendosni sasi me te vogel te produktit"){
      echo "vendosni sasi me te vogel te produktit";
      return;
    }
  }
  echo "success";
}
 ?>
