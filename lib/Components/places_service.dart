/*
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = 'AIzaSyBOked9er2oWFGuVl2XEMvO8KNMxTw2q8I';

  Future<void> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var respose = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(respose.body);
    // var placeId = json['candidates'] as String;
    print(json);
    //return placeId;
  }
  // FutureMap<<String, dynamic>> getPlaceId(String input) async {}
}
*/
