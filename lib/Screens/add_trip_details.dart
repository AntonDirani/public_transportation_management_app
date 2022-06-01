import 'package:flutter/material.dart';
class add_trip_details extends StatefulWidget {
  static String id = 'add_trip_details';


  @override
  State<add_trip_details> createState() => _add_trip_detailsState();
}

class _add_trip_detailsState extends State<add_trip_details> {
  @override
  Widget build(BuildContext context) {
    var MediaHeight= MediaQuery.of(context).size.height ;
    var MediaWidth= MediaQuery.of(context).size.width;
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stations' ,style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,

        ),
        backgroundColor: Colors.white,
        body: ListView.builder(itemCount: 3,itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.only(top: MediaHeight * 0.01, left: MediaWidth * 0.07, right: MediaWidth * 0.07),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                          BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelText: 'First Station Name',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.location_on,
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
                    height: MediaHeight *0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaWidth * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                BorderSide(width: 2, color: Color(0xff33C58E))),
                            labelText: 'lon',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.location_on,
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
                      ),
                      SizedBox(width: MediaWidth *0.05,),
                      Container(
                        width: MediaWidth * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                BorderSide(width: 2, color: Color(0xff33C58E))),
                            labelText: 'lat',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.location_on,
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
                      ),
                    ],
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
                      labelText: 'Time Rquired Between Stations',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.location_on,
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
                    height: MediaHeight *0.03,
                  ),
                ],
              )
            ),
          );
        }),
      )
    );
  }
}
