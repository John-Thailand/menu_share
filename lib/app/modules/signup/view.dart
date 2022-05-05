import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/modules/signup/controller.dart';
import 'package:getx_todo_list/app/widgets/rounded_button.dart';
import 'package:getx_todo_list/app/widgets/rounded_text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/task.jpg',
                    height: 50.0.hp,
                  ),
                  RoundedTextField(
                    controller: controller.emailController,
                    validator: (String? email) =>
                        controller.emailValidator(email),
                    hintText: 'mail',
                    iconData: Icons.email,
                  ),
                  SizedBox(height: 3.0.hp),
                  RoundedTextField(
                    controller: controller.passwordController,
                    validator: (String? password) =>
                        controller.passwordValidator(password),
                    hintText: 'password',
                    iconData: Icons.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 3.0.hp),
                  RoundedTextField(
                    controller: controller.confirmController,
                    validator: (String? confirmPassword) =>
                        controller.confirmValidator(confirmPassword),
                    hintText: 'confirm password',
                    iconData: Icons.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 6.0.hp),
                  RoundedButton(
                    text: 'SIGINUP',
                    press: () async => await controller.pressSignUpButton(),
                  ),
                  SizedBox(height: 6.0.hp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
