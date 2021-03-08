<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
  </head>
  <body>
    <header>
      <div class="header-info">
        <div class="name-info">
          <label for="name" id="label-name">Invoice</label>
          <input type="text" name="name" id="input-name" placeholder="Invoice"><br>
        </div>

        <div class="date-info">
          <label for="dueData" id="label-dueData">Due Date</label>
          <input type="date" name="dueData" id="input-dueDate">
        </div>
      </div>

      <div class="invoice">
        <h2>INVOICE</h2>
      </div>
    </header>

    <div class="addresInfo">
      <h5>Address Information</h5>
      <div class="labels-address">
        <label for="street" id="label-street">Street</label>
        <label for="city" id="label-city">City</label>
        <label for="state" id="label-state">State</label>
      </div>

      <div class="input-address">
        <input type="text" name="street" placeholder="Street" id="input-street"><br>
        <input type="text" name="city" placeholder="City" id="input-city"><br>
        <input type="text" name="state" placeholder="State" id="input-state"><br>
      </div>
    </div>


    <div class="products" id="products">
      <h5>Products</h5>
    </div>


    <div class="add-and-total">
      <div class="button-add">
        <button type="button" name="add" class="btn btn-success" id="button-add" onclick="addProductItem()">+Add</button>
      </div>

      <div class="total">
        <h3 id="total">Total: 0</h3>
      </div>
    </div>

    <div class="button-save">
      <button type="button" name="save" class="btn btn-success" id="button-save">Save</button>
    </div>

  </body>
</html>
