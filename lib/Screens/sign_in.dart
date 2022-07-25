import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Screens/sign_up.dart';
import 'package:pub_transport_01/validation/signin_validation.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: welcome(),
      ),
    );
  }
}

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);
  static String id = 'welcome_page';

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  bool isPasswordVisible = true;
  String password = '';
  Widget build(BuildContext context) {
    var MediaHeight = MediaQuery.of(context).size.height;
    var MediaWidth = MediaQuery.of(context).size.width;
    final validationServices = Provider.of<signinValidation>(context);

    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaHeight * 0.1,
              left: MediaWidth * 0.07,
              right: MediaWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaHeight / 4,
                width: MediaWidth / 1.5,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/Logo.png'))),
              ),
              SizedBox(
                height: MediaHeight * 0.02,
              ),
              Text(
                'Welcome To Harakeh',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaHeight * 0.01,
              ),
              Text(
                'Getting Startd',
                style:
                    GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: MediaHeight * 0.03,
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
                height: MediaHeight * 0.03,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                  labelText: 'Passwprd',
                  errorText: validationServices.passeord.error,
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
                    onPressed: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
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
              // MaterialButton(
              //   child: Text(
              //     'Forgot Password ?',
              //     style: TextStyle(color: Colors.red),
              //   ),
              //   onPressed: () {},
              // ),
              SizedBox(
                height: MediaHeight * 0.05,
              ),
              SizedBox(
                height: MediaHeight / 12,
                width: double.infinity,
                child: RaisedButton(
                  color: Color(0xff33C58E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, welcome.id);
                  },
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
                    style: TextStyle(fontSize: 14),
                  ),
                  MaterialButton(
                    child: Text(
                      'Sign Up Here',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
