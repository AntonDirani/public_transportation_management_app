import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 130, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/Logo.png'))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome To Harakeh',
                style: GoogleFonts.teko(color: Colors.black, fontSize: 50),
              ),
              Text(
                'Getting Startd',
                style: GoogleFonts.alef(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                  labelText: 'Email or Phone Number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color(0xff33C58E),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
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
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                obscureText: isPasswordVisible,
              ),
              SizedBox(
                height: 5,
              ),
              MaterialButton(
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 5,
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
                    onPressed: () {},
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
