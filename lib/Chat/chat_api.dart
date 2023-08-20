import 'dart:convert';
import 'package:http/http.dart';

class ChatAPI{

  final url = "http://34.100.203.26:5005/webhooks/rest/webhook";

  Future<String> postData(String message) async {
    try {
      final response = await post(Uri.parse(url),

          headers: {'Content-Type': 'application/json'},
          body: json.encode({"message": message})
      );
      return response.body;
    } catch (er) {
      print(er);
      return "";
    }
  }

  String processData(String jsonStr) {
    try {
      final List<dynamic> jsonList = json.decode(jsonStr);

      // Extract the "text" values from each JSON object
      final List<String> textValues = jsonList.map((jsonObject) {
        return jsonObject['text'] as String;
      }).toList();

      // Return the extracted "text" values as a single string
      return textValues.join('\n'); // or any delimiter you prefer
    } catch (e) {
      print('Error: $e');
      return ''; // Return an empty string or some default value in case of an error
    }
  }
}