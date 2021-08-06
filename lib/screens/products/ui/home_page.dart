import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                firebaseController.signout();
              },
              label: Text(
                "Log out",
              ),
            )
          ],
        ),
      ),
    );
  }
}
