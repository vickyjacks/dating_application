import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomWidget extends StatelessWidget {
  final void Function()? onTap;
  final String img;
  final String img2;

  BottomWidget({this.onTap, required this.img,required this.img2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : onTap,
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0, right: 0,top: 10,bottom: 10),
              height: 50,
              width: 35,
              child:SvgPicture.asset(img.toString()),
            ),
            SvgPicture.asset(img2.toString()),
          ],
        ),
      ),
    );
  }
}
