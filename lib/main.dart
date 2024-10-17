import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_task/binding/initalize_binding.dart';
import 'package:vpn_task/core/constances/routes.dart';
import 'package:vpn_task/core/services/media_query.dart';
import 'package:vpn_task/core/services/services.dart';
import 'package:vpn_task/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await asyncingData();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitializeBinding(), 
      initialRoute: AppRoutes.splashRoute,
      getPages: routesList,
      builder: (context, child) {
        MediaQueryUtil.init(context);
        return child!;
      },
    );
  }
}