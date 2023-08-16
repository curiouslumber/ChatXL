import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Elements/checkinternet.dart';
import 'controller.dart';

class ChatFragment extends StatefulWidget {
  ChatFragmentState createState() => ChatFragmentState();
}

class ChatFragmentState extends State<ChatFragment> {
  final Controller c = Get.put(Controller());
  final CheckInternet p = Get.put(CheckInternet());
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    return Container(
      margin: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            height: 50,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _showPopup(context, availableWidth, availableHeight,
                              c.sheetSelected);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.5),
                            foregroundColor: Colors.white.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        child: const Text(
                          'Select sheet',
                          maxLines: 1,
                          style: TextStyle(
                              color: Color.fromARGB(255, 43, 64, 62),
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Connected',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Ubuntu',
                          color: Color(0xffFFCFA3)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            alignment: Alignment.center,
                            child: Obx(
                              () => TextField(
                                controller: textEditingController,
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xff034B40)),
                                cursorColor: const Color(0xff034B40),
                                decoration: InputDecoration(
                                  hintText: c.userMessage.value
                                      ? ''
                                      : (p.activeConnection.value
                                          ? 'Please wait...'
                                          : 'Not Connected'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.2),
                                        width: 0.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.2),
                                        width: 0.0),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                  ),
                                  fillColor: c.userMessage.value
                                      ? Colors.white.withOpacity(0.5)
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
                          child: ElevatedButton(
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
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 19.0),
                                backgroundColor: const Color(0xff034B40)),
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
        ],
      ),
    );
  }
}

void _showPopup(BuildContext context, var availableWidth, var availableHeight,
    RxInt sheetSelected) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        backgroundColor: const Color(0xffD9D9D9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        content: Container(
          width: availableWidth,
          alignment: Alignment.center,
          height: availableHeight / 4,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        trailing: Obx(
                          () => Radio<int>(
                              fillColor: MaterialStateProperty.all<Color?>(
                                  const Color.fromARGB(255, 225, 197, 139)),
                              value: sheetSelected.value,
                              groupValue: 1,
                              onChanged: (int? val) {
                                print(val);
                                if (val == 0) {
                                  sheetSelected.value = 1;
                                } else {
                                  sheetSelected.value = 0;
                                }
                              }),
                        ),
                        leading: const Text(
                          'Abc.xlsx',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Color.fromARGB(255, 255, 218, 184),
                              fontSize: 14.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        tileColor: const Color(0xff034B40),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 20,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.05), // Shadow color
                                spreadRadius:
                                    3, // How far the shadow extends from the object
                                blurRadius: 2, // The radius of the shadow blur
                                offset: const Offset(0,
                                    3), // The offset of the shadow from the object
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            onPressed: () {
                              sheetSelected.value = 0;
                              // Perform submit action
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 3, 59, 51)),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.05), // Shadow color
                                spreadRadius:
                                    3, // How far the shadow extends from the object
                                blurRadius: 2, // The radius of the shadow blur
                                offset: const Offset(0,
                                    3), // The offset of the shadow from the object
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            onPressed: () {},
                            child: const Text('Submit',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 59, 51))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
