import 'package:flutter/material.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.red,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0.wp,
      height: 8.0.hp,
      child: ElevatedButton(
        onPressed: () => press(),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
