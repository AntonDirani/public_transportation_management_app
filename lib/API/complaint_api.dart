import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pub_transport_01/Components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/http_exception.dart';

class ComplaintsAPI extends ChangeNotifier {
  Future<String> sendComplaint(
      String tripName, int busNum, String content) async {
    try {
      print('in');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final _token = prefs.getString('token');
      final url = Url + 'complains';
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-ACCESS-TOKEN': '$_token'
          },
          body: json.encode(
              {"content": content, "routeName": tripName, "busId": busNum}));
      final responseData = jsonDecode(response.body);

      return responseData['message'];
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
