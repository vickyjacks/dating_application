
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonLoader {
  static loader() {
    return const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(218, 74, 64, 1),
          strokeWidth: 5,
        ));
  }

  static animLoader() {
    return  Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 35,
        ));
  }


}
