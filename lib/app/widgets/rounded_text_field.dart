import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final IconData iconData;
  final bool obscureText;

  const RoundedTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0.wp,
      child: TextFormField(
        controller: controller,
        validator: (String? value) {
          return validator(value);
        },
        inputFormatters: [LengthLimitingTextInputFormatter(20)],
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          counterText: '',
        ),
        cursorColor: Colors.grey,
        obscureText: true,
      ),
    );
  }
}
