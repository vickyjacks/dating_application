// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchReciverUserProfileDetailsModel {
  bool status;
  String message;
  FetchUserProfileDetailData? data;
  FetchReciverUserProfileDetailsModel({
      this.status=false,
      this.message="",
    this.data,
  });

  FetchReciverUserProfileDetailsModel copyWith({
    bool? status,
    String? message,
    FetchUserProfileDetailData? data,
  }) {
    return FetchReciverUserProfileDetailsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory FetchReciverUserProfileDetailsModel.fromMap(Map<String, dynamic> map) {
    return FetchReciverUserProfileDetailsModel(
      status: map['status']??false,
      message: map['message'] ??"",
      data: map['data'] != null ? FetchUserProfileDetailData.fromMap(map['data'] as Map<String,dynamic>) : FetchUserProfileDetailData(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchReciverUserProfileDetailsModel.fromJson(String source) => FetchReciverUserProfileDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchReciverUserProfileDetailsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchReciverUserProfileDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchUserProfileDetailData {
  String name;
  String profilePic;
  String gender;
  String about;
  String dob;
  String age;
  List<UserImage> userImage;
  List<UserInterest> userInterest;
  FetchUserProfileDetailData({
      this.name="",
      this.profilePic="",
      this.gender="",
      this.about="",
      this.dob="",
      this.age="",
      this.userImage=const [],
      this.userInterest= const [],
  });

  FetchUserProfileDetailData copyWith({
    String? name,
    String? profilePic,
    String? gender,
    String? about,
    String? dob,
    String? age,
    List<UserImage>? userImage,
    List<UserInterest>? userInterest,
  }) {
    return FetchUserProfileDetailData(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      gender: gender ?? this.gender,
      about: about ?? this.about,
      dob: dob ?? this.dob,
      age: age ?? this.age,
      userImage: userImage ?? this.userImage,
      userInterest: userInterest ?? this.userInterest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'gender': gender,
      'about': about,
      'dob': dob,
      'age': age,
      'userImage': userImage.map((x) => x.toMap()).toList(),
      'userInterest': userInterest.map((x) => x.toMap()).toList(),
    };
  }

  factory FetchUserProfileDetailData.fromMap(Map<String, dynamic> map) {
    return FetchUserProfileDetailData(
      name: map['name'] ??"",
      profilePic: map['profile_pic'] ??"",
      gender: map['gender'] ??"",
      about: map['about'] ??"",
      dob: map['dob'] ??"",
      age: map['age'] ??"",
      userImage: List<UserImage>.from((map['user_image'] ?? const []).map<UserImage>((x) => UserImage.fromMap(x as Map<String,dynamic>),),),
      userInterest: List<UserInterest>.from((map['user_interest'] ?? const []).map<UserInterest>((x) => UserInterest.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchUserProfileDetailData.fromJson(String source) => FetchUserProfileDetailData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchUserProfileDetailData(name: $name, profilePic: $profilePic, gender: $gender, about: $about, dob: $dob, age: $age, userImage: $userImage, userInterest: $userInterest)';
  }

  @override
  bool operator ==(covariant FetchUserProfileDetailData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePic == profilePic &&
      other.gender == gender &&
      other.about == about &&
      other.dob == dob &&
      other.age == age &&
      listEquals(other.userImage, userImage) &&
      listEquals(other.userInterest, userInterest);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePic.hashCode ^
      gender.hashCode ^
      about.hashCode ^
      dob.hashCode ^
      age.hashCode ^
      userImage.hashCode ^
      userInterest.hashCode;
  }
}

class UserImage {
  String image;
  UserImage({
     this.image="",
  });

  UserImage copyWith({
    String? image,
  }) {
    return UserImage(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory UserImage.fromMap(Map<String, dynamic> map) {
    return UserImage(
      image: map['image'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserImage.fromJson(String source) => UserImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserImage(image: $image)';

  @override
  bool operator ==(covariant UserImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}

class UserInterest {
  String interest;
  UserInterest({
      this.interest="",
  });

  UserInterest copyWith({
    String? interest,
  }) {
    return UserInterest(
      interest: interest ?? this.interest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interest': interest,
    };
  }

  factory UserInterest.fromMap(Map<String, dynamic> map) {
    return UserInterest(
      interest: map['interest'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInterest.fromJson(String source) => UserInterest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserInterest(interest: $interest)';

  @override
  bool operator ==(covariant UserInterest other) {
    if (identical(this, other)) return true;
  
    return 
      other.interest == interest;
  }

  @override
  int get hashCode => interest.hashCode;
}
