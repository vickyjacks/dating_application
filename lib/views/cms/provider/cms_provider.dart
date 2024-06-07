
import 'package:datingapp/const/end_point.dart';
import 'package:datingapp/services/api_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/fetch_about_us_model.dart';
import '../model/fetch_help_center_model.dart';
import '../model/fetch_privacy_policy_model.dart';
import '../model/fetch_safety_model.dart';
import '../model/fetch_terms_and_condition_model.dart';

class CMSProvider with ChangeNotifier{
  final apiObj = ApiServices();
  
  
  /// fetch about us api

  bool _aboutUSLoading = false;
  bool get aboutUSLoading => _aboutUSLoading;
  set aboutUSLoading(bool value) {
    _aboutUSLoading = value;
    notifyListeners();
  }
  FetchAboutUsModel  _fetchAboutUsModel = FetchAboutUsModel();
  FetchAboutUsModel get fetchAboutUsModel => _fetchAboutUsModel;
  set fetchAboutUsModel(FetchAboutUsModel value) {
    _fetchAboutUsModel = value;
    notifyListeners();
  }

  Future fetchAboutUsApi()async{
    _aboutUSLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchAbout);
      _fetchAboutUsModel = FetchAboutUsModel.fromMap(response);
      _aboutUSLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _aboutUSLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


  /// fetch safety api

  bool _safetyLoading = false;
  bool get safetyLoading => _safetyLoading;
  set safetyLoading(bool value) {
    _safetyLoading = value;
    notifyListeners();
  }

  FetchSafetyModel  _fetchSafetyModel = FetchSafetyModel();
  FetchSafetyModel get fetchSafetyModel => _fetchSafetyModel;
  set fetchSafetyModel(FetchSafetyModel value) {
    _fetchSafetyModel = value;
    notifyListeners();
  }

  Future fetchSafetyUsApi()async{
    _safetyLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchSafety);
      _fetchSafetyModel = FetchSafetyModel.fromMap(response);
      _safetyLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _safetyLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }



  /// fetch help center api

  bool _helpCenterLoading = false;
  bool get helpCenterLoading => _helpCenterLoading;
  set helpCenterLoading(bool value) {
    _helpCenterLoading = value;
    notifyListeners();
  }

  FetchHelpCenterModel  _fetchHelpCenterModel = FetchHelpCenterModel();

  FetchHelpCenterModel get fetchHelpCenterModel => _fetchHelpCenterModel;

  set fetchHelpCenterModel(FetchHelpCenterModel value) {
    _fetchHelpCenterModel = value;
    notifyListeners();
  }

  Future fetchHelpCenterUsApi()async{
    _helpCenterLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchHelpCenter);
      _fetchHelpCenterModel = FetchHelpCenterModel.fromMap(response);
      _helpCenterLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _helpCenterLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


  /// fetch terms and condition api

  bool _fetchTermConditionLoading = false;
  bool get fetchTermConditionLoading => _fetchTermConditionLoading;
  set fetchTermConditionLoading(bool value) {
    _fetchTermConditionLoading = value;
    notifyListeners();
  }

  FetchTermsCondionsModel  _fetchTermConditionModel = FetchTermsCondionsModel();
  FetchTermsCondionsModel get fetchTermConditionModel => _fetchTermConditionModel;
  set fetchTermConditionModel(FetchTermsCondionsModel value) {
    _fetchTermConditionModel = value;
    notifyListeners();
  }

  Future fetchTermsAndConditionUsApi()async{
    _fetchTermConditionLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchTermsCondition);
      _fetchTermConditionModel = FetchTermsCondionsModel.fromMap(response);
      _fetchTermConditionLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchTermConditionLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  /// fetch privacy policy api

  bool _fetchPrivacyPolicyLoading = false;
  bool get fetchPrivacyPolicyLoading => _fetchPrivacyPolicyLoading;
  set fetchPrivacyPolicyLoading(bool value) {
    _fetchPrivacyPolicyLoading = value;
    notifyListeners();
  }

  FetchPrivacyPolicyModel  _fetchPrivacyPolicyModel = FetchPrivacyPolicyModel();
    FetchPrivacyPolicyModel get fetchPrivacyPolicyModel => _fetchPrivacyPolicyModel;
  set fetchPrivacyPolicyModel(FetchPrivacyPolicyModel value) {
    _fetchPrivacyPolicyModel = value;
    notifyListeners();
  }

  Future fetchPrivacyPolicyApi()async{
    _fetchPrivacyPolicyLoading = true;
    notifyListeners();
    try{
      final response = await apiObj.getData(ApiConstants.fetchPrivacyPolicy);
      _fetchPrivacyPolicyModel = FetchPrivacyPolicyModel.fromMap(response);
      _fetchPrivacyPolicyLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchPrivacyPolicyLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }



}