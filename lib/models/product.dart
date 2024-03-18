import 'package:get/get.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
  });

  final isFavorite = false.obs;
  final quantity = 1.obs;
}
