import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_task/core/constances/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Function? onChangedFunction;
  final bool? obscureText;
  final String? Function(String)? checkValue;
  final double? borderRadius;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color color;
  final List<TextInputFormatter>? inputFormatters;
  final double? leftContentPadding;
  final double? rightContentPadding;
  final TextInputType ?textInputType;
  CustomTextField({
    required this.controller,
    this.hintText,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.onChangedFunction,
    this.obscureText,
    this.checkValue,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    required this.color,
    this.inputFormatters,
    this.suffix,
    this.prefix,
    this.leftContentPadding,
    this.rightContentPadding,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: this.textInputType==null?TextInputType.name:this.textInputType,
        validator: (value) {
          return (checkValue ?? (val) => null)(value ?? '');
        },
        inputFormatters: inputFormatters,
        obscureText: this.obscureText ?? false,
        controller: this.controller,
        cursorColor: AppColors.defaultGreyColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: this.color,
          hintText: this.hintText,
          suffix: this.suffix == null ? null : this.suffix,
          prefix: this.prefix == null ? null : this.prefix,
          hintStyle: hintStyle ?? TextStyle(color: AppColors.defaultBlackColor),
          // contentPadding: EdgeInsets.only(
          //   top: 16.v,
          //   bottom: 16.v,
          //   left: this.leftContentPadding == null
          //       ? 20.h
          //       : this.leftContentPadding!,
          //   right: this.rightContentPadding == null
          //       ? 20.h
          //       : this.rightContentPadding!,
          // ),
          prefixIcon: this.prefixIcon != null ? this.prefixIcon : null,
          suffixIcon: this.suffixIcon != null ? this.suffixIcon : null,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: this.focusedBorderColor ?? AppColors.defaultBlackColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              this.borderRadius ?? 8,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: this.enabledBorderColor ?? AppColors.defaultBlackColor,
            ),
            borderRadius: BorderRadius.circular(
              this.borderRadius ?? 8,
            ),
          ),
        ),
      ),
    );
  }
}
