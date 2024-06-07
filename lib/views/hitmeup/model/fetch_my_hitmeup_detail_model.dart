// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FetchMyHitMeUpDetailModel {
  bool status;
  String message;
  FetchMyHitMeUpDetailData? data;
  FetchMyHitMeUpDetailModel({
      this.status=false,
      this.message="",
    this.data,
  });
   
  FetchMyHitMeUpDetailModel copyWith({
    bool? status,
    String? message,
    FetchMyHitMeUpDetailData? data,
  }) {
    return FetchMyHitMeUpDetailModel(
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

  factory FetchMyHitMeUpDetailModel.fromMap(Map<String, dynamic> map) {
    return FetchMyHitMeUpDetailModel(
      status: map['status'] ?? false,
      message: map['message'] ?? "",
      data: map['data'] != null ? FetchMyHitMeUpDetailData.fromMap(map['data'] as Map<String,dynamic>) : FetchMyHitMeUpDetailData(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchMyHitMeUpDetailModel.fromJson(String source) => FetchMyHitMeUpDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FetchMyHitMeUpDetailModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FetchMyHitMeUpDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FetchMyHitMeUpDetailData {
  int hitmeupId;
  String userName;
  String userImage;
  String categoryName;
  String title;
  String date;
  String time;
  String location;
  String createdAt;
  String createDate;
  FetchMyHitMeUpDetailData({
      this.hitmeupId=0,
      this.userName="",
      this.userImage="",
      this.categoryName="",
      this.title="",
      this.date="",
      this.time="",
      this.location="",
      this.createdAt="",
      this.createDate="",
  });

  FetchMyHitMeUpDetailData copyWith({
    int? hitmeupId,
    String? userName,
    String? userImage,
    String? categoryName,
    String? title,
    String? date,
    String? time,
    String? location,
    String? createdAt,
    String? createDate,
  }) {
    return FetchMyHitMeUpDetailData(
      hitmeupId: hitmeupId ?? this.hitmeupId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      categoryName: categoryName ?? this.categoryName,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hitmeupId': hitmeupId,
      'userName': userName,
      'userImage': userImage,
      'categoryName': categoryName,
      'title': title,
      'date': date,
      'time': time,
      'location': location,
      'createdAt': createdAt,
      'createDate': createDate,
    };
  }

  factory FetchMyHitMeUpDetailData.fromMap(Map<String, dynamic> map) {
    return FetchMyHitMeUpDetailData(
      hitmeupId: map['hitmeupId'] ??0,
      userName: map['user_name'] ??"",
      userImage: map['userImage'] ??"",
      categoryName: map['category_name'] ??"",
      title: map['title'] ??"",
      date: map['date'] ??"",
      time: map['time']??"",
      location: map['location'] ??"",
      createdAt: map['created_at'] ??"",
      createDate: map['create_date'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchMyHitMeUpDetailData.fromJson(String source) => FetchMyHitMeUpDetailData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchMyHitMeUpDetailData(hitmeupId: $hitmeupId, userName: $userName, userImage: $userImage, categoryName: $categoryName, title: $title, date: $date, time: $time, location: $location, createdAt: $createdAt, createDate: $createDate)';
  }

  @override
  bool operator ==(covariant FetchMyHitMeUpDetailData other) {
    if (identical(this, other)) return true;
  
    return 
      other.hitmeupId == hitmeupId &&
      other.userName == userName &&
      other.userImage == userImage &&
      other.categoryName == categoryName &&
      other.title == title &&
      other.date == date &&
      other.time == time &&
      other.location == location &&
      other.createdAt == createdAt &&
      other.createDate == createDate;
  }

  @override
  int get hashCode {
    return hitmeupId.hashCode ^
      userName.hashCode ^
      userImage.hashCode ^
      categoryName.hashCode ^
      title.hashCode ^
      date.hashCode ^
      time.hashCode ^
      location.hashCode ^
      createdAt.hashCode ^
      createDate.hashCode;
  }
}
