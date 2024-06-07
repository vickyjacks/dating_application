// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchTermsCondionsModel {
  bool status;
  String message;
  List<FetchTermsCondionsData> data;
  FetchTermsCondionsModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchTermsCondionsModel copyWith({
    bool? status,
    String? message,
    List<FetchTermsCondionsData>? data,
  }) {
    return FetchTermsCondionsModel(
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

  factory FetchTermsCondionsModel.fromMap(Map<String, dynamic> map) {
    return FetchTermsCondionsModel(
      status: map['status'] ?? false, 
      message: map['message'] ?? "",
      data: List<FetchTermsCondionsData>.from((map['data'] ?? const []).map<FetchTermsCondionsData>((x) => FetchTermsCondionsData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchTermsCondionsModel.fromJson(String source) => FetchTermsCondionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchTermsCondionsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchTermsCondionsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchTermsCondionsData {
  String title;
  String description;
  FetchTermsCondionsData({
      this.title="",
      this.description="",
  });

  FetchTermsCondionsData copyWith({
    String? title,
    String? description,
  }) {
    return FetchTermsCondionsData(
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

  factory FetchTermsCondionsData.fromMap(Map<String, dynamic> map) {
    return FetchTermsCondionsData(
      title: map['title'] ??"",
      description: map['description'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchTermsCondionsData.fromJson(String source) => FetchTermsCondionsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchTermsCondionsData(title: $title, description: $description)';

  @override
  bool operator ==(covariant FetchTermsCondionsData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
