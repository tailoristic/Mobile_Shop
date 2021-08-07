import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/constants/size_constants.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/screens/cart/controllers/cart_controller.dart';
import 'package:shopping_cart/screens/cart/ui/cart_page.dart';
import 'package:shopping_cart/screens/products/controllers/product_controller.dart';
import 'package:shopping_cart/screens/products/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile Shop",
          style: TextStyle(
            color: Color(0xFF17CBF8),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => CartPage());
                },
                tooltip: "View Cart",
                icon: Icon(
                  Icons.shopping_bag_rounded,
                  color: AppTheme.kWhite,
                ),
              ),
              Obx(
                () => Visibility(
                  visible: cartController.cartList.length != 0,
                  child: Positioned(
                    right: 5.0,
                    child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      child: Center(
                        child: Text(
                          cartController.cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              firebaseController.signout();
            },
            tooltip: "Logout",
            icon: Icon(
              Icons.login_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SizeConstant.kDefaultPadding, vertical:10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "TOP TRENDING",
                  style: TextStyle(
                    color: AppTheme.kWhite,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GetX<ProductController>(
              init: ProductController(),
              initState: (_) {},
              builder: (controller) {
                if (controller.productsList.length == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        productModel: controller.productsList[index],
                        isFav: controller.productsList[index].isFav,
                        onCart: () {
                          cartController.addTocart(
                            productModel: controller.productsList[index],
                          );
                        });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
