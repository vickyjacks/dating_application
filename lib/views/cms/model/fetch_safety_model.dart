// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchSafetyModel {
  bool status;
  String message;
  List<FetchSafetyData> data;
  FetchSafetyModel({
      this.status=false,
      this.message="",
      this.data=const [],
  });

  FetchSafetyModel copyWith({
    bool? status,
    String? message,
    List<FetchSafetyData>? data,
  }) {
    return FetchSafetyModel(
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

  factory FetchSafetyModel.fromMap(Map<String, dynamic> map) {
    return FetchSafetyModel(
      status: map['status'] ?? false,
      message: map['message'] ?? "",
      data: List<FetchSafetyData>.from((map['data'] ?? const []).map<FetchSafetyData>((x) => FetchSafetyData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchSafetyModel.fromJson(String source) => FetchSafetyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchSafetyModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchSafetyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchSafetyData {
  String title;
  String description;
  FetchSafetyData({
      this.title="",
      this.description="",
  });

  FetchSafetyData copyWith({
    String? title,
    String? description,
  }) {
    return FetchSafetyData(
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

  factory FetchSafetyData.fromMap(Map<String, dynamic> map) {
    return FetchSafetyData(
      title: map['title'] ??"",
      description: map['description'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchSafetyData.fromJson(String source) => FetchSafetyData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchSafetyData(title: $title, description: $description)';

  @override
  bool operator ==(covariant FetchSafetyData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
