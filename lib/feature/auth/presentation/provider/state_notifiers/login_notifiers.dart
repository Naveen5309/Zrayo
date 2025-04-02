import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/config/validator.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../../../core/helpers/all_getter.dart';
import '../../../../../core/utils/routing/routes.dart';
import '../../../data/repositories/auth_repo_implementation.dart';
import '../states/login_states.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository authRepo;
  final Validator validator = Validator.instance;
  final forgetEmailController = TextEditingController();
  final emailController = TextEditingController(
      text: kDebugMode ? "amandeep@parastsssechnologies.com" : "");
  final passwordController =
      TextEditingController(text: kDebugMode ? "Amandeep@123" : "");
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  final referralController = TextEditingController();

  LoginNotifier({required this.authRepo}) : super(LoginInitial());

  void loginValidator(BuildContext context) {
    // offAllNamed(context, Routes.dashboard);
    // return;
    final isValid = validator.loginValidator(
        email: emailController.text, pass: passwordController.text);
    if (isValid) {
      login();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> login() async {
    state = LoginApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const LoginFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "email": emailController.text,
        "password": passwordController.text,
        "userType": Getters.getLocalStorage.getUserType()?.index ??
            UserTypeEnum.customer.index,
        "deviceType": Platform.isIOS ? "ios" : "android",
        "deviceToken": "deviceToken"
      };

      final result = await authRepo.doLogin(body: body);
      state = result.fold((error) {
        return LoginFailed(error: error.message);
      }, (result) {
        return LoginSuccess();
      });
    } catch (e) {
      state = LoginFailed(error: e.toString());
    }
  }

  void forgetPasswordValidator(BuildContext context) {
    final isValid =
        validator.forgetPasswordValidator(email: forgetEmailController.text);
    if (isValid) {
      forgetPassword();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> forgetPassword() async {
    state = LoginApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const LoginFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "email": forgetEmailController.text,
      };
      final result = await authRepo.forgotPassword(body: body);
      state = result.fold((error) {
        return LoginFailed(error: error.message);
      }, (result) {
        return OtpSentSuccess();
      });
    } catch (e) {
      state = LoginFailed(error: e.toString());
    }
  }

  void changePasswordValidator(BuildContext context) {
    // offAllNamed(context, Routes.loginView);
    // return;
    final isValid = validator.changePasswordValidator(
        password: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);
    if (isValid) {
      changePassword();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> changePassword() async {
    state = LoginApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const LoginFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "password": newPasswordController.text,
      };
      final result = await authRepo.changePassword(body: body);
      state = result.fold((error) {
        return LoginFailed(error: error.message);
      }, (result) {
        return ChangePasswordSuccess();
      });
    } catch (e) {
      state = LoginFailed(error: e.toString());
    }
  }

  void verifyEmailValidator(BuildContext context) {
    final isValid = validator.verifyEmailValidator(otp: otpController.text);
    if (isValid) {
      verifyEmail();
    } else {
      toast(msg: validator.error);
    }
  }

  Future<void> verifyEmail() async {
    state = LoginApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const LoginFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "otp": otpController.text,
      };
      final result = await authRepo.verifyEmail(body: body);
      state = result.fold((error) {
        return LoginFailed(error: error.message);
      }, (result) {
        return OtpVerifySuccess();
      });
    } catch (e) {
      state = LoginFailed(error: e.toString());
    }
  }
}
