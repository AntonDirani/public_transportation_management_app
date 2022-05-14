import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:pub_transport_01/Components/constants.dart';

class MyMap extends StatefulWidget {
  static String id = 'my_google_map';

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  void initState() {
    super.initState();
    setMarker();
  }

  late BitmapDescriptor markerbitmap;

  void setMarker() async {
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(12, 12)),
      'assets/marker.png',
    );
  }

  var initialCameraPosition = CameraPosition(
      target: LatLng(
        33.5138140330628,
        36.31543211698057,
      ),
      zoom: 14.2);

  Set<Marker> _markers = {};

  void _onMapCreate(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          icon: markerbitmap,
          markerId: MarkerId('0'),
          position: LatLng(33.51380897904905, 36.31589383497151),
        ),
      );
      _markers.add(
        Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          markerId: MarkerId('1'),
          position: LatLng(33.50918623023591, 36.31814665426697),
        ),
      );
      _markers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
          markerId: MarkerId('2'),
          position: LatLng(33.518291560995664, 36.31207436842789),
        ),
      );
      _markers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          markerId: MarkerId('3'),
          position: LatLng(33.51997836180592, 36.300852817269835),
        ),
      );
      _markers.add(
        Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          markerId: MarkerId('4'),
          position: LatLng(33.52363263282213, 36.31847255041357),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {},
        child: Icon(Icons.location_searching),
      ),
      appBar: NewGradientAppBar(
          centerTitle: true,
          //backgroundColor: Color(0xFF00D3A0),
          elevation: 0,
          title: Text(
            'My Map',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2c8e82),
                Color(0xFF42dc8f),
              ])),
      body: GoogleMap(
        onMapCreated: _onMapCreate,
        markers: _markers,
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }
}
