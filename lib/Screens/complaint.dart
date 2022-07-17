import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class ComplaintScreen extends StatelessWidget {
  static String id = 'complaint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'Complaint',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2c8e82),
                Color(0xFF42dc8f),
              ])),
      body: ComplaintScreenBody(),
    );
  }
}

class ComplaintScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: mediaHeight / 3,
            width: mediaWidth / 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/complaints.png'))),
          ),
          Text('What can we improve?..',
              style: GoogleFonts.montserrat(
                  fontSize: 28, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
