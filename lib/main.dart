import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/screens/products/ui/home_page.dart';

import 'data/bindings/app_bindings.dart';
import 'data/database/hive_db.dart';
import 'screens/auth/ui/login_page.dart';
import 'screens/splash_screen.dart';

///  TEST BY: KEVIN TAILOR
///
/// Please Note: I haven't done firebase setup on ios and web
///
/// FILE STRUCTURE
/// `Data:`
///  * This folder will contain our apps business logic we can call this as backbone of our app.
/// All of the code related to database are in data> `database` folder
///
/// All of the base controllers are in data > `controllers`
/// `Bindings` folder includes the dependency injection for creating instance of our base controllers.
///
/// `Models` => Model classes
///
/// `Screens:`
/// Each of the folder inside this.folder(Screens) includes feature folders
/// auth, cart, products
///
/// For individual widgets we have to create folder inside each feature folder.
///
/// Each folder also includes controllers dependent on that Feature
/// `utils:`
/// Other utils files which our project required such as Validators/ dialogs / snackbars etc.
///
/// `widgets:`
/// This folder contains global widgets which are used accross the app
///
/// STATE MANAGEMENT USED `GET`
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initHive();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appThemeData,
      initialBinding: AppBindings(),
      defaultTransition: Transition.topLevel,
      home: SplashScreen(),
    );
  }
}

class AuthHelper extends StatelessWidget {
  const AuthHelper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, value) {
        if (LocalX.userID == null || LocalX.userID == "") {
          return LoginPage();
        }
        return HomePage();
      },
    );
  }
}

/// TODO: Make Snackbars Utils
/// TODO: SHOW CONFIRMATION DIALOG
/// TODO:ADD APP ICON
