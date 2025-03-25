import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final referralController = TextEditingController();

  LoginNotifier({required this.authRepo}) : super(LoginInitial());

  void loginValidator(BuildContext context) {
    offAllNamed(context, Routes.dashboard);
    return;
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
        "email": "dev@yopmail.com",
        "password": "Pass@123",
        "device_type": "android",
        "device_token": "No Token",
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
}
