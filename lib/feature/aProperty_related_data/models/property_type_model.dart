import 'dart:convert';

PropertyTypeAndFeaturesModel propertyTypeModelFromJson(String str) =>
    PropertyTypeAndFeaturesModel.fromJson(json.decode(str));

String propertyTypeModelToJson(PropertyTypeAndFeaturesModel data) =>
    json.encode(data.toJson());

class PropertyTypeAndFeaturesModel {
  int? id;
  String? title;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<PropertyTypeAndFeaturesModel>? features;
  int? typeId;

  PropertyTypeAndFeaturesModel({
    this.id,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.features,
    this.typeId,
  });

  PropertyTypeAndFeaturesModel copyWith({
    int? id,
    String? title,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PropertyTypeAndFeaturesModel>? features,
    int? typeId,
  }) =>
      PropertyTypeAndFeaturesModel(
        id: id ?? this.id,
        title: title ?? this.title,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        features: features ?? this.features,
        typeId: typeId ?? this.typeId,
      );

  factory PropertyTypeAndFeaturesModel.fromJson(Map<String, dynamic> json) =>
      PropertyTypeAndFeaturesModel(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        features: json["features"] == null
            ? []
            : List<PropertyTypeAndFeaturesModel>.from(json["features"]!
                .map((x) => PropertyTypeAndFeaturesModel.fromJson(x))),
        typeId: json["typeID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "typeID": typeId,
      };
}
