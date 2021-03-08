var idProductItem = 0;
var total = 0;

//shton produktin me fushat perkatese, fushat per:emrin, sasine, komentin
function addProductItem(){
  var productItem ='<div class="product-item">';
  productItem +='<div class="product">';
  productItem += '<label for="product" class="label-product">Product</label>';
  productItem += '<select name="product" class="input-product" id="input-product'+idProductItem+'" onchange="clearInputQuantityAndUpdateTotal('+idProductItem+')">';
  productItem += '</select>';
  productItem += '</div>';
  productItem += '<div class="quantity">';
  productItem += '<label for="quantity" class="label-quantity">Quantity</label>';
  productItem += '<input type="number" name="quantity" placeholder="Quantity" class="input-quantity" id="input-quantity'+idProductItem+'" onkeyup="getTotalPriceForProduct('+idProductItem+'); updateTotal()">';
  productItem += '</div>';
  productItem += '<div class="description">';
  productItem += '<label for="description" class="label-description">Description</label>';
  productItem += '<input type="text" name="description" placeholder="Description" class="input-description" id="input-description'+idProductItem+'">';
  productItem += '</div>';
  productItem += '</div>';

  $("#products").append(productItem);

  fillDropdownList();
  idProductItem++;
}

//mbush listen me produktet qe e kane sasine me te madhe se nje
function fillDropdownList(){
  $.post("getProductsList.php", {submit: true}).done(function(data){
    if(data == "error"){
      alert("Error!");
    }else{
      var products = JSON.parse(data);
      var option;
      for(var product = 0; product<products.length; product++){
        option = '<option value="'+products[product].name+'">'+products[product].name+'(x'+products[product].price+')</option>';
        $(".input-product").append(option);
      }
    }
  });
}

//kthen cmimin total per nje produkt, pra (cmimi i produktit) * (sasia e produktit)
async function getTotalPriceForProduct(id){
  var name = $("#input-product"+id).val();
  var quantity = $("#input-quantity"+id).val();
  if(quantity.trim() == "" || quantity < 0){
    quantity = 0;
  }

  await $.post("checkPriceProduct.php", {submit:true, name: name})
  .done(function(data){
    if(data == "error"){
      alert("Error!");
      price = 0;
    }else{
      price = data;
    }
  });
  return price*quantity;
}

//perditeson cmimn total te fatures
async function updateTotal(){
  var total = 0;
  for(var i = 0; i<idProductItem; i++){
    total += await getTotalPriceForProduct(i);
  }
  $("#total").html("<h3>Total: "+parseFloat(total)+"</h3>");
}

//ne rast se dropdown-list-a ndryshon produktin e selectuar,
//fusha e sasise per ate produkt behet zero dhe perditesohet totali
function clearInputQuantityAndUpdateTotal(id){
  $("#input-quantity"+id).val("");
  updateTotal();
}

//konstruktor per objektin Produkt, i cili permban emrin, sasine dhe pershkrimin e produktit
function Product(name, quantity, description){
  this.name = name;
  this.quantity = quantity;
  this.description = description;
}

//shton te dhenat e fatures ne database
//veprimet e butonit save
function save(){
  var invoice = $("#input-name").val().trim();
  var dueDate = $("#input-dueDate").val().trim();
  var street = $("#input-street").val().trim();
  var city = $("#input-city").val().trim();
  var state = $("#input-state").val().trim();
  if(invoice == "" || dueDate == "" || street == "" || city == "" || state == ""){
    alert("Vendosni te gjitha te dhenat e fatures!");
    return;
  }

  var arrayWithProducts = [];
  var product;
  var name;
  var quantity;
  var description;

  if(idProductItem == 0){
    alert("Vendosni te pakten nje produkt!");
    return;
  }

  for(var i=0; i<idProductItem; i++){
    name = $("#input-product"+i).val();
    quantity = $("#input-quantity"+i).val();
    if(quantity.trim() == ""){
      quantity = 0;
      alert("Vendosni sasine e produktit!");
      return;
    }
    if(quantity > 0){
      description = $("#input-description"+i).val();
      product = new Product(name, quantity, description);
      arrayWithProducts.push(product);
    }
  }

  var products = JSON.stringify(arrayWithProducts);
  $.post("save.php",{
    submit: true,
    products: products,
    invoice: invoice,
    dueDate: dueDate,
    street: street,
    city: city,
    state: state
  }).done(function(data){
    if(data == "error"){
      alert("Error!");
    }else if(data == "vendosni sasi me te vogel te produktit"){
      alert("Vendosni sasi me te vogel te produktit");
    }else if(data == "success"){
      alert("Fatura u krijua!");
      window.location = "index.php";
    }
  });
}

$(document).ready(function(){
  $("#button-save").on("click", function(){
    save();
  })
});
