import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Models/station_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/trips_model.dart';

class TripsAPI extends ChangeNotifier {
  List<Station> _allStations = [];
  Set<Marker> allMarkers = {};

  List<Trip> allTrips = [
    /*Trip(
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
        ]),
    Trip(
        time: [11, 9, 7, 6],
        name: 'Qasaa, Abaseen, Karajat, Boulman',
        id: 1,
        buses: [2, 3, 7],
        numBus: 3,
        numStations: 4,
        stations: [
          Station(
            id: 2,
            lat: 33.51380897904905,
            lng: 36.31589383497151,
            name: 'Qasaa',
          ),
          Station(
            id: 3,
            lat: 33.51380897904905,
            lng: 36.31589383497151,
            name: 'Abbaseen',
          ),
          Station(
            id: 4,
            lat: 33.51380897904905,
            lng: 36.31589383497151,
            name: 'Tahreer',
          ),
        ]),
    Trip(
        time: [12, 8, 7, 6],
        name: 'Bab Sharqi, Bab Touma, Mhajreen',
        id: 1,
        buses: [2, 3, 7],
        numBus: 3,
        numStations: 4,
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
        ]),
    Trip(
        time: [12, 8, 7, 6],
        name: 'Jaramanah, Tabaleh, Dwelaa, Bab Touma',
        id: 1,
        buses: [2, 8, 7, 6],
        numBus: 3,
        numStations: 4,
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
        ]),*/
  ];

  String? _token;
  Future<void> fetchProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      print(_token);
      final url = Url + 'routes';
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-ACCESS-TOKEN': '$_token'
      });
      final data = jsonDecode(response.body) as List<dynamic>;
      final List<Trip> loadedTrips = [];
      for (int i = 0; i < data.length; i++) {
        final List<Station> loadedStations = [];
        final decoded = data[i]['stations'];
        for (int j = 0; j < decoded.length; j++) {
          loadedStations.add(Station(
              lat: decoded[j]['lat'],
              lng: decoded[j]['lng'],
              name: decoded[j]['name']));
        }
        loadedTrips.add(Trip(
            name: data[i]['name'],
            buses: data[i]['BusesId'].cast<int>(),
            numBus: data[i]['numBuses'],
            numStations: data[i]['numStations'],
            time: data[i]['time'].cast<int>(),
            stations: loadedStations));
        print(data[i]['stations'].length);
      }
      allTrips = loadedTrips;
      await setMarker();
      await loadStations();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  var _customMarker;
  Future<void> setMarker() async {
    _customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/marker.png',
    );
  }

  Future<void> loadStations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    print(_token);
    final url = Url + 'stations';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-ACCESS-TOKEN': '$_token'
    });
    final data = jsonDecode(response.body) as List<dynamic>;

    final List<Station> loadedStations = [];
    for (int j = 0; j < data.length; j++) {
      final decoded = data;
      loadedStations.add(Station(
          lat: decoded[j]['lat'],
          lng: decoded[j]['lng'],
          name: decoded[j]['name']));
      _allStations = loadedStations;
    }

    loadMarkers();
    notifyListeners();
  }

  Future<void> loadMarkers() async {
    Set<Marker> loadedMarkers = {};
    for (int i = 0; i < _allStations.length; i++) {
      loadedMarkers.add(Marker(
        icon: _customMarker,
        infoWindow: InfoWindow(
          title: _allStations[i].name,
        ),
        markerId: MarkerId(i.toString()),
        position: LatLng(_allStations[i].lat!, _allStations[i].lng!),
      ));
    }
    allMarkers = loadedMarkers;

    notifyListeners();
  }
}
