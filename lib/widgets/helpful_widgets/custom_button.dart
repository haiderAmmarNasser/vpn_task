import 'package:flutter/material.dart';
import 'package:vpn_task/core/constances/app_colors.dart';
import 'package:vpn_task/core/constances/app_sizes.dart';
import 'package:vpn_task/core/services/media_query.dart';
import 'package:vpn_task/widgets/helpful_widgets/custom_text.dart';

class customButton extends StatelessWidget {
  final Color? color;
  final Color textColor;
  final double? width;
  final String title;
  final VoidCallback function;
  final double? borderRadius;
  final double? height;
  final Alignment? alignment;
  final double fontSize;
  final double padding;
  final Color? borderColor;
  const customButton({
    this.color,
    required this.width,
    required this.function,
    required this.title,
    required this.fontSize,
    required this.textColor,
    this.borderRadius,
    this.height,
    this.alignment,
    required this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: this.function,
        child: Container(
          decoration: BoxDecoration(
            color: this.color == null ? AppColors.defaultGreyColor : this.color,
            border:
                borderColor == null ? null : Border.all(color: borderColor!),
            borderRadius: BorderRadius.circular(
              this.borderRadius == null ? AppSizes.radius8 : this.borderRadius!,
            ),
          ),
          height: this.height == null ? 2.v : this.height,
          width: this.width == null ? 358.v : this.width,
          alignment: this.alignment == null ? Alignment.center : this.alignment,
          child: Padding(
            padding: EdgeInsets.all(this.padding),
            child: CustomText(
              title: title,
              color: this.textColor,
              fontSize: this.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

class AnyChildButton extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  final Widget child;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? padding;
  final Alignment? alignment;
  final Color? borderColor;
  final bool withPress;
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;

  const AnyChildButton({
    this.color,
    this.width,
    this.onPressed,
    required this.child,
    this.padding,
    this.height,
    this.borderRadius,
    this.alignment,
    this.borderColor,
    required this.withPress,
    this.bottomPadding,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: this.leftPadding == null ? 16.h : this.leftPadding!,
          right: this.rightPadding == null ? 16.h : this.rightPadding!,
          top: this.topPadding == null ? 0 : this.topPadding!,
          bottom: this.bottomPadding == null ? 0 : this.bottomPadding!),
      child: this.withPress
          ? InkWell(
              onTap: this.onPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: this.color == null
                      ? AppColors.defaultLightGreyColor
                      : this.color,
                  borderRadius: BorderRadius.circular(
                    this.borderRadius == null
                        ? AppSizes.radius8
                        : this.borderRadius!,
                  ),
                  border: Border.all(
                      color: this.borderColor == null
                          ? Colors.transparent
                          : this.borderColor!),
                ),
                height: this.height == null ? 52.v : this.height,
                width: this.width == null ? 358.h : this.width,
                alignment:
                    this.alignment == null ? Alignment.center : this.alignment,
                child: Padding(
                  padding:
                      EdgeInsets.all(this.padding == null ? 0 : this.padding!),
                  child: this.child,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: this.color == null
                    ? AppColors.defaultLightGreyColor
                    : this.color,
                borderRadius: BorderRadius.circular(
                  this.borderRadius == null
                      ? AppSizes.radius8
                      : this.borderRadius!,
                ),
                border: Border.all(
                    color: this.borderColor == null
                        ? Colors.transparent
                        : this.borderColor!),
              ),
              height: this.height == null ? 52.v : this.height,
              width: this.width == null ? 358.h : this.width,
              alignment:
                  this.alignment == null ? Alignment.center : this.alignment,
              child: Padding(
                padding:
                    EdgeInsets.all(this.padding == null ? 0 : this.padding!),
                child: this.child,
              ),
            ),
    );
  }
}
