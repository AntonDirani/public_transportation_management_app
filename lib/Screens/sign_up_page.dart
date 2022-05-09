import 'package:flutter/cupertino.dart';
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
    var MediaHeight= MediaQuery.of(context).size.height ;
    var MediaWidth= MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              height:MediaHeight / 3,
              width: MediaWidth / 1,
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage('assets/Road.png'))),
            ),
          Padding(
            padding: EdgeInsets.only( left: MediaWidth * 0.07, right: MediaWidth * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaHeight * 0.3,),
                Text('Sign Up' , style: GoogleFonts.montserrat( color:   Colors.black , fontSize: 35 , fontWeight: FontWeight.w600),),
                SizedBox(height: MediaHeight * 0.03,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 2, color: Color(0xff33C58E))),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xff33C58E),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: MediaHeight * 0.03,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 2, color: Color(0xff33C58E))),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xff33C58E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: MediaHeight * 0.03,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 2, color: Color(0xff33C58E))),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xff33C58E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: MediaHeight * 0.03,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 2, color: Color(0xff33C58E))),
                    labelText: 'Confrim Password',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xff33C58E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: MediaHeight * 0.03,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 2, color: Color(0xff33C58E))),
                    labelText: 'National Number',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: Color(0xff33C58E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: MediaHeight * 0.03,),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color(0xff33C58E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height / 12,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, welcome.id);
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
