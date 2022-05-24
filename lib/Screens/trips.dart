import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Components/my_drawer.dart';
import 'package:pub_transport_01/Screens/trip_details.dart';
import 'package:pub_transport_01/trips_model.dart';

import '../trips_api.dart';

class Trips extends StatefulWidget {
  static String id = 'trips';

  @override
  State<Trips> createState() => TripsState();
}

class TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: NewGradientAppBar(
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'Trips',
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
      body: TripsBody(),
    );
  }
}

class TripsBody extends StatefulWidget {
  @override
  State<TripsBody> createState() => _TripsBodyState();
}

class _TripsBodyState extends State<TripsBody> {
  late List<Trip> trips;

  @override
  void initState() {
    super.initState();

    trips = Provider.of<TripsAPI>(context, listen: false).Trips;
  }

  @override
  Widget build(BuildContext context1) {
    return Column(
      children: [
        //SearchBar(),
        Expanded(
            child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            final trip = trips[index];

            return buildTrip(trip, context1);
          },
        ))
      ],
    );
  }
}

Widget buildTrip(Trip trip, BuildContext context) {
  return ListTile(
      leading: Image.asset(
        'assets/bus.png',
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      title: Text(
        trip.name,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
      ),
      subtitle: Text('Click to see details'),
      onTap: () {
        Navigator.pushNamed(context, TripDetails.id);
      });
}
