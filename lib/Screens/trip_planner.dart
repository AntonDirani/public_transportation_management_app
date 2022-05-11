import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class TripPlanner extends StatelessWidget {
  static String id = 'trip_planner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00D59C),
      appBar: NewGradientAppBar(
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text('Trip planner'),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.02,
                0.5,
                0.99
              ],
              colors: [
                Color(0xFF276174),
                Color(0xFF33c58e),
                Color(0xFF63fd88)
              ])),
      body: Column(
        children: [
          LocationSelector(),
        ],
      ),
    );
  }
}

class LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(.3),
                        border: Border.all(color: Colors.blue, width: 3.0),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        'From',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        'From',
                        style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
