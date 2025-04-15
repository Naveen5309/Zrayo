// To parse this JSON data, do
//
//     final propertyAgentsListsModel = propertyAgentsListsModelFromJson(jsonString);

import 'dart:convert';

PropertyAgentsListsModel propertyAgentsListsModelFromJson(String str) =>
    PropertyAgentsListsModel.fromJson(json.decode(str));

String propertyAgentsListsModelToJson(PropertyAgentsListsModel data) =>
    json.encode(data.toJson());

class PropertyAgentsListsModel {
  int? id;
  String? userProfile;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  PropertyAgentsListsModel({
    this.id,
    this.userProfile,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  factory PropertyAgentsListsModel.fromJson(Map<String, dynamic> json) =>
      PropertyAgentsListsModel(
        id: json["id"],
        userProfile: json["userProfile"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userProfile": userProfile,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      };
}
