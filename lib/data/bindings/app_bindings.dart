import 'package:get/get.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseController>(FirebaseController());
  }
}
