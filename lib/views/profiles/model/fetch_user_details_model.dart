// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchUserProfileDetailsModel {
  bool status;
  String message;
  FetchUserProfileDetailData? data;
  FetchUserProfileDetailsModel({
      this.status=false,
      this.message="",
    this.data,
  });

  FetchUserProfileDetailsModel copyWith({
    bool? status,
    String? message,
    FetchUserProfileDetailData? data,
  }) {
    return FetchUserProfileDetailsModel(
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

  factory FetchUserProfileDetailsModel.fromMap(Map<String, dynamic> map) {
    return FetchUserProfileDetailsModel(
      status: map['status'] ?? false,
      message: map['message'] ??"",
      data: map['data'] != null ? FetchUserProfileDetailData.fromMap(map['data'] as Map<String,dynamic>) : FetchUserProfileDetailData(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchUserProfileDetailsModel.fromJson(String source) => FetchUserProfileDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchUserProfileDetailsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchUserProfileDetailsModel other) {
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
  String email;
  String phone;
  String about;
  String relationship;
  List<Interest> interest;
  List<Images> image;
  FetchUserProfileDetailData({
     this.name="",
     this.profilePic="",
     this.email="",
     this.phone="",
     this.about="",
     this.relationship="",
      this.interest=const [],
      this.image= const [],
  });

  FetchUserProfileDetailData copyWith({
    String? name,
    String? profilePic,
    String? email,
    String? phone,
    String? about,
    String? relationship,
    List<Interest>? interest,
    List<Images>? image,
  }) {
    return FetchUserProfileDetailData(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      about: about ?? this.about,
      relationship: relationship ?? this.relationship,
      interest: interest ?? this.interest,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'email': email,
      'phone': phone,
      'about': about,
      'relationship': relationship,
      'interest': interest.map((x) => x.toMap()).toList(),
      'image': image.map((x) => x.toMap()).toList(),
    };
  }
  factory FetchUserProfileDetailData.fromMap(Map<String, dynamic> map) {
    return FetchUserProfileDetailData(
      name: map['name'] ??"",
      profilePic: map['profile_pic']??"",
      email: map['email'] ??"",
      phone: map['phone']??"",
      about: map['about'] ??"",
      relationship: map['relationship'] ??"",
      interest: List<Interest>.from((map['interest'] ??const []).map<Interest>((x) => Interest.fromMap(x as Map<String,dynamic>),),),
      image: List<Images>.from((map['image'] ?? const []).map<Images>((x) => Images.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchUserProfileDetailData.fromJson(String source) => FetchUserProfileDetailData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchUserProfileDetailData(name: $name, profilePic: $profilePic, email: $email, phone: $phone, about: $about, relationship: $relationship, interest: $interest, image: $image)';
  }

  @override
  bool operator ==(covariant FetchUserProfileDetailData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePic == profilePic &&
      other.email == email &&
      other.phone == phone &&
      other.about == about &&
      other.relationship == relationship &&
      listEquals(other.interest, interest) &&
      listEquals(other.image, image);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePic.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      about.hashCode ^
      relationship.hashCode ^
      interest.hashCode ^
      image.hashCode;
  }
}
 
class Interest {
  String interests;
  Interest({
     this.interests="",
  });

  Interest copyWith({
    String? interests,
  }) {
    return Interest(
      interests: interests ?? this.interests,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interests': interests,
    };
  }

  factory Interest.fromMap(Map<String, dynamic> map) {
    return Interest(
      interests: map['interests']??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Interest.fromJson(String source) => Interest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Interest(interests: $interests)';

  @override
  bool operator ==(covariant Interest other) {
    if (identical(this, other)) return true;
  
    return 
      other.interests == interests;
  }

  @override
  int get hashCode => interests.hashCode;
}

class Images {
  String images;
  Images({
      this.images="",
  });

  Images copyWith({
    String? images,
  }) {
    return Images(
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'images': images,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      images: map['images']??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Image(images: $images)';

  @override
  bool operator ==(covariant Images other) {
    if (identical(this, other)) return true;
  
    return 
      other.images == images;
  }

  @override
  int get hashCode => images.hashCode;
}
