import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Components/constants.dart';

import '../Models/trips_model.dart';
import '../API/trips_api.dart';

class TripDetails extends StatelessWidget {
  final int index;
  final Trip trip;
  static String id = 'trip_details';

  const TripDetails({required this.trip, required this.index});

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    String datetime3 = DateFormat.yMMMMEEEEd().format(datetime);
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
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
              height: 15,
            ),
            Text('$datetime3',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 20,
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
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 7.5,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 15, top: 0, right: 0, bottom: 0),
                scrollDirection: Axis.horizontal,
                itemCount: trip.buses!.length,
                itemBuilder: (context, index) {
                  return buildBus(trip, context, index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1.2,
            color: mainColor,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: trip.stations!.length,
                        itemBuilder: (context, index) {
                          return buildTrip(trip, context, index);
                        }),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                      child: ListView.builder(
                          itemCount: trip.time!.length,
                          itemBuilder: (context, index) {
                            return buildTime(trip, context, index);
                          })),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTrip(Trip trip, BuildContext context, int index) {
    var station = trip.stations![index].name!;
    var ind = index + 1;
    return ListTile(
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        leading: Transform.translate(
          offset: Offset(0, 8),
          child: Image.asset(
            'assets/Oval2.png',
            fit: BoxFit.cover,
            /*height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.height / 8))*/
          ),
        ),
        /*leading: Image.asset('assets/Oval.png',
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.height / 20),*/
        title: Text(
          '$ind. $station',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        //subtitle: Text('$trip.'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TripDetails(
              index: index,
              trip: trip,
            );
          }));
        });
  }

  Widget buildTime(Trip trip, BuildContext context, int index) {
    int time = trip.time![index];
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(
        Icons.timelapse,
        color: mainColor,
      ),
      title: Text('$time minutes to reach next stop'),
    );
  }
}

Widget buildBus(Trip trip, BuildContext context, int index) {
  int buses = trip.buses![index];
  return Column(
    children: [
      ClipRRect(
          child: Image.asset('assets/bus.png',
              height: MediaQuery.of(context).size.height / 10.5,
              width: MediaQuery.of(context).size.height / 10.5)),
      SizedBox(
        height: MediaQuery.of(context).size.height / 70,
      ),
      Text('Bus $buses',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height / 51))
    ],
  );
}
