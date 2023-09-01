import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes, implementation_imports
import 'package:flutter/src/painting/box_border.dart' as OuterBorder;

// ignore: must_be_immutable
class SheetPage extends StatefulWidget {
  var filePath = "";

  SheetPage(this.filePath, {super.key});

  @override
  // ignore: no_logic_in_create_state
  SheetPageState createState() => SheetPageState(filePath);
}

class SheetPageState extends State<SheetPage> {
  var filePath = "";
  SheetPageState(this.filePath);
  List<List<String>> excelData = [];

  @override
  void initState() {
    super.initState();
    _loadExcelData();
  }

  Future<void> _loadExcelData() async {
    List<List<String>> data = await readExcel();
    setState(() {
      excelData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff405C5A),
      appBar: AppBar(
        backgroundColor: const Color(0xff405C5A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            border: OuterBorder.Border.all(
              color: Colors.white, // Set the border color
              width: 1.0, // Set the border width
            ),
            color: const Color(0xff405C5A),
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: excelData.isNotEmpty && excelData.length > 1
                  ? DataTable(
                      columns: List<DataColumn>.generate(
                        excelData[0]
                            .length, // Use header count as the column count
                        (index) => DataColumn(
                          label: Text(
                            index < excelData[0].length
                                ? excelData[0][index]
                                : '', // Use empty string for extra headers
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),
                      rows: excelData
                          .sublist(1)
                          .map<DataRow>((List<String> rowData) {
                        assert(rowData.length <= excelData[0].length,
                            'Number of cells in data row must not exceed the number of columns.');

                        // If there are fewer cells than columns, pad with empty strings
                        final paddedRowData = List<String>.filled(
                          excelData[0].length,
                          '',
                          growable: false,
                        );
                        for (var i = 0; i < rowData.length; i++) {
                          paddedRowData[i] = rowData[i];
                        }

                        return DataRow(
                          cells: paddedRowData.map<DataCell>((String cellData) {
                            return DataCell(Text(
                              cellData,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.visible,
                            ));
                          }).toList(),
                        );
                      }).toList(),
                    )
                  : const Text(
                      'No data available',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<List<String>>> readExcel() async {
    final File file = File(filePath); // Use the picked file path directly

    if (!await file.exists()) {
      throw Exception("File does not exist.");
    }

    final Uint8List bytes = await file.readAsBytes();

    Excel excel = Excel.decodeBytes(bytes);
    String firstSheet = excel.tables.keys.first;

    final sheet = excel.tables[firstSheet];

    List<List<String>> excelData = [];

    for (var row in sheet!.rows) {
      List<String> rowData = [];
      for (var cell in row) {
        if (cell != null) {
          rowData.add(cell.value.toString());
        }
      }
      excelData.add(rowData);
    }
    return excelData;
  }
}
