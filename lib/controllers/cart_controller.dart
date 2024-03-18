import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  //GetX need observable variables
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  //not observable
  var testAmount = 0;

  addToCart(Product product) {
    cartItems.add(product);

    //below is GetBuilder needed
    testAmount = totalPrice as int;
    update();
  }
}
