import 'package:pub_transport_01/station_model.dart';

class Trip {
  final int id;
  final String name;
  final int numBus;
  List<Station> stations;
  final int numStations;
  List<int> buses;

  Trip(
      {required this.name,
      required this.id,
      required this.buses,
      required this.numBus,
      required this.numStations,
      required this.stations});
}
