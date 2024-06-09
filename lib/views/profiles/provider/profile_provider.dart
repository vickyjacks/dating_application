import 'package:datingapp/const/end_point.dart';
import 'package:datingapp/views/profiles/model/fetch_user_profile_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/api_service.dart';
import '../model/fetch_user_details_model.dart';

class ProfileProvider with ChangeNotifier{
  final apiObj = ApiServices();

  /// get user profile pictures

  bool _fetchUserProfileLoading = false;
  bool get fetchUserProfileLoading => _fetchUserProfileLoading;
  set fetchUserProfileLoading(bool value) {
    _fetchUserProfileLoading = value;
    notifyListeners();
  }

  FetchUserProfileDetailsModel _fetchUserProfileDetailsModel = FetchUserProfileDetailsModel();
  FetchUserProfileDetailsModel get fetchUserProfileDetailsModel => _fetchUserProfileDetailsModel;
  set fetchUserProfileDetailsModel(FetchUserProfileDetailsModel value) {
    _fetchUserProfileDetailsModel = value;
    notifyListeners();
  }

  Future fetchUserProfileDetailsApi()async{
    _fetchUserProfileLoading = true;
    notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId.toString()};
      final response = await apiObj.postData(ApiConstants.fetchUserProfileData, data);
      _fetchUserProfileDetailsModel = FetchUserProfileDetailsModel.fromMap(response);
      updateAboutController.text =  _fetchUserProfileDetailsModel.data!.about; 
      _fetchUserProfileLoading = false;
      notifyListeners();
    }on Exception catch(e){
      _fetchUserProfileLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


  /// update profile data
  final TextEditingController updateAboutController = TextEditingController();

  bool _updateProfileLoading = false;
  bool get updateProfileLoading => _updateProfileLoading;
  set updateProfileLoading(bool value) {
    _updateProfileLoading = value;
    notifyListeners();
  }

  Future updateProfileApi(relationShip)async{
    _updateProfileLoading = true;
      notifyListeners();
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {
        "user_id": userId,
        "about": updateAboutController.text,
        "relationship": relationShip
      };
      final response = await apiObj.postData(ApiConstants.editProfile, data);
      if(response["status"]==true){
        fetchUserProfileDetailsApi();
      }
      _updateProfileLoading = false;
      notifyListeners();
      return response;
    }on Exception catch(e){
      _updateProfileLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }


  /// fetch hit me up upcoming api
  bool _fetchUserProfileDetailLoading = false;
  bool get fetchUserProfileDetailLoading => _fetchUserProfileDetailLoading;
  set fetchUserProfileDetailLoading(bool value) {
    _fetchUserProfileDetailLoading = value;
    notifyListeners();
  }

  FetchReciverUserProfileDetailsModel _userProfileDetailsModel =
      FetchReciverUserProfileDetailsModel();
  FetchReciverUserProfileDetailsModel get userProfileDetailsModel =>
      _userProfileDetailsModel;
  set userProfileDetailsModel(FetchReciverUserProfileDetailsModel value) {
    _userProfileDetailsModel = value;
    notifyListeners();
  }

  Future fetchUserProfileDetailApi() async {
    _fetchUserProfileDetailLoading = true;
    notifyListeners();
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      final data = {"user_id": userId};
      final response =
          await apiObj.postData(ApiConstants.fetchUserProfile, data);
      _userProfileDetailsModel =
          FetchReciverUserProfileDetailsModel.fromMap(response);
      _fetchUserProfileDetailLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      _fetchUserProfileDetailLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  } 

}