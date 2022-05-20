import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/validation/signup_validation.dart';
import 'package:pub_transport_01/validation/validation_item.dart';

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
    var MediaHeight = MediaQuery.of(context).size.height;
    var MediaWidth = MediaQuery.of(context).size.width;
    final validationServices = Provider.of<signupValidation>(context);
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
                      errorText: validationServices.passeord.error,
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
                  SizedBox(
                    height: MediaHeight / 11,
                    width: double.infinity,
                    child: RaisedButton(

                      color: Color(0xff33C58E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      onPressed: (!validationServices.isValid) ? null : validationServices.SubmitData,
                    ),
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
