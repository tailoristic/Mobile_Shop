import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/screens/cart/controllers/cart_controller.dart';
import 'package:shopping_cart/screens/cart/widget/cart_card.dart';
import 'package:shopping_cart/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                if (cartController.cartList.length == 0) {
                  return const Center(
                    child: const Text(
                      "CART EMPTY",
                      style: const TextStyle(
                        fontSize: 21.0,
                        color: AppTheme.kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: cartController.cartList.length,
                  itemBuilder: (context, index) {
                    return CartCard(
                      productModel: cartController.cartList[index],
                      onRemove: () {
                        cartController.deleteCartAt(
                          productModel: cartController.cartList[index],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: Container(
          height: 70.0,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFF515764),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: "Total Amount:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0,
                    ),
                    children: [
                      TextSpan(
                        text: " ₹ " + cartController.cartTotal.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF3939),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                title: "Checkout",
                height: 40.0,
                width: 100.0,
                textSize: 16.0,
                onTap: () {
                  // TO CHECKOUT PAGE
                },
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
