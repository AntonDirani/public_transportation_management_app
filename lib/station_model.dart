class Station {
  final int id;
  final String name;
  final double lat;
  final double lng;
  final int time;

  const Station(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name,
      required this.time});
}
