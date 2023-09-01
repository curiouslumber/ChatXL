import 'dart:async';

import 'package:get/get.dart';

class Controller extends GetxController {
  // Homepage variables
  var displayName = "".obs;

  // Register page variables
  var isVisible = false.obs;

  //importing file on sheets page variables
  var fileImported = false.obs;
  var filePath = "".obs;

  //processing message variables
  var messageCount = 1.obs;
  var userMessagesObx = [""].obs;
  RxList<int> userMessageIndexesObx = [1].obs;
  RxList<String> aioruser = [""].obs;
  var userMessage = true.obs;
  var signedIn = false.obs;
  var aiMessages = ["Sheet uploaded successfully."].obs;
  var aiMessagesFromAPI = [].obs;

  // sheet selection on chat page variables
  var sheetSelected = (-1).obs;
  var tempSelectedFilePath = "".obs;
  var tempSelectedFileName = "".obs;
  var selectedFileName = "".obs;
  var selectedFilePath = "".obs;
  var submittedSheet = "".obs;

  processUsertoAI(String userText) {
    Timer(const Duration(seconds: 3), () {
      if (aioruser.elementAt(aioruser.length - 1) == "user") {
        aioruser.add("ai");
        messageCount++;
        userMessage.value = true;
      }
    });
  }
}
