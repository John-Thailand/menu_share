import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/common.dart' as common;
import 'package:getx_todo_list/app/data/models/user.dart';
import 'package:getx_todo_list/app/data/services/firebase_auth/repository.dart';

class SignUpController extends GetxController {
  final FirebaseAuthRepository firebaseAuthRepository;

  SignUpController({required this.firebaseAuthRepository});

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

  Future<String?> pressSignUpButton() async {
    // TODO
    if (formKey.currentState!.validate()) {
      User? user = await firebaseAuthRepository.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
