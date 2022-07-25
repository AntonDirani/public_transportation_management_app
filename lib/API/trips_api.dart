import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/Models/station_model.dart';

import '../Models/trips_model.dart';

class TripsAPI extends ChangeNotifier {
  List<Trip> allTrips = [
    Trip(
        name: 'Bab Touma, Abbaseen, Baghdad, Tahreer1',
        id: 1,
        buses: [2, 3, 7, 5, 6],
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
  ];
}
