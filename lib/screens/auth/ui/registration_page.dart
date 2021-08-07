import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/data/constants/size_constants.dart';
import 'package:shopping_cart/data/controllers/firebase_controller.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/screens/auth/controllers/registration_controller.dart';
import 'package:shopping_cart/utils/validators.dart';
import 'package:shopping_cart/widgets/custom_button.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  /// TEXT CONTROLLERS
  TextEditingController emailController;
  TextEditingController dateOfBirthController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  /// STATE MANAGERS
  final RegistrationController registrationController =
      Get.put<RegistrationController>(RegistrationController());
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  final ValueNotifier<bool> _passwordVisible = ValueNotifier<bool>(false);

  ///
  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  final FocusScopeNode _focusNode = FocusScopeNode();

  String _validatePassword(String value) {
    if (passwordController.text != confirmPasswordController.text) {
      return "Password does not match";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    dateOfBirthController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    [
      emailController,
      dateOfBirthController,
      passwordController,
      confirmPasswordController,
    ].forEach((controller) {
      controller.dispose();
    });
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.kWhite,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Spacer(),
              Form(
                key: formStateKey,
                child: FocusScope(
                  node: _focusNode,
                  child: ListView(
                    padding: const EdgeInsets.all(SizeConstant.kDefaultPadding),
                    shrinkWrap: true,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        onEditingComplete: _focusNode.nextFocus,
                        controller: emailController,
                        validator: Validator.validateEmail,
                        style: const TextStyle(color: AppTheme.kWhite),
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(height: 15.0),
                      TextFormField(
                        onEditingComplete: _focusNode.nextFocus,
                        controller: dateOfBirthController,
                        validator: Validator.validatePassword,
                        style: const TextStyle(color: AppTheme.kWhite),
                        onTap: () {
                          registrationController.pickDate(
                            context: context,
                            firstDate: DateTime(1800),
                            textController: dateOfBirthController,
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'BirthDate',
                          prefixIcon: const Icon(
                            Icons.calendar_today_outlined,
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
                      const SizedBox(height: 15.0),
                      ValueListenableBuilder(
                        valueListenable: _passwordVisible,
                        builder:
                            (BuildContext context, bool value, Widget child) {
                          return TextFormField(
                            onEditingComplete: _focusNode.nextFocus,
                            controller: passwordController,
                            validator: Validator.validatePassword,
                            style: const TextStyle(color: AppTheme.kWhite),
                            obscureText: !value,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: const Icon(
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
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15.0),
                      ValueListenableBuilder(
                        valueListenable: _passwordVisible,
                        builder:
                            (BuildContext context, bool value, Widget child) {
                          return TextFormField(
                            onEditingComplete: _focusNode.nextFocus,
                            controller: confirmPasswordController,
                            validator: _validatePassword,
                            style: const TextStyle(color: AppTheme.kWhite),
                            obscureText: !value,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: const Icon(
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
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => CustomButton(
                      title: "Sign up",
                      height: 60.0,
                      width: Get.width / 2,
                      isLoading: firebaseController.regLoader.value,
                      onTap: () {
                        if (formStateKey.currentState.validate()) {
                          /// CALL CREATE ACCOUNT HERE
                          firebaseController.createUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            dateOfBirth: dateOfBirthController.text.trim(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an Account?",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppTheme.kWhite,
                        ),
                        children: [
                          TextSpan(
                            text: " Login",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
