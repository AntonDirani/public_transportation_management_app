import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:pub_transport_01/Components/constants.dart';

class TripPlanner extends StatelessWidget {
  static String id = 'trip_planner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: NewGradientAppBar(
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text('Trip planner'),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              /*stops: [
                0.02,
                0.5,
              ],*/
              colors: [
                Color(0xFF2c8e82),
                Color(0xFF42dc8f),
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
    return Column(
      children: [
        Container(
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
                              border:
                                  Border.all(color: Colors.blue, width: 3.0),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              'Choose your location',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[850]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.8,
                      height: 25,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(.3),
                              border:
                                  Border.all(color: Colors.orange, width: 3.0),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              'Choose your destination',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[850]),
                            ),
                          ],
                        )
                      ],
                    )
                  ]))
            ],
          ),
        ),
        MaterialButton(
          minWidth: double.infinity,
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: mainColor,
              ),
              Text(
                'Search',
                style: TextStyle(fontSize: 22, color: mainColor),
              ),
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
