import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text("Restaurant Screen"),
      ),
    );
  }
}
