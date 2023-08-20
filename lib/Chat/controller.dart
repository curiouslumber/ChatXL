import 'dart:async';

import 'package:get/get.dart';

class Controller extends GetxController {
  var messageCount = 1.obs;
  var ready = false.obs;
  var userMessagesObx = [""].obs;
  RxList<int> userMessageIndexesObx = [1].obs;
  RxList<String> aioruser = [""].obs;

  var fileImported = false.obs;
  var filePath = "".obs;

  var userMessage = true.obs;
  var signedIn = false.obs;
  var sheetSelected = (-1).obs;

  var tempSelectedFilePath = "".obs;
  var tempSelectedFileName = "".obs;

  var selectedFileName = "".obs;
  var selectedFilePath = "".obs;
  var submittedSheet = "".obs;

  var aiMessages = ["Sheet uploaded successfully."].obs;
  var aiMessagesFromAPI = [].obs;

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
