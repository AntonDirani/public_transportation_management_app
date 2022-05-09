import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_transport_01/Screens/sign_up_page.dart';

//Sh8aleh w alnabi

class welcome_page extends StatefulWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
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
    var MediaHeight= MediaQuery.of(context).size.height ;
    var MediaWidth= MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaHeight * 0.1, left: MediaWidth * 0.07, right: MediaWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:MediaHeight / 4,
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
                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 35 , fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaHeight * 0.01,),
              Text(
                'Getting Startd',
                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: MediaHeight *0.03,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                  labelText: 'Email or Phone Number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color(0xff33C58E),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
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
                height: MediaHeight* 0.05,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Color(0xff33C58E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height / 12,
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, welcome.id);
                },
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
                      Navigator.pushNamed(context, signUp.id);
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
