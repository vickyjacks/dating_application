import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  late GoogleMapController googleMapController;
  final googleApiKey = 'AIzaSyDTqsRLPVAa5szoM4bH0OuHJ_ZJEneFbK8';

  List<String> _placeSuggestions = [];
  List<String> get placeSuggestionsList => _placeSuggestions;

  double driverFromCoordinateLat =0.0;
  double driverFromCoordinateLng =0.0;
  String searchAddress = '';
  String eventSearchAddress = '';
  String filterSearchAddress = '';
  void saveAddressAndCoordinatesForFromDriver(
      double lat,
      double long,
      String address,
      String eventAddress,
      String filterAddress) {
    driverFromCoordinateLat = lat;
    driverFromCoordinateLng = long;
    searchAddress = address;
    eventSearchAddress = eventAddress;
    filterSearchAddress = filterAddress;
    notifyListeners();
  }

  void clearSuggestionList() {
    placeSuggestionsList.clear();
    notifyListeners();
  }
  double latitude=0.0;
  double longitude=0.0;
  void setCurrentLocationLatLng(double lat, double lng) {
    latitude = lat;
    longitude = lng;
    notifyListeners();
  }

  //! getting current location on map
  LocationData? _currentLocation;
   LatLng? currentLatLng;
  double? _latitude ;
  double? _longitude;

  void setCurrentLatLng(LatLng latLng) {
    currentLatLng = latLng;
    notifyListeners();
  }
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return Geolocator.getCurrentPosition();
  }
  // Future getCurrentLocation() async {
  //   try {
  //     final Location location = Location();
  //     _currentLocation = await location.getLocation();
  //     _latitude = _currentLocation!.latitude!;
  //     _longitude = _currentLocation!.longitude!;
  //     if (kDebugMode) {
  //       print("+++++++++++++++ 44 $_latitude");
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting location: $e');
  //   }
  //
  //   notifyListeners();
  // }

  //todo: fetching search address function
  Future<void> fetchPlaceSuggestions(String input) async {
    const endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    final response =
    await http.get(Uri.parse('$endpoint?input=$input&key=$googleApiKey'));

    if (response.statusCode == 200) {
      final predictions = json.decode(response.body)['predictions'];

      _placeSuggestions = List<String>.from(predictions.map((prediction) {
        return prediction['description'] as String;
      }));
      notifyListeners();
    } else {
      throw Exception('Failed to load place suggestions');
    }
  }

  //todo: Getting Coordinates of address selected from suggestion list
  Future<LatLng> getLatLngForAddress(String address) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$googleApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final resData = json.decode(response.body);
      if (resData['status'] == 'OK') {
        final location = resData['results'][0]['geometry']['location'];
        double latitude = location['lat'];
        double longitude = location['lng'];

        return LatLng(latitude, longitude);
      } else {
        throw Exception(
            'Failed to get latitude and longitude for the address.');
      }
    } else {
      throw Exception('Failed to fetch data from the geocoding API.');
    }
  }
}