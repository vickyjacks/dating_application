import 'package:flutter/material.dart';

import 'loader.dart';

// ignore: must_be_immutable
class CustomButtons extends StatelessWidget {
  final Function() onPressed;
  String title;
  double height;
  double width;
  CustomButtons(
      {super.key, required this.onPressed,
        required this.title,
        required this.height,
        required this.width,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(161, 55, 139, 1),
            Color.fromRGBO(218, 74, 64, 1),
            Color.fromRGBO(229, 67, 97, 1),
          ]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell( borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Outfit",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Function() onPressed;
  final bool loading;
  const CircleButton({super.key,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(218, 74, 64, 1),
          strokeWidth: 5,
        ))
        : Container(
      height: 65.0,
      width: 65,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(161, 55, 139, 1),
            Color.fromRGBO(218, 74, 64, 1),
            Color.fromRGBO(229, 67, 97, 1),
          ]),
          borderRadius: BorderRadius.circular(40)),
      child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onPressed,
          child: const Icon(Icons.arrow_forward_ios)),
    );
  }
}

class AppBarContentIconwithSkipText extends StatelessWidget {
  const AppBarContentIconwithSkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
      child: Row(
        children: [
          Ink(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.white30,
                    width: 1,
                  )),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Color.fromRGBO(233, 64, 87, 1),
              iconSize: 15,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Spacer(),
          const Text(
            "",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(233, 64, 87, 1),
            ),
          ),
        ],
      ),
    );
  }
}
