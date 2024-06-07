// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchAboutUsModel {
  bool status;
  String message;
  List<FetchAboutUsData> data;
  FetchAboutUsModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchAboutUsModel copyWith({
    bool? status,
    String? message,
    List<FetchAboutUsData>? data,
  }) {
    return FetchAboutUsModel(
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

  factory FetchAboutUsModel.fromMap(Map<String, dynamic> map) {
    return FetchAboutUsModel(
      status: map['status'] ?? false,
      message: map['message'] ??"",
      data: List<FetchAboutUsData>.from((map['data'] ?? const []).map<FetchAboutUsData>((x) => FetchAboutUsData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchAboutUsModel.fromJson(String source) => FetchAboutUsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchAboutUsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchAboutUsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchAboutUsData {
  String title;
  String description;
  FetchAboutUsData({
      this.title="",
      this.description="",
  });

  FetchAboutUsData copyWith({
    String? title,
    String? description,
  }) {
    return FetchAboutUsData(
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

  factory FetchAboutUsData.fromMap(Map<String, dynamic> map) {
    return FetchAboutUsData(
      title: map['title'] ??"",
      description: map['description']??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchAboutUsData.fromJson(String source) => FetchAboutUsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchAboutUsData(title: $title, description: $description)';

  @override
  bool operator ==(covariant FetchAboutUsData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
