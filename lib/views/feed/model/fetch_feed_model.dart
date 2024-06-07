// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchFeedDetailModel {
  bool status;
  String message;
  List<FetchFeedDetailData> data;
  FetchFeedDetailModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchFeedDetailModel copyWith({
    bool? status,
    String? message,
    List<FetchFeedDetailData>? data,
  }) {
    return FetchFeedDetailModel(
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

  factory FetchFeedDetailModel.fromMap(Map<String, dynamic> map) {
    return FetchFeedDetailModel(
      status: map['status'] ??false,
      message: map['message'] ??"",
      data: List<FetchFeedDetailData>.from((map['data'] ?? const []).map<FetchFeedDetailData>((x) => FetchFeedDetailData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchFeedDetailModel.fromJson(String source) => FetchFeedDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchFeedDetailModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchFeedDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchFeedDetailData {
  String name;
  String profilePic;
  int postId;
  String image;
  String date;
  String description;
  FetchFeedDetailData({
     this.name="",
     this.profilePic="",
     this.postId=0,
     this.image="",
     this.date="",
     this.description="",
  });

  FetchFeedDetailData copyWith({
    String? name,
    String? profilePic,
    int? postId,
    String? image,
    String? date,
    String? description,
  }) {
    return FetchFeedDetailData(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      postId: postId ?? this.postId,
      image: image ?? this.image,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'postId': postId,
      'image': image,
      'date': date,
      'description': description,
    };
  }

  factory FetchFeedDetailData.fromMap(Map<String, dynamic> map) {
    return FetchFeedDetailData(
      name: map['name']??"",
      profilePic: map['profile_pic']??"",
      postId: map['postId'] ??0,
      image: map['image'] ??"",
      date: map['date'] ??"",
      description: map['description'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchFeedDetailData.fromJson(String source) => FetchFeedDetailData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchFeedDetailData(name: $name, profilePic: $profilePic, postId: $postId, image: $image, date: $date, description: $description)';
  }

  @override
  bool operator ==(covariant FetchFeedDetailData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePic == profilePic &&
      other.postId == postId &&
      other.image == image &&
      other.date == date &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePic.hashCode ^
      postId.hashCode ^
      image.hashCode ^
      date.hashCode ^
      description.hashCode;
  }
}
