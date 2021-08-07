import 'package:get/get.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';
import 'package:shopping_cart/screens/cart/controllers/cart_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseController>(FirebaseController());

    Get.put<CartController>(CartController());
  }
}
