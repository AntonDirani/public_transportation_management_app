import 'package:flutter/material.dart';
import 'package:pub_transport_01/Screens/sign_up_page.dart';
import 'package:pub_transport_01/Screens/welcome_page.dart';
import 'Screens/home_page.dart';
import 'Screens/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
      routes: {
        welcome.id: (context) => welcome(),
        signUp.id: (context) => signUp(),
      },
    );
  }
}

//here we go
//Tony was here
