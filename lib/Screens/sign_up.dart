import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/API/signup_api.dart';
import 'package:pub_transport_01/Screens/sign_in.dart';

import '../Components/constants.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUp';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    void showError(String message) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Something went wrong'),
                content: Text(message),
                actions: [
                  MaterialButton(
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: mainColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ));
    }

    Future<void> _submit() async {
      try {
        setState(() {
          _isloading = true;
          print('n');
        });

        await Provider.of<SignUpProvider>(context, listen: false).signUp();
        Navigator.pushReplacementNamed(context, SignIn.id);
      } catch (error) {
        var message = ('Please try again later!');
        showError(message);
      }
      setState(() {
        _isloading = false;
      });
    }

    var MediaHeight = MediaQuery.of(context).size.height;
    var MediaWidth = MediaQuery.of(context).size.width;
    final validationServices = Provider.of<SignUpProvider>(context);
    final validationServices1 =
        Provider.of<SignUpProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaHeight / 3,
              width: MediaWidth / 1,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Road.png'))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaWidth * 0.07,
                  right: MediaWidth * 0.07,
                  bottom: MediaWidth * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaHeight * 0.3,
                  ),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Enter your information.',
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaHeight * 0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Name',
                      errorText: validationServices.name.error,
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      validationServices.changeName(value);
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight * 0.01,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Email',
                      errorText: validationServices.email.error,
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      validationServices.changeEmail(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight * 0.01,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Password',
                      errorText: validationServices.password.error,
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      validationServices.changePassword(value);
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight * 0.01,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Confrim Password',
                      errorText: validationServices.confrimPasseord.error,
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      validationServices.checkConfrimPassword(value);
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight * 0.01,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'National Number',
                      errorText: validationServices.nationalNumber.error,
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      validationServices.changeNationalnumber(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight * 0.03,
                  ),
                  if (_isloading)
                    Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  else
                    MaterialButton(
                      minWidth: double.infinity,
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height / 12,
                      child: Text(
                        'Sign up now',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: (!validationServices1.isValid)
                          ? null
                          : () {
                              _submit();
                            },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
