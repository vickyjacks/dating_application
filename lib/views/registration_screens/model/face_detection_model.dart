import 'dart:convert';

FaceDectectionModel faceDectectionModelFromJson(String str) => FaceDectectionModel.fromJson(json.decode(str));

String faceDectectionModelToJson(FaceDectectionModel data) => json.encode(data.toJson());

class FaceDectectionModel {
  final int statusCode;
  final String statusMessage;
  final bool hasError;
  final FaceData data;
  final List<ImageSpec> imageSpecs;

  FaceDectectionModel({
    required this.statusCode,
    required this.statusMessage,
    required this.hasError,
    required this.data,
    required this.imageSpecs,
  });

  factory FaceDectectionModel.fromJson(Map<String, dynamic> json) => FaceDectectionModel(
    statusCode: json["statusCode"]??0,
    statusMessage: json["statusMessage"]??'',
    hasError: json["hasError"]??false,
    data: FaceData.fromJson(json["data"]??''),
    imageSpecs: List<ImageSpec>.from(json["imageSpecs"].map((x) => ImageSpec.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "hasError": hasError,
    "data": data.toJson(),
    "imageSpecs": List<dynamic>.from(imageSpecs.map((x) => x.toJson())),
  };
}

class FaceData {
  final int resultIndex;
  final String resultMessage;
  final double similarPercent;

  FaceData({
    required this.resultIndex,
    required this.resultMessage,
    required this.similarPercent,
  });

  factory FaceData.fromJson(Map<String, dynamic> json) => FaceData(
    resultIndex: json["resultIndex"]??0,
    resultMessage: json["resultMessage"]??'',
    similarPercent: json["similarPercent"]??0.0,
  );

  Map<String, dynamic> toJson() => {
    "resultIndex": resultIndex,
    "resultMessage": resultMessage,
    "similarPercent": similarPercent,
  };
}

class ImageSpec {
  final LeftBottom leftTop;
  final LeftBottom rightTop;
  final LeftBottom rightBottom;
  final LeftBottom leftBottom;

  ImageSpec({
    required this.leftTop,
    required this.rightTop,
    required this.rightBottom,
    required this.leftBottom,
  });

  factory ImageSpec.fromJson(Map<String, dynamic> json) => ImageSpec(
    leftTop: LeftBottom.fromJson(json["leftTop"]??''),
    rightTop: LeftBottom.fromJson(json["rightTop"]??''),
    rightBottom: LeftBottom.fromJson(json["rightBottom"]??''),
    leftBottom: LeftBottom.fromJson(json["leftBottom"]??''),
  );

  Map<String, dynamic> toJson() => {
    "leftTop": leftTop.toJson(),
    "rightTop": rightTop.toJson(),
    "rightBottom": rightBottom.toJson(),
    "leftBottom": leftBottom.toJson(),
  };
}

class LeftBottom {
  final bool isEmpty;
  final int x;
  final int y;

  LeftBottom({
    required this.isEmpty,
    required this.x,
    required this.y,
  });

  factory LeftBottom.fromJson(Map<String, dynamic> json) => LeftBottom(
    isEmpty: json["isEmpty"]??false,
    x: json["x"]??0,
    y: json["y"]??0,
  );

  Map<String, dynamic> toJson() => {
    "isEmpty": isEmpty,
    "x": x,
    "y": y,
  };
}
