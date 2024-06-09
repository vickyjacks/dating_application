
import 'package:datingapp/services/api_service.dart';
import 'package:datingapp/views/hitmeup/model/fetch_hitmeup_explore_list_model.dart';
import 'package:datingapp/views/hitmeup/model/fetch_hitmeup_upcoming_list_model.dart';
import 'package:datingapp/views/location/provider/location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/end_point.dart';
import '../model/fetch_hitmeup_category_name_list_model.dart';
import '../model/fetch_hitmeup_request_list_model.dart';
import '../model/fetch_my_hitmeup_detail_model.dart';

class HitMeUpProvider with ChangeNotifier{
  final apiObj = ApiServices();

  /// fetch hit me up category list  api
  bool _fetchHitMeUpCategoryNameLoading = false;
  bool get fetchHitMeUpCategoryNameLoading => _fetchHitMeUpCategoryNameLoading;
  set fetchHitMeUpCategoryNameLoading(bool value) {
    _fetchHitMeUpCategoryNameLoading = value;
    notifyListeners();
  }

  FetchHitMeUpCategoryNameListModel  _fetchHitMeUpCategoryNameListModel = FetchHitMeUpCategoryNameListModel();
  FetchHitMeUpCategoryNameListModel get fetchHitMeUpCategoryNameListModel => _fetchHitMeUpCategoryNameListModel;
  set fetchHitMeUpCategoryNameListModel(FetchHitMeUpCategoryNameListModel value) {
    _fetchHitMeUpCategoryNameListModel = value;
    notifyListeners();
  }

  Future fetchHitMeUpCategoryNameListApi()async{
    _fetchHitMeUpCategoryNameLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchShowHitMeUpCategory);
      _fetchHitMeUpCategoryNameListModel = FetchHitMeUpCategoryNameListModel.fromMap(response);
      _fetchHitMeUpCategoryNameLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchHitMeUpCategoryNameLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


  /// fetch my hit me up details  api
  bool _fetchMyHitMeUpDetailsLoading = false;
  bool get fetchMyHitMeUpDetailsLoading => _fetchMyHitMeUpDetailsLoading;
  set fetchMyHitMeUpDetailsLoading(bool value) {
    _fetchMyHitMeUpDetailsLoading = value;
    notifyListeners();
  }

  FetchMyHitMeUpDetailModel  _fetchMyHitMeUpDetailModel = FetchMyHitMeUpDetailModel();
  FetchMyHitMeUpDetailModel get fetchMyHitMeUpDetailModel => _fetchMyHitMeUpDetailModel;
  set fetchMyHitMeUpDetailModel(FetchMyHitMeUpDetailModel value) {
    _fetchMyHitMeUpDetailModel = value;
    notifyListeners();
  }

  Future fetchMyHitMeUpDetailApi()async{
    _fetchMyHitMeUpDetailsLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.fetchMyHitMeUp,data);
      _fetchMyHitMeUpDetailModel = FetchMyHitMeUpDetailModel.fromMap(response);
      _fetchMyHitMeUpDetailsLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchMyHitMeUpDetailsLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// delete my hit up

  bool _deleteMyHitMeLoading= false;
  bool get deleteMyHitMeLoading => _deleteMyHitMeLoading;
  set deleteMyHitMeLoading(bool value) {
    _deleteMyHitMeLoading = value;
    notifyListeners();
  }

