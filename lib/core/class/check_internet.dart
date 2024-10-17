import 'dart:io';

Future CheckInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("wifi connection is secured");
      return true;
    }
  } on SocketException catch (e) {
    print(" go to Check internet Function there is an error   " + e.toString());
  }
}
