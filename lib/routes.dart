import 'package:get/get.dart';
import 'package:vpn_task/core/constances/routes.dart';
import 'package:vpn_task/view/home/home_screen/home_screen.dart';
import 'package:vpn_task/view/splash/screens/splash_screen.dart';
List<GetPage> routesList = [
  GetPage(name: AppRoutes.splashRoute, page: () => SplahsScreen()),
  GetPage(name: AppRoutes.homeRoute, page: () => HomeScreen()),
];
