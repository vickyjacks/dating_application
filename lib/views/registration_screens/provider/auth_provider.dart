import 'package:datingapp/const/end_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import '../../../services/api_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthProvider with ChangeNotifier {
  final apiObj = ApiServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///! get device token
  String deviceToken = "";
  getDeviceToken(String token) async {
    deviceToken = token;
    notifyListeners();
    // print('this is the device token : $deviceToken');
  }

  /// save user id

  void saveUserId(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', value);
  }

  /// set session code
  int? sessionStatusCode;
  setSessionStatusCode(int code) { 
    sessionStatusCode = code;
    notifyListeners();
  }

  /// login with phone number api
  final phoneController = TextEditingController();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  set loginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  Future sendOtpApi() async {
    _loginLoading = true;
    notifyListeners();
    try {
      Map<String, dynamic> postData = {
        'mobile': phoneController.text,
        'user_fcm_token': deviceToken,
      };
      var response = await apiObj.postData(ApiConstants.sendOtp, postData); 
      _loginLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _loginLoading = false;
      notifyListeners();
      throw Exception("$e");
    }
  }

  /// otp verification

  final otpController = TextEditingController();
  bool _otpLoading = false;
  bool get otpLoading => _otpLoading;
  set otpLoading(bool value) {
    _otpLoading = value;
    notifyListeners();
  }

  Future otpVerifyApi() async {
    _otpLoading = true;
    notifyListeners();
    try {
      Map<String, dynamic> postData = {"mobile": phoneController.text, "otp": otpController.text, "user_fcm_token": deviceToken};
      var response = await apiObj.postData(ApiConstants.verifyOtp, postData);
      debugPrint("+++++++++++68$response");
      _otpLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _otpLoading = false;
      notifyListeners();
      throw Exception("$e");
    }
  }

  ///@ user auth check session manage post

  bool _userSessionManageLoading = false;
  bool get userSessionManageLoading => _userSessionManageLoading;
  set userSessionManageLoading(bool value) {
    _userSessionManageLoading = value;
    notifyListeners();
  }

  Future userSessionManageApi() async {
    _userSessionManageLoading = true;
    // notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.getUserSessionCheckUserDetails, data);
      setSessionStatusCode(response['statusCode']);
      _userSessionManageLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _userSessionManageLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// email api

  bool _emailLoading = false;
  bool get emailLoading => _emailLoading;
  set emailLoading(bool value) {
    _emailLoading = value;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  Future emailPostApi() async {
    _emailLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "email": emailController.text};
      final response = await apiObj.postData(ApiConstants.email, data);
      _emailLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _emailLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// name api

  final TextEditingController nameController = TextEditingController();
  bool _nameLoading = false;
  bool get nameLoading => _nameLoading;
  set nameLoading(bool value) {
    _nameLoading = value;
    notifyListeners();
  }

  Future namePostApi() async {
    _nameLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "name": nameController.text};
      final response = await apiObj.postData(ApiConstants.name, data);
      _nameLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _nameLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// gender api

  bool _genderLoading = false;
  bool get genderLoading => _genderLoading;
  set genderLoading(bool value) {
    _genderLoading = value;
    notifyListeners();
  }

  Future genderPostApi(String gender) async {
    _genderLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "gender": gender};
      final response = await apiObj.postData(ApiConstants.gender, data);
      _genderLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _genderLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// interested in api
  bool _interested = false;
  bool get interested => _interested;
  set interested(bool value) {
    _interested = value;
    notifyListeners();
  }

  Future interestedPostApi(String interested) async {
    _interested = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "interested_in": interested};
      final response = await apiObj.postData(ApiConstants.interested, data);
      _interested = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _interested = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// sexuality api
  bool _sexualityLoading = false;
  bool get sexualityLoading => _sexualityLoading;
  set sexualityLoading(bool value) {
    _sexualityLoading = value;
    notifyListeners();
  }

  Future sexualityPostApi(String sexuality) async {
    _sexualityLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "sexuality": sexuality};
      final response = await apiObj.postData(ApiConstants.sexuality, data);
      _sexualityLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _sexualityLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// relationship api
  bool _relationshipLoading = false;
  bool get relationshipLoading => _relationshipLoading;
  set relationshipLoading(bool value) {
    _relationshipLoading = value;
    notifyListeners();
  }

  Future relationShipPostApi(String relationship) async {
    _relationshipLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "relationship": relationship};
      final response = await apiObj.postData(ApiConstants.relationship, data);
      _relationshipLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _relationshipLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// passion api

  bool _passionLoading = false;
  bool get passionLoading => _passionLoading;
  set passionLoading(bool value) {
    _passionLoading = value;
    notifyListeners();
  }

  Future passionPostApi(String interests) async {
    _passionLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "interests": interests};
      final response = await apiObj.postData(ApiConstants.passion, data);
      _passionLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _passionLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// dob api

  bool _dobLoading = false;
  bool get dobLoading => _dobLoading;
  set dobLoading(bool value) {
    _dobLoading = value;
    notifyListeners();
  }

  Future dobPostApi(
    String dob,
    int age,
  ) async {
    _dobLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "dob": dob, "age": age};
      final response = await apiObj.postData(ApiConstants.dob, data);
      _dobLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _dobLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// face verification profile

  bool _faceVerificationLoading = false;
  bool get faceVerificationLoading => _faceVerificationLoading;
  set faceVerificationLoading(bool value) {
    _faceVerificationLoading = value;
    notifyListeners();
  }

  Future faceVerificationApi(
    String image,
  ) async {
    _faceVerificationLoading = true;
    notifyListeners();
    try {
      final response = await apiObj.uploadImageAndPostApi(apiUrl: ApiConstants.faceVerification, documentDetails: image);
      _faceVerificationLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _faceVerificationLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// dating type looking for
  bool _datingTypeLoading = false;

  bool get datingTypeLoading => _datingTypeLoading;

  set datingTypeLoading(bool value) {
    _datingTypeLoading = value;
    notifyListeners();
  }

  Future datingTypePostApi(String date, String bff) async {
    _datingTypeLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "date": date, "bff": bff};
      final response = await apiObj.postData(ApiConstants.userDatingType, data);
      _datingTypeLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _datingTypeLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// about us post data

  bool _aboutUsLoading = false;
  bool get aboutUsLoading => _aboutUsLoading;
  set aboutUsLoading(bool value) {
    _aboutUsLoading = value;
    notifyListeners();
  }

  final TextEditingController aboutController = TextEditingController();
  Future aboutUsPostApi() async {
    _aboutUsLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "about": aboutController.text};
      final response = await apiObj.postData(ApiConstants.aboutUs, data);
      _aboutUsLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _aboutUsLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// location post api

  bool _isLocationLoading = false;

  bool get isLocationLoading => _isLocationLoading;
  set isLocationLoading(bool value) {
    _isLocationLoading = value;
    // notifyListeners();
  }
  Future<bool> requestLocationPermission() async {
    _isLocationLoading = true;
    // notifyListeners();
    var status = await Permission.location.request();
    _isLocationLoading = false;
    // notifyListeners();
    return status.isGranted;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      _isLocationLoading = true;
      // notifyListeners();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _isLocationLoading = false;
      // notifyListeners();
      return position;
    } catch (e) {
      _isLocationLoading = false;
      // notifyListeners();
      return null;
    }
  }

  Future<String?> getCurrentAddress() async {
    try {
      Position? position = await getCurrentLocation();
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position!.latitude,
        position.longitude,
      );
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks.first;
        // debugPrint("+++++Place-mark Address $placeMarks");
        return "${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.country}, ${placeMark.postalCode}";
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Exception fetching address: $e");
      return null;
    }
  }

  String currentAddress = '';
  void setAddress(value) {
    currentAddress = value;
    notifyListeners();
  }

  LatLng? currentLatLng;
  void setCurrentLatLng(LatLng latLng) {
    currentLatLng = latLng;
    notifyListeners();
  }

  double _latitude = 0.0;
  double get latitude => _latitude;
  set latitude(double value) {
    _latitude = value;
  }

  double _longitude = 0.0;
  double get longitude => _longitude;
  set longitude(double value) {
    _longitude = value;
  }

  void setCurrentLocationLatLng(double lat, double lng) {
    _latitude = lat;
    _longitude = lng;
    notifyListeners();
  }

  Future postUserLatLngPostApi() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "latitude": _latitude, "longitude": _longitude};
      final response = await apiObj.postData(ApiConstants.userLocation, data);
      return response;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  /// distance range api

  bool _distanceRangeLoading = false;
  bool get distanceRangeLoading => _distanceRangeLoading;
  set distanceRangeLoading(bool value) {
    _distanceRangeLoading = value;
    notifyListeners();
  }

  Future distanceRangePostApi(distance) async {
    _distanceRangeLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId, "distance": distance};
      final response = await apiObj.postData(ApiConstants.userDistance, data);
      _distanceRangeLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _distanceRangeLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

}
