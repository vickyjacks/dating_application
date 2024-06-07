import 'package:datingapp/config/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../common/button.dart';
import '../../const/color.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.10,
              child: const Center(
                child: Text(
                  "Online Dating App",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: AppColor.appTextColored,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
              // color: Colors.grey,
              child: const Center(
                child: Text(
                  "Find Your \nBest Match",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: AppColor.appTextColorWhite,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.50,
              child: Image.asset('assets/svg_img/splash_img2.png'),
            ),
            SizedBox(
              height: height * 0.20,
              // color: Colors.red,
              child: Center(
                  child:CustomButtons(
                    onPressed: ()async{
                      Navigator.pushNamed(context, RoutesName.signInHomeScreen);
                    }, title: 'Start Dating', height: 50.0, width: 212.0,)
              ),
            ),

          ],
        ));
  }
}
