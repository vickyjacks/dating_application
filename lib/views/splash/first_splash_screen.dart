import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes/route_name.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});
  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      checkInit();
    });
  }
  checkInit()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');
    debugPrint("User Logged ID >>>>>>>>>>>>>>> :: $userId");
    Timer(const Duration(seconds: 3), () {
      if(userId==null){
        Navigator.pushReplacementNamed(context, RoutesName.secondSplashScreen);
      }else{
        Navigator.pushReplacementNamed(context, RoutesName.appLauncher);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: SvgPicture.asset('assets/svg_img/splash_img.svg'),
        ),
      bottomNavigationBar:   SizedBox(
        height: height * 0.15,
        child: const Center(
          child: Text(
            "Get Started",
            style: TextStyle(color: Colors.white, fontSize: 22,fontFamily: 'Outfit',fontWeight: FontWeight.w600,),
          ),
        ),
      ),
    );
  }
}
