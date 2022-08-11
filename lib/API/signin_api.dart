import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/validation/validation_item.dart';
import 'package:http/http.dart' as http;
import 'package:pub_transport_01/Components/constants.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  String? _token;
  String? _userID;

  validationItem _email = validationItem(null, null);
  validationItem _password = validationItem(null, null);
  // Getters
  validationItem get email => _email;
  validationItem get password => _password;
  bool get isValid {
    if (_email.value != null && password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // Setters
  void changeEmail(String value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        _email = validationItem(value, null);
      } else {
        _email = validationItem(null, "Invalid Input");
      }
    }

    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 8) {
      _password = validationItem(value, null);
    } else {
      _password =
          validationItem(null, "Password should be 8 characters at least!");
    }
    notifyListeners();
  }

  Future<void> logIn() async {
    try {
      var url = Url + 'login';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          {
            "email": _email.value,
            "password": _password.value,
          },
        ),
      );
      final body = response.body;
      final headers = response.headers;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', headers["x-access-token"]!);
      prefs.setBool('auth', true);
      _token = await prefs.getString('token');
      //_token = headers["x-access-token"]!;
      print(_token);
      notifyListeners();
    } catch (error) {
      print('$error tpnt');
      throw error;
    }
  }

  bool get isAuth {
    getData();
    if (_token != null) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = await prefs.getString('token');
  }

  /* String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }*/

  void SubmitData() {
    print("${_email.value} , ${_password.value}");
  }
}
