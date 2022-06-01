import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Models/trips_model.dart';
import 'package:pub_transport_01/Screens/trips.dart';

import '../Components/constants.dart';
class add_trip extends StatefulWidget {
  static String id = 'add_trip';

  const add_trip({Key? key}) : super(key: key);

  @override
  State<add_trip> createState() => _add_tripState();
}

class _add_tripState extends State<add_trip> {
  @override
  var trip = new Trip();
  Widget build(BuildContext context) {
    var MediaHeight= MediaQuery.of(context).size.height ;
    var MediaWidth= MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(create: (context) {} , child: MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: MediaHeight * 0.1, left: MediaWidth * 0.07, right: MediaWidth * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add Trip',
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
                      labelText: 'Trip Name',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.drive_file_rename_outline,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value){
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight *0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Number Of Stations',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.drive_file_rename_outline,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value){
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight *0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'Number Of Buses',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.drive_file_rename_outline,
                        color: Color(0xff33C58E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value){
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: MediaHeight *0.02,
                  ),
                  Container(
                    width: MediaWidth * 0.5,
                    height: MediaHeight *0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF32bd8d),
                    ),
                    child:  IconButton(
                      icon: const Icon(Icons.play_arrow_sharp , color: Colors.white ,size: 25,),
                      onPressed: () {
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaHeight *0.02,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
