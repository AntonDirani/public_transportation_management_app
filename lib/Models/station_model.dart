import 'package:flutter/cupertino.dart';

class Station extends ChangeNotifier {
  int? id;
  String? name;
  double? lat;
  double? lng;

  Station({this.id, required this.lat, required this.lng, required this.name});
}
