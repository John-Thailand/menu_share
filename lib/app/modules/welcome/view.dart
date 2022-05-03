import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/routes/routes.dart';
import 'package:getx_todo_list/app/widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'WELCOME TO MENU SHARE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/task.jpg',
                height: 50.0.hp,
              ),
              RoundedButton(
                text: 'LOGIN',
                press: () => Get.toNamed(Routes.login),
              ),
              SizedBox(height: 3.0.hp),
              RoundedButton(
                text: 'SIGINUP',
                press: () => Get.toNamed(Routes.signup),
                color: Colors.red.shade100,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
