import 'dart:io';
import 'package:get/get.dart';

class CheckInternet extends GetxController {
  var activeConnection = false.obs;
  String T = "";
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection.value = true;
      }
    } on SocketException catch (_) {
      activeConnection.value = false;
    }
  }
}
