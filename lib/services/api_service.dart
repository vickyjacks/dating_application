import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../const/string.dart';

class ApiServices {

  final headers = {'Content-Type': 'application/json', 'Authorization': authToken};

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    final Uri uri = Uri.parse("$baseUrl$endpoint");
    if (kDebugMode) {
      print("url----- :: $uri");
      print("data----- :: $data");
    }
    try {
      final response = await http.post(uri, headers: {'Content-Type': 'application/json',}, body:  jsonEncode(data));
      debugPrint("Response :26: ${response.statusCode}");
      debugPrint("Response :27: ${response.body}");
      if (response.statusCode == 200) {
        debugPrint("Response :: ${response.body}");
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
        // throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> getData(String endpoint) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    final Uri uri = Uri.parse('$baseUrl$endpoint');
    if (kDebugMode) {
      print("get url ---43 $uri");
      print("authToken---- 53 $token");
    }
    try {
      final response = await http.get(uri, headers: {'Content-Type': 'application/json'});
      log("Get Response ::  ${response.statusCode}");
      log("Get Response Body ::  ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> putData(String endpoint, Map<String, dynamic> data) async {
    final Uri uri = Uri.parse("$baseUrl$endpoint");
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    debugPrint("get url --- $uri");
    debugPrint("authToken----$token");
    try {
      final response = await http.put(uri, headers: {'Content-Type': 'application/json', 'Authorization': token.toString()}, body: jsonEncode(data));
      debugPrint("+++++++++68 :: ${response.statusCode}");
      debugPrint("+++++++++68 :: ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to put data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> deleteData(String endpoint, Map<String, dynamic> data) async {
    final Uri uri = Uri.parse('$baseUrl/$endpoint');
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    debugPrint("get url --- $uri");
    debugPrint("authToken----$token");
    debugPrint("data----$data");
    try {
      final response = await http.delete(uri, headers: {'Content-Type': 'application/json', 'Authorization': token.toString()}, body: jsonEncode(data));
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> uploadDocumentsAndPostApis({
    required String apiUrl, required var documentDetails,
    Map<String, String>? postData, bool isPostData = true}) async {
    final Uri uri = Uri.parse("$baseUrl$apiUrl");
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      // Create a multipart request
      debugPrint("uri----$uri");
      debugPrint("postData----$postData");
      debugPrint("documentDetails----$documentDetails");
      debugPrint("Header----$authToken");
      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = token!;
      for (int i = 0; i < documentDetails.length; i++) {
        var documentFile = await http.MultipartFile.fromPath(documentDetails[i]['uploadKey'], documentDetails[i]['documentPath']);
        request.files.add(documentFile);
      }
      if (isPostData == true) {
        request.fields.addAll(postData!);
      }
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      dynamic jsonData = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        debugPrint("jsonData---$jsonData");
        return jsonData;
      } else {
        return jsonData;
      }
    } catch (error) {
      debugPrint('Error123: $error');
    }
  }

  Future uploadImageAndPostApi({required String apiUrl, required var documentDetails}) async {
    final Uri uri = Uri.parse("$baseUrl$apiUrl");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');
    try {
      if (kDebugMode) {
        print("uri----$uri");
        print("postData----$postData");
        print("documentDetails----$documentDetails");
        print("userId----$userId");
      }
      var request = http.MultipartRequest('POST', uri);
      request.fields['user_id'] = userId.toString();
      var pic = await http.MultipartFile.fromPath(
        'image',
        documentDetails,
      );
      request.files.add(pic);
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
       // var jsonData = jsonDecode(responseBody);
      debugPrint("Status Code -- ${response.statusCode}");
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      } else {
        return json.decode(responseBody);
      }
    } catch (error) {
      debugPrint('Error : $error');
    }
  }

  Future uploadImageWithPostApi({required String apiUrl,
    required var documentDetails,
    required String imageKey,
      Map<String, String>? postData, bool isPostData = true
  }) async {
    final Uri uri = Uri.parse("$baseUrl$apiUrl");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');
    try {
      if (kDebugMode) {
        print("uri----$uri");
        print("postData----$postData");
        print("documentDetails----$documentDetails");
        print("userId----$userId");
      }
      var request = http.MultipartRequest('POST', uri);
      if (documentDetails != "") {
        var pic = await http.MultipartFile.fromPath(
          imageKey,
          documentDetails,
        );
        request.files.add(pic);
      }

      if (isPostData == true) {
        request.fields.addAll(postData!);
      }
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      debugPrint("Status Code -- ${response.statusCode}");
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      } else {
        return json.decode(responseBody);
      }
    } catch (error) {
      debugPrint('Error : $error');
    }
  }

}
