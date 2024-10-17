import 'package:flutter/material.dart';

class ButtonDesigned extends StatelessWidget {
  final Color color;
  final Color textColor;
  final double width;
  final String title;
  final VoidCallback function;
  ButtonDesigned(
      {required this.color,
      required this.width,
      required this.function,
      required this.title,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: this.color,
      child: MaterialButton(
        minWidth: this.width,
        child: Text(this.title,
            style: TextStyle(
              color: this.textColor,
            )),
        onPressed: this.function,
      ),
    );
  }
}
