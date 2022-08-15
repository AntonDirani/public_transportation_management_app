import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Screens/sign_up.dart';
import 'package:pub_transport_01/API/signin_api.dart';

import '../Components/constants.dart';

class SignIn extends StatefulWidget {
  static String id = 'sign_in';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _isLoading = false;
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

  Future<void> _login() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<SignInProvider>(context, listen: false).logIn();
      /* showError(response!);*/
    } catch (error) {
      var message = ('Please try again later!');
      showError(message);
    }
    setState(() {
      _isLoading = false;
    });
  }

  bool isPasswordVisible = true;
  String password = '';

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    final validationServices = Provider.of<SignInProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: mediaHeight * 0.1,
                  left: mediaWidth * 0.07,
                  right: mediaWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mediaHeight / 4,
                    width: mediaWidth / 1.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Logo.png'))),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.02,
                  ),
                  Text(
                    'Welcome To Harakeh',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: mediaWidth * 0.06,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.01,
                  ),
                  Text(
                    'Getting Started',
                    style: GoogleFonts.montserrat(
                        color: Colors.black, fontSize: mediaWidth * 0.04),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.03,
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
                        Icons.mail,
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
                    height: mediaHeight * 0.03,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Password',
                      errorText: validationServices.password.error,
                      suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                        onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible),
                      ),
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    obscureText: isPasswordVisible,
                  ),
                  SizedBox(
                    height: mediaHeight * 0.05,
                  ),
                  if (_isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  else
                    SizedBox(
                      height: mediaHeight / 12,
                      width: double.infinity,
                      child: MaterialButton(
                          minWidth: double.infinity,
                          color: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(
                            'Sign in now',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: mediaWidth * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            _login();
                          }),
                    ),
                  SizedBox(
                    height: mediaWidth * 0.09,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: mediaHeight * 0.015),
                      ),
                      TextButton(
                        child: Text(
                          'Sign Up Here',
                          style: TextStyle(
                            fontSize: mediaHeight * 0.015,
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
