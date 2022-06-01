import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class User extends ChangeNotifier{
  int? userTd;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? nationalId;

  User({required this.userName , required this.userEmail , required this.userPassword , required this.nationalId});
}
class UserProvider extends ChangeNotifier {

}