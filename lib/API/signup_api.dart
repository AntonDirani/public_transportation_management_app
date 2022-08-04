import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/validation/validation_item.dart';
import 'package:http/http.dart' as http;

class SignUpProvider extends ChangeNotifier {
  validationItem _name = validationItem(null, null);
  validationItem _email = validationItem(null, null);
  validationItem _password = validationItem(null, null);
  validationItem _confrimPassword = validationItem(null, null);
  validationItem _naionalNumber = validationItem(null, null);
  // Getters
  validationItem get name => _name;
  validationItem get email => _email;
  validationItem get password => _password;
  validationItem get confrimPasseord => _confrimPassword;
  validationItem get nationalNumber => _naionalNumber;

  bool get isValid {
    if (_name.value != null &&
        _email.value != null &&
        password.value != null &&
        _confrimPassword.value != null &&
        _naionalNumber.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // Setters
  void changeName(String value) {
    if (value.length >= 3) {
      _name = validationItem(value, null);
    } else {
      _name = validationItem(null, "Must be at least 3 Characters");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        _email = validationItem(value, null);
      } else {
        _email = validationItem(null, "Input is invalid");
      }
    }

    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 8) {
      _password = validationItem(value, null);
    } else {
      _password = validationItem(null, "Must be at least 8 characters");
    }
    notifyListeners();
  }

  void checkConfrimPassword(String value) {
    if (value == _password.value) {
      _confrimPassword = validationItem(value, null);
    } else {
      _confrimPassword = validationItem(null, "Password didn't match");
    }
    notifyListeners();
  }

  void changeNationalnumber(String value) {
    if (value.length >= 11) {
      _naionalNumber = validationItem(value, null);
    } else {
      _naionalNumber = validationItem(null, "Must be at least 11 numbers");
    }
    notifyListeners();
  }

  Future<void> signUp() async {
    try {
      var url = Url + 'register';
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          {
            "name": _name.value,
            "email": _email.value,
            "password": _password.value,
            "nationalID": _naionalNumber.value
          },
        ),
      );
      final decoded = response.body;
      print(decoded);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
/*print(
        "${_name.value} , ${_email.value} , ${_password.value} , ${_confrimPassword.value} , ${_naionalNumber.value}");*/