  Future deleteMyHitMeUpApi(int hitMeUpId) async {
    _deleteMyHitMeLoading = true;
    notifyListeners();
    try {
      final data = {
        "hitmeup_id": hitMeUpId
      };
      final response = await apiObj.postData(ApiConstants.deleteHitMeUp, data);
      _deleteMyHitMeLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _deleteMyHitMeLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }



  /// fetch hit me up request api
  bool _fetchHitMeUpRequestLoading = false;
  bool get fetchHitMeUpRequestLoading => _fetchHitMeUpRequestLoading;
  set fetchHitMeUpRequestLoading(bool value) {
    _fetchHitMeUpRequestLoading = value;
    notifyListeners();
  }

  FetchHitMeUpRequestListModel  _fetchHitMeUpRequestListModel = FetchHitMeUpRequestListModel();
  FetchHitMeUpRequestListModel get fetchHitMeUpRequestListModel => _fetchHitMeUpRequestListModel;
  set fetchHitMeUpRequestListModel(FetchHitMeUpRequestListModel value) {
    _fetchHitMeUpRequestListModel = value;
    notifyListeners();
  }

  Future fetchHitMeUpRequestListApi()async{
    _fetchHitMeUpRequestLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.hitMeUpRequests,data);
      _fetchHitMeUpRequestListModel = FetchHitMeUpRequestListModel.fromMap(response);
      _fetchHitMeUpRequestLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchHitMeUpRequestLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// hit me up request delete or accept api
  bool _hitMeUpRequestDeleteOrAcceptLoading= false;
  bool get hitMeUpRequestDeleteOrAcceptLoading => _hitMeUpRequestDeleteOrAcceptLoading;
  set hitMeUpRequestDeleteOrAcceptLoading(bool value) {
    _hitMeUpRequestDeleteOrAcceptLoading = value;
    notifyListeners();
  }

  Future hitMeUpRequestDeleteOrAcceptApi(String senderId,String hitStatus) async {
    _hitMeUpRequestDeleteOrAcceptLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {
        "user_id": userId,
        "sender_id": senderId,
        "status": hitStatus,
      };
      final response = await apiObj.postData(ApiConstants.hitMeUpRequestsAcceptOrReject, data);
      _hitMeUpRequestDeleteOrAcceptLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _hitMeUpRequestDeleteOrAcceptLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


/// fetch hit me up explore api 
 bool _fetchHitMeUpExploreLoading = false;
  bool get fetchHitMeUpExploreLoading => _fetchHitMeUpExploreLoading;
  set fetchHitMeUpExploreLoading(bool value) {
    _fetchHitMeUpExploreLoading = value;
    notifyListeners();
  }

  FetchHitMeUpExploretListModel  _fetchHitMeUpExploreListModel = FetchHitMeUpExploretListModel();
  FetchHitMeUpExploretListModel get fetchHitMeUpExploreListModel => _fetchHitMeUpExploreListModel;
  set fetchHitMeUpExploreListModel(FetchHitMeUpExploretListModel value) {
    _fetchHitMeUpExploreListModel = value;
    notifyListeners();
  }

  Future fetchHitMeUpExploreListApi()async{
    _fetchHitMeUpExploreLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.fetchHitMeUpExplore,data);
      _fetchHitMeUpExploreListModel = FetchHitMeUpExploretListModel.fromMap(response);
      _fetchHitMeUpExploreLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchHitMeUpExploreLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


/// fetch hit me up upcoming api 
 bool _fetchHitMeUpUpcomingLoading = false;
  bool get fetchHitMeUpUpcomingLoading => _fetchHitMeUpUpcomingLoading;
  set fetchHitMeUpUpcomingLoading(bool value) {
    _fetchHitMeUpUpcomingLoading = value;
    notifyListeners();
  }

  FetchHitMeUpUpcomingListModel  _fetchHitMeUpUpcomingListModel = FetchHitMeUpUpcomingListModel();
  FetchHitMeUpUpcomingListModel get fetchHitMeUpUpcomingListModel => _fetchHitMeUpUpcomingListModel;
  set fetchHitMeUpUpcomingListModel(FetchHitMeUpUpcomingListModel value) {
    _fetchHitMeUpUpcomingListModel = value;
    notifyListeners();
  }

  Future fetchHitMeUpUpcomingListApi()async{
    _fetchHitMeUpUpcomingLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response = await apiObj.postData(ApiConstants.fetchHitMeUpUpcoming,data);
      _fetchHitMeUpUpcomingListModel = FetchHitMeUpUpcomingListModel.fromMap(response);
      _fetchHitMeUpUpcomingLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchHitMeUpUpcomingLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// hit me up upcoming delete api
  bool _hitMeUpUpcomingDeleteLoading= false;
  bool get hitMeUpUpcomingDeleteLoading => _hitMeUpUpcomingDeleteLoading;
  set hitMeUpUpcomingDeleteLoading(bool value) {
    _hitMeUpUpcomingDeleteLoading = value;
    notifyListeners();
  }

  Future hitMeUpUpcomingDeleteApi(String receiverId) async {
    _hitMeUpUpcomingDeleteLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {
        "sender_id": userId,
        "receiver_id": receiverId
      };
      final response = await apiObj.postData(ApiConstants.deleteHitMeUpUpcoming, data);
      _hitMeUpUpcomingDeleteLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _hitMeUpUpcomingDeleteLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// hit me up send request explore api
  bool _sendRequestExploreHitMeUpLoading= false;
  bool get sendRequestExploreHitMeUpLoading => _sendRequestExploreHitMeUpLoading;
  set sendRequestExploreHitMeUpLoading(bool value) {
    _sendRequestExploreHitMeUpLoading = value;
    notifyListeners();
  }

  Future sendRequestHitMeUpApi(String receiverId) async {
    _hitMeUpUpcomingDeleteLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"sender_id": userId,
        "receiver_id": receiverId
      };
      final response = await apiObj.postData(ApiConstants.sendExploreRequestHitMeUp, data);
      _hitMeUpUpcomingDeleteLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _hitMeUpUpcomingDeleteLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// store hit me up category name category id
  String hitMeUpCategoryName = '';
  int hitMeUpCategoryId = 0;
  void saveHitMeCategoryData(String categoryName,int categoryId) {
    hitMeUpCategoryName = categoryName;
    hitMeUpCategoryId = categoryId;
    notifyListeners(); 
  }
/// create hit me up api 

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  bool _createHitMeUpLoading= false;
  bool get createHitMeUpLoading => _createHitMeUpLoading;
  set createHitMeUpLoading(bool value) {
    _createHitMeUpLoading = value;
    notifyListeners();
  }

  Future createHitMeUpApi(String date,String time,String locationRange,loctionDetail) async {
    _createHitMeUpLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
        final data = {
          "user_id": userId,
           "category_id": hitMeUpCategoryId, 
           "title": titleController.text, 
           "date": date,
          "time": time,
             "location": loctionDetail,
              "location_range": locationRange,
               "details": detailsController.text
               };
    
      final response = await apiObj.postData(ApiConstants.createNewHitMeUp, data);
      _createHitMeUpLoading = false;
      notifyListeners();
      return response;
    } on Exception catch (e) {
      _createHitMeUpLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }



}