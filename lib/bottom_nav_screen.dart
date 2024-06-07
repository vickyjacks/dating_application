
import 'package:datingapp/views/events/event_screen.dart';
import 'package:datingapp/views/hitmeup/screen/hitmeup_screen.dart';
import 'package:datingapp/views/home/provider/home_provider.dart';
import 'package:datingapp/views/home/screen/home_screen.dart';
import 'package:datingapp/views/matchings/screen/matched_screen.dart';
import 'package:datingapp/views/restaurant/restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/navbar/bottom/bottom_navbar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}
class MainScreenState extends State<MainScreen> {
  List pageList=  [
    const HomeScreen(),
    const MatchesScreen(),
    const HitMeUpScreen(),
    const RestaurantScreen(),
    const EventScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context,mainScreenNotifier,child){
      return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop){
        mainScreenNotifier.canPopScreen();
      },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar:const BottomNavbar(),
        ),
      );
    });
  }

}
