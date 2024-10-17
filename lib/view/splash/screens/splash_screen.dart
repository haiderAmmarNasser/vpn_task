import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_task/core/constances/app_colors.dart';
import 'package:vpn_task/core/constances/test_styles.dart';
import 'package:vpn_task/core/services/media_query.dart';
import 'package:vpn_task/view/splash/controllers/splash_controller.dart';
import 'package:vpn_task/widgets/helpful_widgets/custom_text.dart';

class SplahsScreen extends StatelessWidget {
  const SplahsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (mediator) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: MediaQueryUtil.screenHeight,
                  width: MediaQueryUtil.screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      AppColors.darkPurpleolor,
                      AppColors.backGroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 120.v),
                    child: Column(
                      children: [
                        CustomTextStyle(
                            title: 'welcome',
                            textStyle: TextStyles()
                                .styleNormal430
                                .copyWith(color: AppColors.defaultWhiteColor)),
                        SizedBox(
                          height: 20.v,
                        ),
                        CustomTextStyle(
                            title: "to this app",
                            textStyle: TextStyles()
                                .styleNormal422
                                .copyWith(color: AppColors.defaultWhiteColor)),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
