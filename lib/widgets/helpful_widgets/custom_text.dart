import 'package:flutter/material.dart';
class CustomTextStyle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final int? maxLines;
  final TextAlign ?textAlign;
  const CustomTextStyle({
    required this.title,
    required this.textStyle,
    this.maxLines,
   this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      
      this.title,
      textAlign: this.textAlign==null?TextAlign.center:this.textAlign,
      maxLines:this.maxLines!=null? this.maxLines:1,
      style: this.textStyle,
    );
  }
}
class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  CustomText(
      {required this.title, required this.color, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        color: this.color,
        fontSize: this.fontSize,
      ),
    );
  }
}