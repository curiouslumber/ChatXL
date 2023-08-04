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
  var aiMessage = false.obs;
  var userMessage = true.obs;

  var aiMessages = [
    "Hey there! I'm you AI assistant Lisa from ChatDB. Ready to perform some database operations?"
  ].obs;
  RxList<int> aiMessageIndexesObx = [1].obs;

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
