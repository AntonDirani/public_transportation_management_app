import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Screens/my_google_map.dart';
import 'package:pub_transport_01/Screens/sign_up_page.dart';
import 'package:pub_transport_01/Screens/welcome_page.dart';
import 'package:pub_transport_01/validation/signin_validation.dart';
import 'package:pub_transport_01/validation/signup_validation.dart';
import 'Screens/home_page.dart';
import 'Screens/welcome_page.dart';
import 'Screens/trip_planner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (context) => signupValidation(),),
        ChangeNotifierProvider (create: (context) => signinValidation(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: welcome(),
        routes: {
          welcome.id: (context) => welcome(),
          signUp.id: (context) => signUp(),
          TripPlanner.id: (context) => TripPlanner(),
          MyMap.id: (context) => MyMap()
        },
      ),
    );
  }
}

//here we go
//Tony was here
