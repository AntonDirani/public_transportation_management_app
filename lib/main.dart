import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Screens/complaint.dart';
import 'package:pub_transport_01/Screens/my_google_map.dart';
import 'package:pub_transport_01/Screens/news.dart';
import 'package:pub_transport_01/Screens/sign_up.dart';
import 'package:pub_transport_01/Screens/sign_in.dart';
import 'package:pub_transport_01/API/signin_api.dart';
import 'package:pub_transport_01/API/signup_api.dart';
import 'API/news_api.dart';
import 'Screens/trip_details.dart';
import 'Screens/trips.dart';
import 'Screens/home_screen.dart';
import 'Screens/sign_in.dart';
import 'API/trips_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider<NewsAPI>(
          create: (context) => NewsAPI(),
        ),
        ChangeNotifierProvider<TripsAPI>(
          create: (context) => TripsAPI(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
      ],
      child: Consumer<SignInProvider>(
        builder: (context, auth, child) => MaterialApp(
          key: Key('auth_${auth.isAuth}'),
          theme: ThemeData(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: mainColor)),
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? Trips() : HomePage(),
          routes: {
            HomePage.id: (context) => HomePage(),
            SignInBody.id: (context) => SignInBody(),
            SignUp.id: (context) => SignUp(),
            Trips.id: (context) => Trips(),
            // TripDetails.id: (context) => TripDetails(),
            MyMap.id: (context) => MyMap(),
            ComplaintScreen.id: (context) => ComplaintScreen(),
            NewsScreen.id: (context) => NewsScreen(),
          },
        ),
      ),
    );
  }
}

//here we go
//Tony was here
