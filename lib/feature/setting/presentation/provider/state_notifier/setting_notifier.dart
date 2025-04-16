import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/validator.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/setting/data/repository/setting_repository.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class SettingNotifier extends StateNotifier<SettingState> {
  final SettingRepository settingRepo;
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  String aboutContant = "";

  final referralController = TextEditingController();

  SettingNotifier({required this.settingRepo}) : super(SettingInitial());

  void contactUsValidator(BuildContext context) {
    final isValid = Validator.instance.contactUsValidator(
        email: emailController.text,
        subject: subjectController.text,
        message: messageController.text);
    if (isValid) {
      contactUs();
    } else {
      toast(msg: Validator.instance.error);
    }
  }

  Future<void> contactUs() async {
    state = SettingApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const SettingFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "email": emailController.text,
        "subject": subjectController.text,
        "message": messageController.text,
      };
      final result = await settingRepo.contactUs(body: body);
      state = result.fold((error) {
        return SettingFailed(error: error.message);
      }, (result) {
        return SettingSuccess();
      });
    } catch (e) {
      state = SettingFailed(error: e.toString());
    }
  }

  Future<void> notificationStatusChange(
      {required bool notificationValue}) async {
    state = SettingApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const SettingFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "isNotification": notificationValue ? 1 : 0,
      };
      final result = await settingRepo.notificationStatusChange(body: body);
      state = result.fold((error) {
        return SettingFailed(error: error.message);
      }, (result) {
        return SettingSuccess();
      });
    } catch (e) {
      state = SettingFailed(error: e.toString());
    }
  }

  /// LOGOUT API
  Future<void> logout() async {
    state = SettingApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const SettingFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {};
      final result = await settingRepo.logout(body: body);
      state = result.fold((error) {
        return SettingFailed(error: error.message);
      }, (result) {
        return SettingSuccess();
      });
    } catch (e) {
      state = SettingFailed(error: e.toString());
    }
  }

  /// About us API
  Future<void> aboutUs() async {
    state = SettingApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const SettingFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {"type": "about"};
      final result = await settingRepo.aboutUs(body: body);
      state = result.fold((error) {
        return SettingFailed(error: error.message);
      }, (result) {
        aboutContant = result['content'];
        return SettingSuccess();
      });
    } catch (e) {
      state = SettingFailed(error: e.toString());
    }
  }
}
