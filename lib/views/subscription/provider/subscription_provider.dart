
import 'package:datingapp/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/end_point.dart';
import '../model/fetch_subscription_plan_model.dart';

class SubscriptionProvider with ChangeNotifier{
final apiObj = ApiServices();

/// subscription plan data api
  bool _fetchSubscriptionLoading = false;
  bool get fetchSubscriptionLoading => _fetchSubscriptionLoading;
  set fetchSubscriptionLoading(bool value) {
    _fetchSubscriptionLoading = value;
    notifyListeners();
  }

FetchSubscriptionPlanDetailModel _fetchSubscriptionPlanDetailModel = FetchSubscriptionPlanDetailModel();
FetchSubscriptionPlanDetailModel get fetchSubscriptionPlanDetailModel => _fetchSubscriptionPlanDetailModel;
  set fetchSubscriptionPlanDetailModel(FetchSubscriptionPlanDetailModel value) {
    _fetchSubscriptionPlanDetailModel = value;
    notifyListeners();
  }

  Future fetchSubscriptionPlanDetailsApi()async{
    _fetchSubscriptionLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId.toString()};
      final response = await apiObj.postData(ApiConstants.fetchSubscriptionPlan, data);
      _fetchSubscriptionPlanDetailModel = FetchSubscriptionPlanDetailModel.fromMap(response);
      _fetchSubscriptionLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchSubscriptionLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  
  /// buy subscription api 

int subscriptionId=0;
saveSubscriptionID(int value){
  subscriptionId = value;
  notifyListeners();
}

 bool _buySubscriptionLoading = false;
bool get buySubscriptionLoading => _buySubscriptionLoading;

  set buySubscriptionLoading(bool value) {
    _buySubscriptionLoading = value;
    notifyListeners();
  }
  
  Future buySubscriptionApi()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _buySubscriptionLoading = true;
    try{
      String? userId = pref.getString('userId');
      final data = {
        "user_id": userId,
        "subscription_id": subscriptionId,
        "merchantTransactionId": ""};

      final response = await apiObj.postData(ApiConstants.buySubscription, data);
      if(response["status"]==true){
        
      }
    }on Exception catch(e){
      _buySubscriptionLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }
  
}