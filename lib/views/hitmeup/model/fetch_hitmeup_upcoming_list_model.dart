// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchHitMeUpUpcomingListModel {
  bool status;
  String message;
  List<FetchHitMeUpUpcomingData> data;
  FetchHitMeUpUpcomingListModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchHitMeUpUpcomingListModel copyWith({
    bool? status,
    String? message,
    List<FetchHitMeUpUpcomingData>? data,
  }) {
    return FetchHitMeUpUpcomingListModel(
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

  factory FetchHitMeUpUpcomingListModel.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpUpcomingListModel(
      status: map['status'] ?? false,
      message: map['message'] ??"",
      data: List<FetchHitMeUpUpcomingData>.from((map['data'] ?? const []).map<FetchHitMeUpUpcomingData>((x) => FetchHitMeUpUpcomingData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpUpcomingListModel.fromJson(String source) => FetchHitMeUpUpcomingListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHitMeUpUpcomingListModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchHitMeUpUpcomingListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;  
}

class FetchHitMeUpUpcomingData {
  String userId;
  String title;
  String categoryName;
  String name;
  String profilePic;
  String date;
  String time;
  String location;
  String createDate;
  FetchHitMeUpUpcomingData({
      this.userId="",
      this.title="",
      this.categoryName="",
      this.name="",
      this.profilePic="",
      this.date="",
      this.time="",
      this.location="",
      this.createDate="",
  });

  FetchHitMeUpUpcomingData copyWith({
    String? userId,
    String? title,
    String? categoryName,
    String? name,
    String? profilePic,
    String? date,
    String? time,
    String? location,
    String? createDate,
  }) {
    return FetchHitMeUpUpcomingData(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      categoryName: categoryName ?? this.categoryName,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'categoryName': categoryName,
      'name': name,
      'profilePic': profilePic,
      'date': date,
      'time': time,
      'location': location,
      'createDate': createDate,
    };
  }

  factory FetchHitMeUpUpcomingData.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpUpcomingData(
      userId: map['user_id']??"",
      title: map['title'] ??"",
      categoryName: map['category_name'] ??"",
      name: map['name'] ??"",
      profilePic: map['profile_pic'] ??"",
      date: map['date']??"",
      time: map['time'] ??"",
      location: map['location']??"",
      createDate: map['create_date'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpUpcomingData.fromJson(String source) => FetchHitMeUpUpcomingData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchHitMeUpUpcomingData(userId: $userId, title: $title, categoryName: $categoryName, name: $name, profilePic: $profilePic, date: $date, time: $time, location: $location, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant FetchHitMeUpUpcomingData other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.title == title &&
      other.categoryName == categoryName &&
      other.name == name &&
      other.profilePic == profilePic &&
      other.date == date &&
      other.time == time &&
      other.location == location &&
      other.createDate == createDate;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      title.hashCode ^
      categoryName.hashCode ^
      name.hashCode ^
      profilePic.hashCode ^
      date.hashCode ^
      time.hashCode ^
      location.hashCode ^
      createDate.hashCode;
  }
}
