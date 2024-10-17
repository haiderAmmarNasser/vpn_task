import 'package:flutter/services.dart';

class VpnChecker {
  static const platform = MethodChannel('vpnStatus');

  static Future<bool> isVpnActive() async {
    try {
      final bool result = await platform.invokeMethod('isVpnActive');
      return result;
    } catch (e) {
      print('Failed to get VPN status: $e');
      return false;
    }
  }
}
