import 'package:flutter/widgets.dart';
import 'package:vpn_task/core/constances/app_colors.dart';
import 'package:vpn_task/core/services/media_query.dart';

class TextStyles
{
   TextStyle get styleNormal430{
    return  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 30   .fSize    ,
        color: AppColors.defaultBlackColor);
  }
    TextStyle get styleNormal424 {
    return  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24   .fSize    ,
        color: AppColors.defaultBlackColor);
  }
  TextStyle get styleNormal422 {
    return  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22   .fSize    ,
        color: AppColors.defaultBlackColor);
  }
    TextStyle get styleNormal412 {
    return  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12  .fSize    ,
        color: AppColors.defaultBlackColor);
  }
}