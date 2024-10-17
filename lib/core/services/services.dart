import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_task/core/constances/app_keys.dart';
import 'package:vpn_task/core/constances/constance_data.dart';
class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    // if( await this.getStringValue(AppKeys.storeTokenKey) != null)
    // {
    // ConstanceData.token =
    //    ( await this.getStringValue(AppKeys.storeTokenKey))!;
    // }
    //    print('this is  token ');
    // print(ConstanceData.token);
    return this;
  }
    Future<void> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
  Future<String?> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  Future<void> setConstantToken() async {
    ConstanceData.token =
       ( await this.getStringValue(AppKeys.storeTokenKey))!;
       print('this is token after storing');
       print(ConstanceData.token);
  }
}
Future<void> asyncingData() async {
  await Get.putAsync(() => MyServices().init());
}
