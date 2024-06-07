// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchPrivacyPolicyModel {
  bool status;
  String message;
  List<FetchPrivacyPolicyData> data;
  FetchPrivacyPolicyModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchPrivacyPolicyModel copyWith({
    bool? status,
    String? message,
    List<FetchPrivacyPolicyData>? data,
  }) {
    return FetchPrivacyPolicyModel(
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

  factory FetchPrivacyPolicyModel.fromMap(Map<String, dynamic> map) {
    return FetchPrivacyPolicyModel(
      status: map['status'] ??false,
      message: map['message'] ??"",
      data: List<FetchPrivacyPolicyData>.from((map['data']?? const []).map<FetchPrivacyPolicyData>((x) => FetchPrivacyPolicyData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchPrivacyPolicyModel.fromJson(String source) => FetchPrivacyPolicyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchPrivacyPolicyModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchPrivacyPolicyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchPrivacyPolicyData {
  String title;
  String description;
  FetchPrivacyPolicyData({
      this.title="",
      this.description="",
  });

  FetchPrivacyPolicyData copyWith({
    String? title,
    String? description,
  }) {
    return FetchPrivacyPolicyData(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory FetchPrivacyPolicyData.fromMap(Map<String, dynamic> map) {
    return FetchPrivacyPolicyData(
      title: map['title'] ??"",
      description: map['description'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchPrivacyPolicyData.fromJson(String source) => FetchPrivacyPolicyData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchPrivacyPolicyData(title: $title, description: $description)';

  @override
  bool operator ==(covariant FetchPrivacyPolicyData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
