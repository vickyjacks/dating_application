import 'package:datingapp/views/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_widget.dart';
class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(161, 55, 139, 1),
              Color.fromRGBO(218, 74, 64, 1),
              Color.fromRGBO(229, 67, 97, 1),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomWidget(
                  // size:provider.pageIndex==0 ? 45:30,
                  onTap: () {
                    provider.pageIndex = 0;
                  },
                  img: provider.pageIndex == 0
                      ? "assets/bottom_navbar_icons/home_svg.svg"
                      : "assets/bottom_navbar_icons/home_svg.svg",
                  img2: provider.pageIndex == 0
                      ? 'assets/bottom_navbar_icons/white_dot_svg.svg'
                      : "assets/bottom_navbar_icons/red_dot_svg.svg",
                ),
                BottomWidget(
                  //  size:provider.pageIndex==1 ? 45:30,
                  onTap: () {
                    provider.pageIndex = 1;
                  },
                  img: provider.pageIndex == 1
                      ? "assets/bottom_navbar_icons/like_svg.svg"
                      : "assets/bottom_navbar_icons/like_svg.svg",
                  img2: provider.pageIndex == 1
                      ? 'assets/bottom_navbar_icons/white_dot_svg.svg'
                      : "assets/bottom_navbar_icons/red_dot_svg.svg",
                ),
                BottomWidget(
                  // size:provider.pageIndex==2 ? 45:30,
                  onTap: () {
                    provider.pageIndex = 2;
                  },
                  img: provider.pageIndex == 2
                      ? "assets/bottom_navbar_icons/hitme_svg.svg"
                      : "assets/bottom_navbar_icons/hitme_svg.svg",
                  img2: provider.pageIndex == 2
                      ? 'assets/bottom_navbar_icons/white_dot_svg.svg'
                      : "assets/bottom_navbar_icons/red_dot_svg.svg",
                ),
                BottomWidget(
                  //  size:provider.pageIndex==3 ? 45:30,
                  onTap: () {
                    provider.pageIndex = 3;
                  },
                  img: provider.pageIndex == 3
                      ? "assets/bottom_navbar_icons/resto_svg.svg"
                      : "assets/bottom_navbar_icons/resto_svg.svg",
                  img2: provider.pageIndex == 3
                      ? 'assets/bottom_navbar_icons/white_dot_svg.svg'
                      : "assets/bottom_navbar_icons/red_dot_svg.svg",
                ),
                BottomWidget(
                  // size:provider.pageIndex==2 ? 45:30,
                  onTap: () {
                    provider.pageIndex = 4;
                  },
                  img: provider.pageIndex == 4
                      ? "assets/bottom_navbar_icons/events_svg.svg"
                      : "assets/bottom_navbar_icons/events_svg.svg",
                  img2: provider.pageIndex == 4
                      ? 'assets/bottom_navbar_icons/white_dot_svg.svg'
                      : "assets/bottom_navbar_icons/red_dot_svg.svg",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
