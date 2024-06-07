// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchHitMeUpRequestListModel {
  bool status;
  String message;
  List<HitMeUpRequestData> data;
  FetchHitMeUpRequestListModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchHitMeUpRequestListModel copyWith({
    bool? status,  
    String? message,
    List<HitMeUpRequestData>? data,
  }) {
    return FetchHitMeUpRequestListModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() { 
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory FetchHitMeUpRequestListModel.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpRequestListModel(
      status: map['status'] ??false,
      message: map['message']??"",
      data: List<HitMeUpRequestData>.from((map['data'] ?? const []).map<HitMeUpRequestData>((x) => HitMeUpRequestData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap()); 

  factory FetchHitMeUpRequestListModel.fromJson(String source) => FetchHitMeUpRequestListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HitMeUpRequestListModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchHitMeUpRequestListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class HitMeUpRequestData {
  String title;
  String categoryName;
  String senderId;
  String name;
  String profilePic;
  String location;
  String date;
  String time;
  String createDate;
  HitMeUpRequestData({
      this.title="",
      this.categoryName="",
      this.senderId="",
      this.name="",
      this.profilePic="",
      this.location="",
      this.date="",
      this.time="",
      this.createDate="",
  });

  HitMeUpRequestData copyWith({
    String? title,
    String? categoryName,
    String? senderId,
    String? name,
    String? profilePic,
    String? location,
    String? date,
    String? time,
    String? createDate,
  }) {
    return HitMeUpRequestData(
      title: title ?? this.title,
      categoryName: categoryName ?? this.categoryName,
      senderId: senderId ?? this.senderId,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      location: location ?? this.location,
      date: date ?? this.date,
      time: time ?? this.time,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categoryName': categoryName,
      'senderId': senderId,
      'name': name,
      'profilePic': profilePic,
      'location': location,
      'date': date,
      'time': time,
      'createDate': createDate,
    };
  }

  factory HitMeUpRequestData.fromMap(Map<String, dynamic> map) {
    return HitMeUpRequestData(
      title: map['title'] ??"",
      categoryName: map['category_name']??"",
      senderId: map['sender_id'] ??"",
      name: map['name'] ??"",
      profilePic: map['profile_pic']??"",
      location: map['location'] ??"",
      date: map['date'] ??"",
      time: map['time'] ??"",
      createDate: map['create_date'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory HitMeUpRequestData.fromJson(String source) => HitMeUpRequestData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HitMeUpRequestData(title: $title, categoryName: $categoryName, senderId: $senderId, name: $name, profilePic: $profilePic, location: $location, date: $date, time: $time, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant HitMeUpRequestData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.categoryName == categoryName &&
      other.senderId == senderId &&
      other.name == name &&
      other.profilePic == profilePic &&
      other.location == location &&
      other.date == date &&
      other.time == time &&
      other.createDate == createDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      categoryName.hashCode ^
      senderId.hashCode ^
      name.hashCode ^
      profilePic.hashCode ^
      location.hashCode ^
      date.hashCode ^
      time.hashCode ^
      createDate.hashCode;
  }
}
