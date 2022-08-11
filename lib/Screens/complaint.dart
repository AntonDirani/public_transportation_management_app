import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';
import 'package:provider/provider.dart';
import 'package:pub_transport_01/API/complaint_api.dart';
import '../API/trips_api.dart';
import '../Components/constants.dart';
import '../Components/drop_down_object_child_widget.dart';
import '../Components/drop_down_object_item_widget.dart';

import '../Models/station_model.dart';
import '../Models/trips_model.dart';

class ComplaintScreen extends StatefulWidget {
  static String id = 'complaint';

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  void initState() {
    super.initState();
  }

  late List<Trip> trips;
  late String _tripName;
  late int _busNum;
  late String _content;
  final ValueNotifier<Trip> projectValueNotifierFirst =
      ValueNotifier<Trip>(Trip(
          name: 'Bab Touma, Abbaseen, Baghdad, Tahreer',
          id: 1,
          buses: [2, 3, 7, 5, 6],
          numBus: 3,
          numStations: 4,
          time: [5, 9, 4, 6],
          stations: [
            Station(
              id: 1,
              lat: 33.51380897904905,
              lng: 36.31589383497151,
              name: 'Bab Touma',
            ),
            Station(
              id: 2,
              lat: 33.51380897904905,
              lng: 36.31589383497151,
              name: 'Abbaseen',
            ),
            Station(
              id: 3,
              lat: 33.51380897904905,
              lng: 36.31589383497151,
              name: 'Baghdad',
            ),
            Station(
              id: 4,
              lat: 33.51380897904905,
              lng: 36.31589383497151,
              name: 'Tahreer',
            ),
          ]));

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    trips = Provider.of<TripsAPI>(context, listen: false).allTrips;
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: NewGradientAppBar(
            actions: [
              if (_isLoading)
                Center(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ))
              else
                IconButton(
                    onPressed: () async {
                      try {
                        print('f');
                        _sendComplaint();
                      } catch (error) {
                        print(error);
                      }
                    },
                    icon: Icon(Icons.send))
            ],
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
        body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(children: [
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
                SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: MiraiPopupMenu<Trip>(
                      mode: MiraiPopupMenuMode.popupMenu,
                      showMode: MiraiShowMode.bottom,
                      key: UniqueKey(),
                      children: trips,
                      space: 4,
                      maxHeight: 300,
                      showSearchTextField: true,
                      itemWidgetBuilder: (int index, Trip trip) {
                        return DropDownItemWidget(trip: trip);
                      },
                      onChanged: (Trip trip) {
                        projectValueNotifierFirst.value = trip;
                        _tripName = trip.name.toString();
                      },
                      child: DropDownObjectChildWidget(
                        key: GlobalKey(),
                        projectValueNotifier: projectValueNotifierFirst,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Bus number',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String? value) {
                      _busNum = int.parse(value!);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(
                  height: mediaHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      //  floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Type your complaints here.',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff33C58E))),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (String value) {
                      print(value);
                      _content = value.toString();
                    },
                    textInputAction: TextInputAction.done,
                  ),
                )
              ]),
            )));
  }

  void showError(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Result'),
              content: Text(message),
              actions: [
                MaterialButton(
                    child: Text(
                      'Okay',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: mainColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ));
  }

  Future<void> _sendComplaint() async {
    try {
      setState(() {
        _isLoading = true;
      });

      var response = await Provider.of<ComplaintsAPI>(context, listen: false)
          .sendComplaint(_tripName, _busNum, _content);
      showError(response);
    } catch (error) {
      var message = ('Please try again later!');
      showError(message);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
