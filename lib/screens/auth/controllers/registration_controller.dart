import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RegistrationController extends GetxController {
  TextEditingController emailController;
  TextEditingController dateOfBirthController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    dateOfBirthController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
