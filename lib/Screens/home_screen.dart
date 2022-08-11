import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pub_transport_01/Screens/sign_in.dart';

import 'trips.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.01,
                0.35,
                0.9
              ],
                  colors: [
                Color(0xFF276174),
                Color(0xFF33c58e),
                Color(0xFF63fd88)
              ])),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 60, 35, 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/LogoWhite.png'))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Text(
                    'تطبيق إدارة و تنظيم حركة المواصلات العامة ضمن مدينة دمشق ',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height / 12,
                    child: Text(
                      'Start Now',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      //Navigator.pushNamed(context, SignIn.id);
                    },
                  ),
                  MaterialButton(
                      minWidth: double.infinity,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Text(
                        'test',
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Trips.id);
                      })
                ]),
          ),
        ));
  }
}
