import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class sign_up_page extends StatefulWidget {
  const sign_up_page({Key? key}) : super(key: key);

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}


class _sign_up_pageState extends State<sign_up_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: signUp(),
      ),
    );
  }
}
class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);
  static String id = 'signUp';
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),

      ),
    );
  }
}
