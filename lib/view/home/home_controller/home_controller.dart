import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vpn_task/core/class/check_internet.dart';
import 'package:vpn_task/core/class/vpn_checker.dart';
import 'package:vpn_task/core/constances/app_colors.dart';

class HomeController extends GetxController {
  late StreamSubscription<ConnectivityResult> subscription;
  PageController pageController = PageController();
  bool isConnected = true;
  bool isVpnActive = false;
  @override
  void onInit() {
    super.onInit();
    checkWifiConnection();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      updateConnectionState(result);
    });
    checkVpnState();
  }

  Future<void> checkWifiConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    updateConnectionState(connectivityResult);
  }

  void updateConnectionState(ConnectivityResult result) {
    isConnected = result != ConnectivityResult.none;
    if (isConnected) {
      checkVpnState();
    } else {
      isVpnActive = false;
      update();
    }
    showStateMessage();
  }

Future<void> checkVpnState() async {
   isVpnActive = await VpnChecker.isVpnActive();
   update();
   bool hasInternet = await CheckInternet();
   if (!hasInternet) {
     isVpnActive = false;  
    update();
   }
   update(); 
}
  void showStateMessage() {
    final message = isConnected ? 'you are connected' : 'are are not connected';
    Get.snackbar(
      'connection state',
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.defaultWhiteColor,
    );
  }

  void manageNavigation(int index) {
    this.pageController.animateToPage(index == 0 ? 1 : 0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  String showWifiConnection() {
    return this.isConnected ? 'connected to internet' : 'no internet connection';
  }

  String showVpnConnection() {
    print(this.isVpnActive);
    return this.isVpnActive ? 'connected to vpn' : 'no vpn';
  }
}
