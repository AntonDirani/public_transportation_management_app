import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';
import 'package:provider/provider.dart';

import '../API/trips_api.dart';
import '../Components/drop_down_object_child_widget.dart';
import '../Components/drop_down_object_item_widget.dart';
import '../Models/trips_model.dart';

class ComplaintScreen extends StatelessWidget {
  static String id = 'complaint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'Complaint',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2c8e82),
                Color(0xFF42dc8f),
              ])),
      body: SingleChildScrollView(child: ComplaintScreenBody()),
    );
  }
}

class ComplaintScreenBody extends StatefulWidget {
  @override
  State<ComplaintScreenBody> createState() => _ComplaintScreenBodyState();
}

class _ComplaintScreenBodyState extends State<ComplaintScreenBody> {
  late List<Trip> trips;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    trips = Provider.of<TripsAPI>(context, listen: false).allTrips;
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Trip> projectValueNotifierFirst =
        ValueNotifier<Trip>(trips[0]);

    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: mediaHeight / 3,
            width: mediaWidth / 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/complaints.png'))),
          ),
          Text('What can we improve?..',
              style: GoogleFonts.montserrat(
                  fontSize: 28, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MiraiPopupMenu<Trip>(
              key: UniqueKey(),
              children: trips,
              space: 4,
              showSearchTextField: true,
              itemWidgetBuilder: (int index, Trip trip) {
                return DropDownItemWidget(trip: trip);
              },
              onChanged: (Trip trip) {
                projectValueNotifierFirst.value = trip;
              },
              child: DropDownObjectChildWidget(
                key: GlobalKey(),
                projectValueNotifier: projectValueNotifierFirst,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
