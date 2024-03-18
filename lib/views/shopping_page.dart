import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_online_shop/controllers/cart_controller.dart';
import 'package:getx_online_shop/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${controller.products[index].productDescription}',
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                            Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(
                                          Icons.check_box_outline_blank_rounded,
                                        ),
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          //TODO: Understand GetBuilder
          // GetBuilder<CartController>(
          //   builder: (controller) {
          //     return Text(
          //       'Total amount: ${controller.testAmount}',
          //       style: TextStyle(
          //         fontSize: 32,
          //         color: Colors.white,
          //       ),
          //     );
          //   },
          // ),
          //TODO: Understand GetX
          // GetX<CartController>(builder: (controller) {
          //   return Text(
          //     'Total amount: ${controller.totalPrice}',
          //     style: TextStyle(fontSize: 32, color: Colors.white),
          //   );
          // }),
          //TODO: Understand Obx
          Obx(() {
            return Text(
              'Total amount: ${cartController.totalPrice}',
              style: TextStyle(fontSize: 32, color: Colors.white),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
