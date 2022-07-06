import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../Models/trips_model.dart';
import '../trips_api.dart';

class TripDetails extends StatelessWidget {
  final int index;
  final Trip trip;
  static String id = 'trip_details';

  const TripDetails({required this.trip, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.1,
            0.28,
          ],
              colors: [
            Color(0xFF2c8e82),
            Color(0xFF42dc8f),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Trips',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  )),
                  TripDetailsBody(trip, index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripDetailsBody extends StatefulWidget {
  final int index;
  final Trip trip;
  TripDetailsBody(this.trip, this.index);
  @override
  State<TripDetailsBody> createState() => _TripDetailsBodyState(trip, index);
}

class _TripDetailsBodyState extends State<TripDetailsBody> {
  final int index;
  late List<Trip> trips;
  final Trip trip;
  _TripDetailsBodyState(this.trip, this.index);
  @override
  void initState() {
    super.initState();

    trips = Provider.of<TripsAPI>(context, listen: false).allTrips;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.8,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: trip.buses!.length,
              itemBuilder: (context, index) {
                // final trip = trips[index];
                return buildTrip(trip, context, index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTrip(Trip trip, BuildContext context, int index) {
  print('');
  int buses = trip.buses![index];
  return Column(
    children: [
      ClipRRect(
          child: Image.asset('assets/bus.png',
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.height / 10)),
      SizedBox(
        height: 8,
      ),
      Text('Bus $buses',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500))
    ],
  );
}
