import 'package:get/get.dart';
import 'package:shopping_cart/data/database/firebase_db.dart';
import 'package:shopping_cart/data/models/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productsList = RxList<ProductModel>([]);

  RxBool newsLoader = RxBool(true);
  @override
  void onInit() {
    super.onInit();
    productsList.bindStream(FirebaseInstance.getProductsStream());
  }

  void markAsFav(String productID) {}
}
