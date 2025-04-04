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
  String? idDocumentFront;  // New field for document front
  String? idDocumentBack;   // New field for document back

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
    this.idDocumentFront,  // Initialize new field
    this.idDocumentBack,   // Initialize new field
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
    idDocumentFront: json["idDocumentFront"],  // New field for document front
    idDocumentBack: json["idDocumentBack"],    // New field for document back
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
    dob != null ? "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}" : "",
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
    "idDocumentFront": idDocumentFront,  // Serialize new field
    "idDocumentBack": idDocumentBack,    // Serialize new field
  };

  // Method to create a copy of the UserModel with optional overrides
  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phoneNumber,
    int? otp,
    dynamic userProfile,
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
    String? token,
    String? idDocumentFront,
    String? idDocumentBack,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
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
      token: token ?? this.token,
      idDocumentFront: idDocumentFront ?? this.idDocumentFront,  // Copy new field
      idDocumentBack: idDocumentBack ?? this.idDocumentBack,    // Copy new field
    );
  }
}
