import 'package:pub_transport_01/Models/station_model.dart';

class Trip {
  int? id;
  String? name;
  int? numBus;
  List<Station>? stations;
  int? numStations;
  List<int>? buses;

  Trip(
      {this.name,
      this.id,
      this.buses,
      this.numBus,
      this.numStations,
      this.stations});
}
