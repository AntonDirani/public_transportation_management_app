import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_transport_01/Screens/welcome_page.dart';

class HomePage extends StatelessWidget {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/LogoWhite.png'))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Text(
                    'تطبيق إدارة و تنظيم حركة المواصلات العامة ضمن مدينة دمشق ',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: double.infinity,
                  ),
                  MaterialButton(

                    minWidth: double.infinity,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height / 13,
                    child: Text('Start Now' ,style: TextStyle(fontSize: 22),),
                    onPressed: () {
                      Navigator.pushNamed(context, welcome.id);
                    },
                  )
                ]),
          ),
        ));
  }
}
