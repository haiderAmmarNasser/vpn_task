import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_task/core/constances/app_colors.dart';
import 'package:vpn_task/core/constances/test_styles.dart';
import 'package:vpn_task/core/services/media_query.dart';
import 'package:vpn_task/view/home/home_controller/home_controller.dart';
import 'package:vpn_task/widgets/helpful_widgets/custom_button.dart';
import 'package:vpn_task/widgets/helpful_widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (mediator) {
        return PageView.builder(
            controller: mediator.pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Scaffold(
                backgroundColor: AppColors.backGroundColor,
                appBar: AppBar(
                  elevation: 11,
                  backgroundColor: AppColors.darkPurpleolor,
                  title: CustomTextStyle(
                      title:
                          index == 0 ? 'this is screen1 ' : 'this is screen2',
                      textStyle: TextStyles()
                          .styleNormal422
                          .copyWith(color: AppColors.defaultWhiteColor)),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextStyle(
                          title: mediator.showWifiConnection(),
                          textStyle: TextStyles()
                              .styleNormal422
                              .copyWith(color: AppColors.defaultWhiteColor)),
                      SizedBox(height: 20.v),
                      CustomTextStyle(
                          title: mediator.showVpnConnection(),
                          textStyle: TextStyles()
                              .styleNormal422
                              .copyWith(color: AppColors.defaultWhiteColor)),
                      SizedBox(height: 20.v),
                      AnyChildButton(
                        borderRadius: 12,
                        width: 200.h,
                        child: CustomTextStyle(
                          title:
                              index == 0 ? 'go to screen 2' : 'go to screen1',
                          textStyle: TextStyles()
                              .styleNormal422
                              .copyWith(color: AppColors.backGroundColor),
                        ),
                        withPress: true,
                        onPressed: () {
                          mediator.manageNavigation(index);
                        },
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
