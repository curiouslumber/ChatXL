import 'dart:io';

import 'package:chatdb/Elements/checkinternet.dart';
import 'package:excel/excel.dart' as prefix;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ChatPage extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final CheckInternet p = Get.put(CheckInternet());
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> readExcelData(String filePath) async {
      var file = File(filePath);
      var bytes = await file.readAsBytes();
      var excel = prefix.Excel.decodeBytes(bytes);

      var sheet = excel.tables.keys.first;
    }

    Future<void> pickFile(BuildContext context) async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        String filePath = result.files.single.path!;
        readExcelData(filePath);
        c.fileImported.value = true;
        c.filePath.value = result.files.single.name;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Excel File Imported"),
        ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No file selected"),
        ));
      }
    }

    // Responsive data
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;
    // ignore: unused_local_variable
    final double fontSize =
        availableHeight * 0.025; // Adjust the multiplier as needed
    double paddingFactor = 0.05;
    // ignore: unused_local_variable
    var horizontalpadding = mediaQueryData.size.width * paddingFactor;
    // ignore: unused_local_variable
    var verticalPadding = mediaQueryData.size.height * paddingFactor;

    p.checkUserConnection();

    final TextEditingController textEditingController = TextEditingController();
    return Container(
      color: const Color.fromARGB(255, 69, 219, 116),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 28, 180, 63),
                Color.fromARGB(255, 58, 174, 95),
                Color.fromARGB(255, 28, 180, 67)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding, vertical: verticalPadding * 0.6),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: availableHeight * 0.08,
                          margin:
                              EdgeInsets.only(left: horizontalpadding * 0.2),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 63, 147, 65),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: availableHeight * 0.08,
                        margin: EdgeInsets.only(right: horizontalpadding),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () => Container(
                                  margin: EdgeInsets.only(
                                      right: horizontalpadding * 0.5,
                                      top: verticalPadding * 0.03),
                                  child: Text(
                                    p.activeConnection.value
                                        ? 'Connected'
                                        : 'Not Connected',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 9, 101, 64)),
                                  )),
                            ),
                            Obx(
                              () => GlowRadio(
                                value: p.activeConnection.value ? true : false,
                                groupValue: true,
                                onChange: (value) {},
                                color: Colors.green,
                                glowColor: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Obx(
                        () => Container(
                          margin: EdgeInsets.only(
                              left: horizontalpadding,
                              right: horizontalpadding,
                              bottom: horizontalpadding * 0.4),
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: c.messageCount.value,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  if (!c.aioruser.contains("ai")) {
                                    c.aioruser.add("ai");
                                  }
                                  return AIMessageWidget(
                                      c.aiMessages.elementAt(0));
                                } else if (index != 0 &&
                                    index != 1 &&
                                    c.aioruser.elementAt(index - 1) == "ai") {
                                  return AIMessageWidget(
                                      c.aiMessages.elementAt(0));
                                } else if (index != 0 &&
                                    index != 1 &&
                                    c.aioruser.elementAt(index - 1) == "user") {
                                  if (c.userMessageIndexesObx.contains(index)) {
                                    return SenderMessageWidget(c.userMessagesObx
                                        .elementAt(c.userMessageIndexesObx
                                            .indexOf(index)));
                                  }
                                } else {
                                  if (!c.aioruser.contains("user")) {
                                    c.aioruser.add("user");
                                  }

                                  if (c.userMessageIndexesObx.contains(index)) {
                                    return SenderMessageWidget(c.userMessagesObx
                                        .elementAt(c.userMessageIndexesObx
                                            .indexOf(index)));
                                  }
                                }
                                return null;
                              }),
                        ),
                      ),
                      Obx(
                        () => !c.fileImported.value
                            ? Container(
                                height: availableHeight / 10,
                                margin: const EdgeInsets.only(bottom: 8.0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal:
                                            BorderSide(color: Colors.green))),
                                child: MaterialButton(
                                  onPressed: () {
                                    pickFile(context);
                                  },
                                  color: Colors.green,
                                  child: const Text(
                                    'Import Excel File',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                alignment: Alignment.bottomCenter,
                                child: Text('Using file : ${c.filePath.value}'),
                              ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: availableHeight * 0.13,
                  // color: Colors.lime,
                  padding: EdgeInsets.only(
                      left: horizontalpadding * 0.9,
                      right: horizontalpadding * 0.9,
                      bottom: 8.0),
                  child: Row(children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(right: 4.0),
                        alignment: Alignment.center,
                        child: Obx(
                          () => TextField(
                            controller: textEditingController,
                            style: const TextStyle(fontSize: 14),
                            cursorColor: const Color.fromARGB(255, 85, 193, 89),
                            decoration: InputDecoration(
                              hintText: c.userMessage.value
                                  ? 'Enter your message...'
                                  : (p.activeConnection.value
                                      ? 'Please wait...'
                                      : 'Not Connected'),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 1.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2.0),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              fillColor: c.userMessage.value
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.grey.withOpacity(0.2),
                              filled: true,
                              enabled: c.userMessage.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: () async {
                          await p.checkUserConnection();
                          if (p.activeConnection.value) {
                            if (c.userMessage.value == false) {
                              c.userMessage.value = true;
                            }
                            String message = textEditingController.text;
                            if (message.isNotEmpty) {
                              c.userMessagesObx.add(message);
                              if (c.messageCount.value == 1) {
                                c.userMessageIndexesObx.removeAt(0);
                                c.userMessagesObx.removeAt(0);
                              }
                              c.messageCount.value += 1;
                              c.userMessageIndexesObx
                                  .add(c.messageCount.value - 1);
                              textEditingController.clear();
                              c.userMessage.value = false;
                              c.processUsertoAI(message);
                              c.aioruser.add("user");
                            }
                          } else {
                            c.userMessage.value = false;
                          }
                        },
                        height: 60,
                        color: Colors.green,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AIMessageWidget extends StatelessWidget {
  String aiMessage;
  AIMessageWidget(
    this.aiMessage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0, top: 16.0, right: 32.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 192, 192, 192),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))),
      padding: const EdgeInsets.only(
          top: 16.0, right: 16.0, left: 16.0, bottom: 16.0),
      child: Text(
        aiMessage,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SenderMessageWidget extends StatelessWidget {
  String c;
  SenderMessageWidget(
    this.c, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
      margin: const EdgeInsets.only(bottom: 8.0, top: 16.0, left: 32.0),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0))),
      child: Text(
        c,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
