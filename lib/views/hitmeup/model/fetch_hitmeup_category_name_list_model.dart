// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FetchHitMeUpCategoryNameListModel {
  bool status;
  String message;
  FetchHitMeUpCategoryNameListData? data;
  FetchHitMeUpCategoryNameListModel({
      this.status=false,
      this.message="",
    this.data,
  });

  FetchHitMeUpCategoryNameListModel copyWith({
    bool? status,
    String? message,
    FetchHitMeUpCategoryNameListData? data,
  }) {
    return FetchHitMeUpCategoryNameListModel(
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

  factory FetchHitMeUpCategoryNameListModel.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpCategoryNameListModel(
      status: map['status'] ?? false,
      message: map['message'] ??"",
      data: map['data'] != null ? FetchHitMeUpCategoryNameListData.fromMap(map['data'] as Map<String,dynamic>) : FetchHitMeUpCategoryNameListData(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpCategoryNameListModel.fromJson(String source) => FetchHitMeUpCategoryNameListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHitMeUpCategoryNameListModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchHitMeUpCategoryNameListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchHitMeUpCategoryNameListData {
  List<Category> category;
  FetchHitMeUpCategoryNameListData({
      this.category=const [],
  });

  FetchHitMeUpCategoryNameListData copyWith({
    List<Category>? category,
  }) {
    return FetchHitMeUpCategoryNameListData(
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category.map((x) => x.toMap()).toList(),
    };
  }

  factory FetchHitMeUpCategoryNameListData.fromMap(Map<String, dynamic> map) {
    return FetchHitMeUpCategoryNameListData(
      category: List<Category>.from((map['category'] ?? const []).map<Category>((x) => Category.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchHitMeUpCategoryNameListData.fromJson(String source) => FetchHitMeUpCategoryNameListData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchHitMeUpCategoryNameListData(category: $category)';

  @override
  bool operator ==(covariant FetchHitMeUpCategoryNameListData other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.category, category);
  }

  @override
  int get hashCode => category.hashCode;
}

class Category {
  int id;
  String categoryName;
  Category({
      this.id=0,
      this.categoryName="",
  });

  Category copyWith({
    int? id,
    String? categoryName,
  }) {
    return Category(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ??0,
      categoryName: map['category_name'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, categoryName: $categoryName)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.categoryName == categoryName;
  }

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode;
}
