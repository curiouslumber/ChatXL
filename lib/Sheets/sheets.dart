import 'package:flutter/material.dart';

class SheetsFragment extends StatelessWidget {
  const SheetsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 32.0, right: 28.0, left: 28.0, bottom: 8.0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                          spreadRadius: 2)
                    ],
                  ),
                  padding: const EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Abc.xlsx',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Color.fromARGB(255, 48, 68, 67)),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                      spreadRadius: 2)
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Upload New Sheet',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Color.fromARGB(255, 48, 68, 67)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print("New Excel sheet added");
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromARGB(220, 48, 68, 67),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
