import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class GoogleLocationSearch {
  final String _httpRequestHead =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=';
  final String _httpRequestTail = '&components=country:in&key=';
  final String _apiKey = 'YOUR KEY OF GOOGLE AUTOCOMPLETE PLACE API';

  Future getSearchResult(String searchText) async {
    searchText = searchText.replaceAll(' ', '%20');
    searchText = searchText.replaceAll(',', '%2C');

    final response = await http
        .get(_httpRequestHead + searchText + _httpRequestTail + _apiKey);
    return jsonDecode(response.body)['predictions'];
  }

  Future getCurrentLocation() async {
    final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;
    return geoLocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((position) {
      return Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude)
          .then((place) {
        return place[0].name +
            ', ' +
            place[0].subLocality +
            ', ' +
            place[0].locality;
      });
    }).catchError((error) {
      return 'Grant location from Settings';
    });
  }
}
