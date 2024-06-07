
import 'package:datingapp/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/end_point.dart';
import '../model/fetch_swipe_matching_user_list_model.dart';

class MatchingProvider with ChangeNotifier{
  final apiObj = ApiServices();

  /// fetch matching user swipe api
  bool _fetchMatchingSwipeLoading = false;
  bool get fetchMatchingSwipeLoading => _fetchMatchingSwipeLoading;
  set fetchMatchingSwipeLoading(bool value) {
    _fetchMatchingSwipeLoading = value;
    notifyListeners();
  }

  FetchSwipeMatchedUserListModel  _fetchSwipeMatchedUserListModel = FetchSwipeMatchedUserListModel();
  FetchSwipeMatchedUserListModel get fetchSwipeMatchedUserListModel => _fetchSwipeMatchedUserListModel;
  set fetchSwipeMatchedUserListModel(FetchSwipeMatchedUserListModel value) {
    _fetchSwipeMatchedUserListModel = value;
    notifyListeners();
  }

  Future fetchMatchingSwipeUserListApi()async{
    _fetchMatchingSwipeLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.fetchShowUSerMatching,data);
      _fetchSwipeMatchedUserListModel = FetchSwipeMatchedUserListModel.fromMap(response);
      _fetchMatchingSwipeLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchMatchingSwipeLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


}