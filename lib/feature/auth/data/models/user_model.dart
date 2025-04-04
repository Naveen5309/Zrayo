// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  dynamic otp;
  String? userProfile;
  DateTime? dob;
  String? ninOrBvnNumber;
  dynamic deviceToken;
  dynamic deviceId;
  dynamic deviceType;
  dynamic socialId;
  String? loginType;
  int? userType;
  int? isSubscription;
  int? isNotification;
  int? isDelete;
  int? status;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;
  Detail? detail;

  UserModel({
    this.id,
    this.firstName,
    this.fullName,
    this.lastName,
    this.token,
    this.email,
    this.phoneNumber,
    this.otp,
    this.userProfile,
    this.dob,
    this.ninOrBvnNumber,
    this.deviceToken,
    this.deviceId,
    this.deviceType,
    this.socialId,
    this.loginType,
    this.userType,
    this.isSubscription,
    this.isNotification,
    this.isDelete,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.detail,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? token,
    String? phoneNumber,
    dynamic otp,
    String? userProfile,
    DateTime? dob,
    String? ninOrBvnNumber,
    dynamic deviceToken,
    dynamic deviceId,
    dynamic deviceType,
    dynamic socialId,
    String? loginType,
    int? userType,
    int? isSubscription,
    int? isNotification,
    int? isDelete,
    int? status,
    dynamic emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Detail? detail,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        token: token ?? this.token,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        userProfile: userProfile ?? this.userProfile,
        dob: dob ?? this.dob,
        ninOrBvnNumber: ninOrBvnNumber ?? this.ninOrBvnNumber,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceId: deviceId ?? this.deviceId,
        deviceType: deviceType ?? this.deviceType,
        socialId: socialId ?? this.socialId,
        loginType: loginType ?? this.loginType,
        userType: userType ?? this.userType,
        isSubscription: isSubscription ?? this.isSubscription,
        isNotification: isNotification ?? this.isNotification,
        isDelete: isDelete ?? this.isDelete,
        status: status ?? this.status,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        detail: detail ?? this.detail,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    token: json["token"],
        fullName: "${json["firstName"]} ${json["lastName"]}",
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        otp: json["otp"],
        userProfile: json["userProfile"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        ninOrBvnNumber: json["ninOrBvnNumber"],
        deviceToken: json["deviceToken"],
        deviceId: json["deviceID"],
        deviceType: json["deviceType"],
        socialId: json["socialID"],
        loginType: json["loginType"],
        userType: json["userType"],
        isSubscription: json["isSubscription"],
        isNotification: json["isNotification"],
        isDelete: json["isDelete"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "otp": otp,
        "userProfile": userProfile,
        "dob": dob != null
            ? "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}"
            : "",
        "ninOrBvnNumber": ninOrBvnNumber,
        "deviceToken": deviceToken,
        "deviceID": deviceId,
        "deviceType": deviceType,
        "socialID": socialId,
        "loginType": loginType,
        "userType": userType,
        "isSubscription": isSubscription,
        "isNotification": isNotification,
        "isDelete": isDelete,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "detail": detail?.toJson(),
      };
}

class Detail {
  int? id;
  int? userId;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? idDocumentFront;
  String? idDocumentBack;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Detail({
    this.id,
    this.userId,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.idDocumentFront,
    this.idDocumentBack,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Detail copyWith({
    int? id,
    int? userId,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? idDocumentFront,
    String? idDocumentBack,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Detail(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        zipcode: zipcode ?? this.zipcode,
        idDocumentFront: idDocumentFront ?? this.idDocumentFront,
        idDocumentBack: idDocumentBack ?? this.idDocumentBack,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        userId: json["userID"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        idDocumentFront: json["idDocumentFront"],
        idDocumentBack: json["idDocumentBack"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userId,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "idDocumentFront": idDocumentFront,
        "idDocumentBack": idDocumentBack,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
