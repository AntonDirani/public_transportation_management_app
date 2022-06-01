import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Screens/add_trip_details.dart';
import 'package:pub_transport_01/Screens/add_trip.dart';
import 'package:pub_transport_01/Screens/my_google_map.dart';
import 'package:pub_transport_01/Screens/sign_up_page.dart';
import 'package:pub_transport_01/Screens/trip_details.dart';
import 'package:pub_transport_01/Screens/welcome_page.dart';
import 'package:pub_transport_01/validation/signin_validation.dart';
import 'package:pub_transport_01/validation/signup_validation.dart';
import 'Screens/trips.dart';
import 'Screens/home_page.dart';
import 'Screens/welcome_page.dart';
import 'trips_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TripsAPI>(
          create: (context) => TripsAPI(),
        ),
        ChangeNotifierProvider(
          create: (context) => signupValidation(),
        ),
        ChangeNotifierProvider(
          create: (context) => signinValidation(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: add_trip(),
        routes: {
          add_trip_details.id: (context)=> add_trip_details(),
          add_trip.id:(context)=> add_trip(),
          HomePage.id: (context) => HomePage(),
          welcome.id: (context) => welcome(),
          signUp.id: (context) => signUp(),
          Trips.id: (context) => Trips(),
          TripDetails.id: (context) => TripDetails(),
          MyMap.id: (context) => MyMap()
        },
      ),
    );
  }
}

//here we go
//Tony was here
