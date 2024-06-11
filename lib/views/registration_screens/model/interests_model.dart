import 'package:flutter/cupertino.dart';

class InterestScreenModel {
  late String titles;
  late IconData icons;

  InterestScreenModel({required this.titles, required this.icons});

  InterestScreenModel.fromJson(Map<String, dynamic> json) {
    titles = json['titles'];
    icons = json['icons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['titles'] = this.titles;
    data['icons'] = this.icons;
    return data;
  }
}
