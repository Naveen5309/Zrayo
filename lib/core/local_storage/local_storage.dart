import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../../config/helper.dart';
import '../../feature/auth/data/models/user_model.dart';

abstract class HiveConst {
  static const String userData = 'userData';
  static const String userType = 'userType';
  static const String authToken = 'authToken';
  static const String isProfileComplete = 'isProfileComplete';
}

abstract class LocalStorage {
  Future<bool> saveLoginUser(UserModel userModel);

  Future<void> saveUserType(UserTypeEnum userType);

  UserModel? getLoginUser();

  UserTypeEnum? getUserType();

  Future<void> clearAllBox();

  String? getToken();

  Future<void> saveToken(String token);

  Future<void> saveIsProfileComplete(int isComplete);

  int? getIsProfileComplete();
}

class HiveStorageImp extends LocalStorage {
  final Box userBox;

  HiveStorageImp({
    required this.userBox,
  });

  @override
  Future<void> saveToken(String token) async {
    await userBox.put(HiveConst.authToken, token);
    printLog("==============saveToken==========");
  }

  @override
  String? getToken() {
    final authToken = userBox.get(HiveConst.authToken);
    return authToken;
  }

  static Future<LocalStorage> init() async => HiveStorageImp(
        userBox: await Hive.openBox(HiveConst.userData),
      );

  @override
  Future<bool> saveLoginUser(UserModel userModel) async {
    await userBox.put(HiveConst.userData, userModel.toJson());
    printLog("==============saveLoginUser==========");

    return true;
  }

  @override
  UserModel? getLoginUser() {
    final user = userBox.get(HiveConst.userData);
    if (user == null) return null;
    final data = UserModel.fromJson(jsonDecode(jsonEncode(user)));
    return data;
  }

  @override
  Future<void> clearAllBox() async {
    await userBox.clear();
  }

  @override
  Future<void> saveIsProfileComplete(int isComplete) async {
    await userBox.put(HiveConst.isProfileComplete, isComplete);
  }

  @override
  int? getIsProfileComplete() {
    final isComplete = userBox.get(HiveConst.isProfileComplete);
    return isComplete;
  }

  @override
  UserTypeEnum? getUserType() {
    final userTypeInt = userBox.get(HiveConst.userType);
    return UserTypeEnum.values.firstWhere((element) => element.index==userTypeInt,);
  }

  @override
  Future<void> saveUserType(UserTypeEnum userType) async {
    await userBox.put(HiveConst.userType, userType.index);
  }
}
