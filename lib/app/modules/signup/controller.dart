import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/common.dart' as common;

class SignUpController extends GetxController {
  SignUpController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void onClose() {
    // discards any resources used by the object
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }

  String? emailValidator(String? email) {
    return common.emailValidator(email);
  }

  String? passwordValidator(String? password) {
    return common.passwordValidator(password);
  }

  String? confirmValidator(String? confirmPassword) {
    return common.confirmValidator(passwordController.text, confirmPassword);
  }

  Future<void> pressSignUpButton() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {
      EasyLoading.showSuccess('aaa');
    }
  }
}
