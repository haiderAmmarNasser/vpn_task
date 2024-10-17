import 'package:get/get.dart';
import 'package:vpn_task/view/home/home_screen/home_screen.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () => Get.off(()=>HomeScreen()));
    super.onInit();
    update();
  }
}
