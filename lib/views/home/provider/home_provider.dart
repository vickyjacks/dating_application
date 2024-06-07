import 'package:datingapp/common/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HomeProvider with ChangeNotifier{

  int _pageIndex=0;

  int get pageIndex =>_pageIndex;

  set pageIndex(int newIndex){
    _pageIndex= newIndex;
    notifyListeners();
  }

  DateTime? _currentBackPressTime;

  Future<bool> onWillPop(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 3)) {
      _currentBackPressTime = now;
      CommonToast.toastSuccessMessage("Press again to exit");
      return false;
    }
    return true;
  }


  DateTime lastBackPressed = DateTime.now();
  bool exitPop = false;
  canPopScreen() {
    if (DateTime.now().difference(lastBackPressed) >
        const Duration(milliseconds: 1200)) {
      lastBackPressed = DateTime.now();
      CommonToast.toastSuccessMessage('Press back again to exit');
        exitPop = false;
        notifyListeners();
    } else {
        exitPop = true;
        notifyListeners();
      if (exitPop) {
        SystemNavigator.pop();
      }
    }
  }

}