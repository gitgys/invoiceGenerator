<?php
//shton ne database te dhenat e adreses(line, city, state) ne tabelen 'addresses'
function insertAddress($street, $city, $state){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "INSERT INTO addresses(line, city, state) VALUES('$street', '$city', '$state')";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    return getAddressId();
  }else{
    return "error";
  }
  mysqli_close($connection);
}

//merr nga databasa id-ne e adreses te shtuar se fundmi ne tabelen 'addresses'
function getAddressId(){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "SELECT MAX(id) FROM addresses";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    $result = mysqli_fetch_array($executeQuery, MYSQLI_BOTH);
    if($result == null){
      return "error";
    }else{
      return $result[0];
    }
  }
  mysqli_close($connection);
}

//shton ne database te dhenat e fatures(title, status, address_id, created_date, due_date) ne tabelen 'invoices'
function insertInvoice($title, $status, $addressId, $createdDate, $dueDate){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "INSERT INTO invoices(title, status, address_id, created_date, due_date) VALUES('$title', '$status', $addressId, '$createdDate', '$dueDate')";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    return getInvoiceId();
  }else{
    return "error";
  }
  mysqli_close($connection);
}

//merr nga databasa id-ne e fatures se shtuar se fundmi ne tabelen 'invoices'
function getInvoiceId(){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "SELECT MAX(id) FROM invoices";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    $result = mysqli_fetch_array($executeQuery, MYSQLI_BOTH);
    if($result == null){
      return "error";
    }else{
      return $result[0];
    }
  }
  mysqli_close($connection);
}

//shton ne database te dhenat e produkteve te fatures (invoice_id, product_id, quantity, comment) ne tabelen invoices_products
function insertInvoicesProducts($invoiceId, $productId, $quantity, $comment){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "INSERT INTO invoices_products(invoice_id, product_id, quantity, comment) VALUES($invoiceId, $productId, $quantity, '$comment')";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    $checkUpdate = updateProcduct($productId, $quantity);
    if($checkUpdate == "error"){
      return "error";
    }else if($checkUpdate == "vendosni sasi me te vogel te produktit"){
      return "vendosni sasi me te vogel te produktit";
    }
  }
  mysqli_close($connection);
}

//perditeson numrin (quantity_in_stock) e produkteve ne tabelen 'products'
function updateProcduct($productId, $quantity){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $totalQuantity = getTotalQuantityOfProduct($productId);
  if($totalQuantity < $quantity){
    return "vendosni sasi me te vogel te produktit";
  }else{
    $query = "UPDATE products set quantity_in_stock = quantity_in_stock - $quantity where id = $productId";
    $executeQuery = mysqli_query($connection, $query);
    if(!$executeQuery){
      return "error";
    }
  }
  mysqli_close($connection);
}

//merr nga databasa numrin (quantity_in_stock) e produktit nga tabela 'products'
function getTotalQuantityOfProduct($productId){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "SELECT quantity_in_stock FROM products where id = $productId";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    $result = mysqli_fetch_array($executeQuery, MYSQLI_BOTH);
    if($result == null){
      return 0;
    }else {
      return $result[0];
    }
  }else {
    return 0;
  }
}

//merr nga databasa id-ne e produktit nga tabela 'products'
function getProductId($name){
  $connection = mysqli_connect('localhost', 'root', '', 'invoice_generator');
  $query = "SELECT id FROM products where name = '$name'";
  $executeQuery = mysqli_query($connection, $query);
  if($executeQuery){
    $result = mysqli_fetch_array($executeQuery, MYSQLI_BOTH);
    if($result == null){
      return "error";
    }else {
      return $result[0];
    }
  }else {
    return "error";
  }
  mysqli_close($connection);
}
 ?>
