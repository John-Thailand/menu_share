import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/widgets/rounded_button.dart';
import 'package:getx_todo_list/app/widgets/rounded_text_field.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Please enter mail address';
                      }
                      return null;
                    },
                    hintText: 'mail',
                    iconData: Icons.email,
                  ),
                  SizedBox(height: 3.0.hp),
                  RoundedTextField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter some text';
                      }
                      if (6 > value.length || value.length > 12) {
                        return 'Please enter 6 to 12 characters';
                      }
                      return null;
                    },
                    hintText: 'password',
                    iconData: Icons.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 3.0.hp),
                  RoundedTextField(
                    controller: _confirmController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value != _passwordController.text) {
                        return 'This password does not match the password';
                      }
                      return null;
                    },
                    hintText: 'confirm password',
                    iconData: Icons.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 6.0.hp),
                  RoundedButton(
                    text: 'SIGINUP',
                    press: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
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
