import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/constants/size_constants.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/screens/auth/controllers/login_controller.dart';
import 'package:shopping_cart/screens/auth/ui/registration_page.dart';
import 'package:shopping_cart/utils/validators.dart';
import 'package:shopping_cart/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final ValueNotifier<bool> _passwordVisible = ValueNotifier<bool>(false);
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: loginController.formStateKey,
                  child: ListView(
                    padding: const EdgeInsets.all(SizeConstant.kDefaultPadding),
                    shrinkWrap: true,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: loginController.emailController,
                        validator: Validator.validateEmail,
                        style: const TextStyle(color: AppTheme.kWhite),
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppTheme.kWhite,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            color: AppTheme.kWhite,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.kWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ValueListenableBuilder(
                        valueListenable: _passwordVisible,
                        builder:
                            (BuildContext context, bool value, Widget child) {
                          return TextFormField(
                            controller: loginController.passwordContoller,
                            validator: Validator.validatePassword,
                            style: const TextStyle(color: AppTheme.kWhite),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: !value,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.privacy_tip_outlined,
                                color: AppTheme.kWhite,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                color: AppTheme.kWhite,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTheme.kWhite,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppTheme.kWhite,
                                ),
                                onPressed: () {
                                  _passwordVisible.value =
                                      !_passwordVisible.value;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => CustomButton(
                        height: 60.0,
                        title: "Log in",
                        width: Get.width / 2.0,
                        isLoading: firebaseController.loginLoader.value,
                        onTap: () {
                          if (loginController.formStateKey.currentState
                              .validate()) {
                            firebaseController.login(
                              loginController.emailController.text.trim(),
                              loginController.passwordContoller.text.trim(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegistrationPage());
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "First time here?",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppTheme.kWhite,
                        ),
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
