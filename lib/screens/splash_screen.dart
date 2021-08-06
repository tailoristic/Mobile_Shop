import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/ui/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(
        () => LoginPage(),
        duration: const Duration(
          microseconds: 200,
        ),
        transition: Transition.zoom,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// TODO:ADD APP ICON
            /// ITS REALLY DIFFICULT TO CODE UI WHEN YOU DONT HAVE DESIGN READY..
            Text(
              "Mobile Shop",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
