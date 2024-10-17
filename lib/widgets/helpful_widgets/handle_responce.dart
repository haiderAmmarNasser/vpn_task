import 'package:flutter/material.dart';
import 'package:vpn_task/core/class/status_classes.dart';
import 'package:vpn_task/core/constances/app_colors.dart';
import 'package:vpn_task/core/constances/app_sizes.dart';
import 'package:vpn_task/core/services/media_query.dart';
import 'package:vpn_task/widgets/helpful_widgets/custom_text.dart';
Widget handleGetResponce(StatusClasses responce, VoidCallback fetchDataFunction,
    List? ListOfData, dynamic parameterData, Widget widget, bool oneelement) {
  return responce == StatusClasses.isloading
      ? Padding(
          padding: EdgeInsets.only(top: MediaQueryUtil.screenHeight * 0.15),
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.defaultBlackColor,
            ),
          ),
        )
      : ListOfData!.isEmpty && responce == StatusClasses.success
          ? Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQueryUtil.screenHeight * 0.3),
              child: Center(
                  child: CustomText(
                      title: 'لا يوجد عناصر',
                      color: AppColors.defaultBlackColor,
                      fontSize: AppSizes.large
                      )),
            )
          : responce == StatusClasses.serverError ||
                  responce == StatusClasses.anotherError
              ? Padding(
                  padding:
                      EdgeInsets.only(top: MediaQueryUtil.screenHeight * 0.15),
                  child: Center(
                    child: Column(
                      children: [
                       CustomText(
                          title: 'حدث خطأ ما',
                          color: AppColors.defaultBlackColor,
                          fontSize: AppSizes.large,
                        ),
                        IconButton(
                            onPressed: fetchDataFunction,
                            icon: Icon(
                              Icons.error,
                              color: AppColors.defaultBlackColor,
                              size: AppSizes.large,
                            )),
                      ],
                    ),
                  ),
                )
              : responce == StatusClasses.offlineError
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQueryUtil.screenHeight * 0.15),
                      child: Center(
                        child: Column(
                          children: [
                            CustomText(
                              title: ' لا يوجد اتصال بالإنترنيت',
                              color: AppColors.defaultBlackColor,
                              fontSize: AppSizes.large,
                            ),
                            SizedBox(
                              height: MediaQueryUtil.screenHeight * 0.02,
                            ),
                            IconButton(
                                onPressed: fetchDataFunction,
                                icon: Icon(
                                  Icons.signal_wifi_connected_no_internet_4,
                                  color: AppColors.defaultBlackColor,
                                  // size: AppSizes.large,
                                )),
                          ],
                        ),
                      ),
                    )
                  : responce == StatusClasses.success || ListOfData.isNotEmpty
                      ? widget
                      : Text('error');
    }
// Future? handlePostResponce(StatusClasses responce, BuildContext context,
//     String postType, String type) {
//   print("2");
//   if (responce == StatusClasses.success) {
//     print("3");
//     return delayedDialogeDesign(
//       context,
//       Text('تم ${postType} ${type} بنجاح', textAlign: TextAlign.center),
//       CircleAvatar(
//         backgroundColor: AppColors.defaultGreen,
//         child: Icon(Icons.done),
//       ),
//     );
//   } else if (responce == StatusClasses.isloading) {
//   } else {
//     print("4");
//     return delayedDialogeDesign(
//       context,
//       Text('حدث خطأ ما', textAlign: TextAlign.center),
//       CircleAvatar(
//         child: Icon(Icons.error),
//       ),
//     );
//   }
//   return null;
// }
