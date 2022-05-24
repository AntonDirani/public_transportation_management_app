import 'package:flutter/material.dart';
import 'package:pub_transport_01/Screens/trips.dart';

class TripDetails extends StatelessWidget {
  static String id = 'trip_details';
  final Trips? tripDetails;

  const TripDetails({this.tripDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
