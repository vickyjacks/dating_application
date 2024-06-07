import 'package:datingapp/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/end_point.dart';
import '../model/fetch_feed_model.dart';

class FeedProvider with ChangeNotifier {
  final apiObj = ApiServices();

  /// fetch feed provider

  bool _fetchFeedLoading = false;
  bool get fetchFeedLoading => _fetchFeedLoading;
  set fetchFeedLoading(bool value) {
    _fetchFeedLoading = value;
    notifyListeners();
  }

  FetchFeedDetailModel _fetchFeedDetailModel = FetchFeedDetailModel();
  FetchFeedDetailModel get fetchFeedDetailModel => _fetchFeedDetailModel;
  set fetchFeedDetailModel(FetchFeedDetailModel value) {
    _fetchFeedDetailModel = value;
    notifyListeners();
  }

  Future fetchFeedDetailsApi() async {
    _fetchFeedLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId.toString()};
      final response = await apiObj.postData(ApiConstants.fetchFeed, data);
      _fetchFeedDetailModel = FetchFeedDetailModel.fromMap(response);
      _fetchFeedLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      _fetchFeedLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// upload feed api

  bool _uploadFeedLoading = false;
  bool get uploadFeedLoading => _uploadFeedLoading;
  set uploadFeedLoading(bool value) {
    _uploadFeedLoading = value;
    notifyListeners();
  }

  final TextEditingController feedController = TextEditingController();
  Future uploadFeedApi(documentDetails) async {
    _uploadFeedLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      Map<String, String> postData = {
        "user_id": userId.toString(),
        "description": feedController.text
      };
      final response = await apiObj.uploadImageWithPostApi(
          apiUrl: ApiConstants.uploadFeed,
          documentDetails: documentDetails,
          imageKey: "images",
          postData: postData);
      if(response["status"]==true){
        fetchFeedDetailsApi();
      }
      _uploadFeedLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _uploadFeedLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }
}
