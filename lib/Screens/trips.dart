import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/Components/my_drawer.dart';
import 'package:pub_transport_01/Screens/trip_details.dart';
import 'package:pub_transport_01/Models/trips_model.dart';
import '../Components/search_bar.dart';
import '../API/trips_api.dart';

class Trips extends StatefulWidget {
  static String id = 'trips';

  @override
  State<Trips> createState() => TripsState();
}

class TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Trips',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
      /*NewGradientAppBar(
            centerTitle: true,
            //backgroundColor: Color(0xFF00D3A0),
            elevation: 0,

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                */ /*stops: [
                  0.02,
                  0.5,
                ],*/ /*
                colors: [
                  Color(0xFF2c8e82),
                  Color(0xFF42dc8f),
                ])),*/
      ,
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
  String query = '';

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TripsAPI>(context, listen: false);
    trips = provider.allTrips;
    provider.fetchProducts();
  }

  @override
  Widget build(BuildContext context1) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 22),
              height: MediaQuery.of(context).size.height / 6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.02,
                        0.5,
                      ],
                      colors: [
                        Color(0xFF2c8e82),
                        Color(0xFF42dc8f),
                      ])),
            ),
            Positioned(
              child: SearchBar(),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          //Listview
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return buildTrip(trip, context1, index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget SearchBar() => SearchWidget(
        text: query,
        hintText: 'Search for a trip..',
        onChanged: searchTrip,
      );

  void searchTrip(String query) {
    final trips =
        Provider.of<TripsAPI>(context, listen: false).allTrips.where((trip) {
      final nameLower = trip.name?.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower!.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.trips = trips;
    });
  }

  Widget buildTrip(Trip trip, BuildContext context, int index) {
    return ListTile(
        leading: SvgPicture.asset(
          'assets/route_icon.svg',
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
        title: Text(
          trip.name!,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Click to see details'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TripDetails(
              index: index,
              trip: trip,
            );
          }));
        });
  }
}
