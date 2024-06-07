// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchHitMeUpExploretListModel {
  bool status;
  String message;
  List<FetchHitMeUpExploretData> data;
  FetchHitMeUpExploretListModel({
      this.status=false,
      this.message="",
      this.data= const [],
  });

  FetchHitMeUpExploretListModel copyWith({
    bool? status,
    String? message,
    List<FetchHitMeUpExploretData>? data,
  }) {
    return FetchHitMeUpExploretListModel(
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

  factory FetchHitMeUpExploretListModel.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpExploretListModel(
      status: map['status'] ??false,
      message: map['message'] ??"", 
      data: List<FetchHitMeUpExploretData>.from((map['data'] ?? const []).map<FetchHitMeUpExploretData>((x) => FetchHitMeUpExploretData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpExploretListModel.fromJson(String source) => FetchHitMeUpExploretListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHitMeUpExploretListModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchHitMeUpExploretListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchHitMeUpExploretData {
  int id;
  String userId;
  String userName;
  String userImage;
  String categoryId;
  String categoryName;
  String title;
  String date;
  String time;
  String location;
  String details;
  String createdAt;
  double distance;
  String createDate;
  FetchHitMeUpExploretData({
      this.id=0,
      this.userId="",
      this.userName="",
      this.userImage="",
      this.categoryId="",
      this.categoryName="",
      this.title="",
      this.date="",
      this.time="",
      this.location="",
      this.details="",
      this.createdAt="",
      this.distance=0.0,
      this.createDate="",
  });

  FetchHitMeUpExploretData copyWith({
    int? id,
    String? userId,
    String? userName,
    String? userImage,
    String? categoryId,
    String? categoryName,
    String? title,
    String? date,
    String? time,
    String? location,
    String? details,
    String? createdAt,
    double? distance,
    String? createDate,
  }) {
    return FetchHitMeUpExploretData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
      distance: distance ?? this.distance,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'title': title,
      'date': date,
      'time': time,
      'location': location,
      'details': details,
      'createdAt': createdAt,
      'distance': distance,
      'createDate': createDate,
    };
  }

  factory FetchHitMeUpExploretData.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpExploretData(
      id: map['id'] ??0,
      userId: map['user_id'] ??"",
      userName: map['user_name'] ??"",
      userImage: map['user_image'] ??"",
      categoryId: map['category_id'] ??"",
      categoryName: map['category_name'] ??"",
      title: map['title'] ??"",
      date: map['date'] ??"",
      time: map['time'] ??"",
      location: map['location']??"",
      details: map['details'] ??"",
      createdAt: map['created_at'] ??"",
      distance: map['distance'] ??0.0,
      createDate: map['create_date'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpExploretData.fromJson(String source) => FetchHitMeUpExploretData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchHitMeUpExploretData(id: $id, userId: $userId, userName: $userName, userImage: $userImage, categoryId: $categoryId, categoryName: $categoryName, title: $title, date: $date, time: $time, location: $location, details: $details, createdAt: $createdAt, distance: $distance, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant FetchHitMeUpExploretData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.userName == userName &&
      other.userImage == userImage &&
      other.categoryId == categoryId &&
      other.categoryName == categoryName &&
      other.title == title &&
      other.date == date &&
      other.time == time &&
      other.location == location &&
      other.details == details &&
      other.createdAt == createdAt &&
      other.distance == distance &&
      other.createDate == createDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      userName.hashCode ^
      userImage.hashCode ^
      categoryId.hashCode ^
      categoryName.hashCode ^
      title.hashCode ^
      date.hashCode ^
      time.hashCode ^
      location.hashCode ^
      details.hashCode ^
      createdAt.hashCode ^
      distance.hashCode ^
      createDate.hashCode;
  }
}
