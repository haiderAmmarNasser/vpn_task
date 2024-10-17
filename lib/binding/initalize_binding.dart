import 'package:get/get.dart';
import 'package:vpn_task/core/class/Crud.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<MyServices>(MyServices());
    Get.put(Crud());
  }
}
