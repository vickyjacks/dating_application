// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchHelpCenterModel {
  bool status;
  String message;
  List<FetchHelpCenterData> data;
  FetchHelpCenterModel({
      this.status=false,
      this.message="",
      this.data =const [],
  });

  FetchHelpCenterModel copyWith({
    bool? status,
    String? message,
    List<FetchHelpCenterData>? data,
  }) {
    return FetchHelpCenterModel(
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

  factory FetchHelpCenterModel.fromMap(Map<String, dynamic> map) {
    return FetchHelpCenterModel(
      status: map['status'] ?? false, 
      message: map['message'] ??"",
      data: List<FetchHelpCenterData>.from((map['data'] ?? const []).map<FetchHelpCenterData>((x) => FetchHelpCenterData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHelpCenterModel.fromJson(String source) => FetchHelpCenterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHelpCenterModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchHelpCenterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchHelpCenterData {
  String phone;
  String email;
  FetchHelpCenterData({
      this.phone="",
      this.email="",
  });

  FetchHelpCenterData copyWith({
    String? phone,
    String? email,
  }) {
    return FetchHelpCenterData(
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'email': email,
    };
  }

  factory FetchHelpCenterData.fromMap(Map<String, dynamic> map) {
    return FetchHelpCenterData(
      phone: map['phone'] ??"",
      email: map['email']??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHelpCenterData.fromJson(String source) => FetchHelpCenterData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHelpCenterData(phone: $phone, email: $email)';

  @override
  bool operator ==(covariant FetchHelpCenterData other) {
    if (identical(this, other)) return true;
  
    return 
      other.phone == phone &&
      other.email == email;
  }

  @override
  int get hashCode => phone.hashCode ^ email.hashCode;
}
