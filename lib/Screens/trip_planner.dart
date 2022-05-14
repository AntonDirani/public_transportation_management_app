import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Components/dropdown_list.dart';
import 'package:pub_transport_01/Screens/my_google_map.dart';

class TripPlanner extends StatelessWidget {
  static String id = 'trip_planner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: mainColor,
      appBar: NewGradientAppBar(
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'Trip Planner',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
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
          SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              height: mediaSize.height / 4,
              width: mediaSize.width / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Logo.png'))),
            ),
          ),
          ListTile(
            subtitle: Text('Open Google Maps'),
            leading: Icon(
              Icons.map,
              size: mediaSize.width / 11,
              color: mainColor,
            ),
            title: Text(
              'Map',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyMap.id);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
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
          color: Colors.white,
          padding: EdgeInsets.all(12.0),
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
                              color: Colors.lightBlue.withOpacity(.3),
                              border: Border.all(
                                  color: Colors.lightBlue, width: 3.0),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            DropDownPlaces('Choose your location')
                            /*GestureDetector(
                              onTap: () {},

                              child: Text(
                                'Choose your location',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[850]),
                              ),
                            ),*/
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.my_location,
                          color: Colors.grey[850],
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
                              color: Colors.deepOrangeAccent.withOpacity(.3),
                              border: Border.all(
                                  color: Colors.deepOrangeAccent, width: 3.0),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            DropDownPlaces('Choose your location'),
                            /*GestureDetector(
                              onTap: () {
                                print('dest');
                              },
                              child: Text(
                                'Choose your destination',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[850]),
                              ),
                            ),*/
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.swap_vert,
                          color: Colors.grey[850],
                        )
                      ],
                    )
                  ]))
            ],
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
          minWidth: double.infinity,
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: mainColor,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Search Now',
                style: GoogleFonts.montserrat(
                    fontSize: 21,
                    color: mainColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
