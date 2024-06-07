// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchSubscriptionPlanDetailModel {
  bool status;
  String message;
  Currntplan? currntplan;
  List<Subscription> subscription;
  FetchSubscriptionPlanDetailModel({
      this.status=false,
      this.message="",
    this.currntplan,
      this.subscription=const [],
  });

  FetchSubscriptionPlanDetailModel copyWith({
    bool? status,
    String? message,
    Currntplan? currntplan,
    List<Subscription>? subscription,
  }) {
    return FetchSubscriptionPlanDetailModel(
      status: status ?? this.status,
      message: message ?? this.message,
      currntplan: currntplan ?? this.currntplan,
      subscription: subscription ?? this.subscription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'currntplan': currntplan?.toMap(),
      'subscription': subscription.map((x) => x.toMap()).toList(),
    };
  }

  factory FetchSubscriptionPlanDetailModel.fromMap(Map<String, dynamic> map) {
    return FetchSubscriptionPlanDetailModel(
      status: map['status']?? false,
      message: map['message']??"",
      currntplan: map['currntplan'] != null ? Currntplan.fromMap(map['currntplan'] as Map<String,dynamic>) : Currntplan(),
      subscription: List<Subscription>.from((map['subscription'] ?? const []).map<Subscription>((x) => Subscription.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchSubscriptionPlanDetailModel.fromJson(String source) => FetchSubscriptionPlanDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchSubscriptionPlanDetailModel(status: $status, message: $message, currntplan: $currntplan, subscription: $subscription)';
  }

  @override
  bool operator ==(covariant FetchSubscriptionPlanDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.currntplan == currntplan &&
      listEquals(other.subscription, subscription);
  }

  @override
  int get hashCode {
    return status.hashCode ^
      message.hashCode ^
      currntplan.hashCode ^
      subscription.hashCode;
  }
}


class Currntplan {
  String title;
  String type;
  Currntplan({
      this.title="",
      this.type="",
  });

  Currntplan copyWith({
    String? title,
    String? type,
  }) {
    return Currntplan(
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
    };
  }

  factory Currntplan.fromMap(Map<String, dynamic> map) {
    return Currntplan(
      title: map['title'] ??"",
      type: map['type'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Currntplan.fromJson(String source) => Currntplan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Currntplan(title: $title, type: $type)';

  @override
  bool operator ==(covariant Currntplan other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ type.hashCode;
}


class Subscription {
  int subscriptionId;
  String title;
  String month;
  String price;
  Subscription({
      this.subscriptionId=0,
      this.title="",
      this.month="",
      this.price="",
  });

  Subscription copyWith({
    int? subscriptionId,
    String? title,
    String? month,
    String? price,
  }) {
    return Subscription(
      subscriptionId: subscriptionId ?? this.subscriptionId,
      title: title ?? this.title,
      month: month ?? this.month,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subscriptionId': subscriptionId,
      'title': title,
      'month': month,
      'price': price,
    };
  }

  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      subscriptionId: map['subscriptionId'] ??0,
      title: map['title'] ??"",
      month: map['month'] ??"",
      price: map['price'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Subscription.fromJson(String source) => Subscription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Subscription(subscriptionId: $subscriptionId, title: $title, month: $month, price: $price)';
  }

  @override
  bool operator ==(covariant Subscription other) {
    if (identical(this, other)) return true;
  
    return 
      other.subscriptionId == subscriptionId &&
      other.title == title &&
      other.month == month &&
      other.price == price;
  }

  @override
  int get hashCode {
    return subscriptionId.hashCode ^
      title.hashCode ^
      month.hashCode ^
      price.hashCode;
  }
}
