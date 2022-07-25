import 'package:pub_transport_01/Models/station_model.dart';
import 'package:pub_transport_01/Models/trips_model.dart';

class Bus {
  int? id;
  Station? startingStation;
  Trip? trip;
  List<bool>? workingDays;
  int? strHour;
  int? enHour;
  bool? free;

  Bus(
      {required this.id,
      required this.startingStation,
      required this.trip,
      required this.workingDays,
      required this.strHour,
      required this.enHour,
      required this.free});
}
