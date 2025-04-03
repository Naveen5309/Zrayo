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
  int? otp;
  dynamic userProfile;
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

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.otp,
    this.userProfile,
    this.fullName,
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
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
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
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "otp": otp,
        "userProfile": userProfile,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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
        "token": token,
      };
}
