import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/Components/constants.dart';
import 'package:pub_transport_01/Models/station_model.dart';
import 'package:http/http.dart' as http;
import '../Models/trips_model.dart';

class TripsAPI extends ChangeNotifier {
  List<Trip> allTrips = [
    Trip(
        name: 'Bab Touma, Abbaseen, Baghdad, Tahreer1',
        id: 1,
        buses: [2, 3, 7, 5, 6],
        numBus: 3,
        numStations: 4,
        time: [12, 8, 7, 6],
        stations: [
          Station(
            id: 1,
            lat: 33.51380897904905,
            lng: 36.31589383497151,
            name: 'Bab Sharqi',
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
        name: 'Bab Touma, Qasaa, Abaseen, Karajat',
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
        name: 'Bab Touma, Abbaseen, Baghdad, Tahreer',
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
        name: 'Bab Touma, Abbaseen, Baghdad, Tahreer',
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
        ]),
  ];

  Future<void> fetchProducts() async {
    try {
      final url = Url + 'routes';
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-ACCESS-TOKEN':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjllMDQ1YTNmMWI5NWY2NDk0Y2ViZjgiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE2NTQ1MjQyODJ9.wBlJHgdYkQDb8dKCbir81NlAWWkiuLrjY9iu3V0qaXo'
      });
      final data = jsonDecode(response.body) as List<dynamic>;

      print('here');
      for (int i = 0; i < data.length; i++) {
        final List<Station> loadedStations = [];
        print(data[i]['stations']);
        final decoded = data[i]['stations'];
        print('also');
        print(decoded);
        for (int j = 0; j < decoded.length; j++) {
          loadedStations.add(Station(
              lat: decoded[j]['lat'],
              lng: decoded[j]['lng'],
              name: decoded[j]['name']));
        }
        allTrips.add(Trip(
            name: data[i]['name'],
            buses: data[i]['BusesId'].cast<int>(),
            numBus: data[i]['numBuses'],
            numStations: data[i]['numStations'],
            time: data[i]['time'].cast<int>(),
            stations: loadedStations));
        print(data[i]['stations'].length);
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
