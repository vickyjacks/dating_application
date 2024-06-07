// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchSwipeMatchedUserListModel {
  bool status;
  String message;
  List<FetchSwipeMatchedUserListData> data;
  FetchSwipeMatchedUserListModel({
      this.status=false,
      this.message="",
      this.data= const [],
  });

  FetchSwipeMatchedUserListModel copyWith({
    bool? status,
    String? message,
    List<FetchSwipeMatchedUserListData>? data,
  }) {
    return FetchSwipeMatchedUserListModel(
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

  factory FetchSwipeMatchedUserListModel.fromMap(Map<String, dynamic> map) {
    return FetchSwipeMatchedUserListModel(
      status: map['status'] ?? false,
      message: map['message'] ??"", 
      data: List<FetchSwipeMatchedUserListData>.from((map['data'] ?? const []).map<FetchSwipeMatchedUserListData>((x) => FetchSwipeMatchedUserListData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchSwipeMatchedUserListModel.fromJson(String source) => FetchSwipeMatchedUserListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchSwipeMatchedUserListModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchSwipeMatchedUserListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchSwipeMatchedUserListData {
  String getUserId;
  String name;
  String image;
  String roomId;
  String age;
  FetchSwipeMatchedUserListData({
      this.getUserId="",
      this.name="",
      this.image="",
      this.roomId="",
      this.age="",
  });

  FetchSwipeMatchedUserListData copyWith({
    String? getUserId,
    String? name,
    String? image,
    String? roomId,
    String? age,
  }) {
    return FetchSwipeMatchedUserListData(
      getUserId: getUserId ?? this.getUserId,
      name: name ?? this.name,
      image: image ?? this.image,
      roomId: roomId ?? this.roomId,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'getUserId': getUserId,
      'name': name,
      'image': image,
      'roomId': roomId,
      'age': age,
    };
  }

  factory FetchSwipeMatchedUserListData.fromMap(Map<String, dynamic> map) {
    return FetchSwipeMatchedUserListData(
      getUserId: map['getUserId']??"",
      name: map['name'] ??"",
      image: map['image'] ??"",
      roomId: map['roomId'] ??"",
      age: map['age'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchSwipeMatchedUserListData.fromJson(String source) => FetchSwipeMatchedUserListData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchSwipeMatchedUserListData(getUserId: $getUserId, name: $name, image: $image, roomId: $roomId, age: $age)';
  }

  @override
  bool operator ==(covariant FetchSwipeMatchedUserListData other) {
    if (identical(this, other)) return true;
  
    return 
      other.getUserId == getUserId &&
      other.name == name &&
      other.image == image &&
      other.roomId == roomId &&
      other.age == age;
  }

  @override
  int get hashCode {
    return getUserId.hashCode ^
      name.hashCode ^
      image.hashCode ^
      roomId.hashCode ^
      age.hashCode;
  }
}
