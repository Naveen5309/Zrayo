import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/validator.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/auth/data/repositories/auth_repo_implementation.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthRepository authRepo;
  final phoneController =
      TextEditingController(text: kDebugMode ? "9876543210" : "");
  final otpController = TextEditingController(text: kDebugMode ? "1234" : "");
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final referralController = TextEditingController();

  SignUpNotifier({required this.authRepo}) : super(SignUpInitial());

  void signUpValidator(BuildContext context) {
    final isValid = Validator.instance.signUpValidator(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text);
    if (isValid) {
      signUp();
    } else {
      toast(msg: Validator.instance.error);
    }
  }

  Future<void> signUp() async {
    state = SignUpApiLoading();
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        state = const SignUpFailed(error: "No internet connection");
        return;
      }
      if (await Getters.networkInfo.isSlow) {}
      Map<String, dynamic> body = {
        "email": "dev@yopmail.com",
        "password": "Pass@123",
        "confirmPassword": "Pass@123",
        "device_type": "android",
        "device_token": "No Token",
      };
      final result = await authRepo.doLogin(body: body);
      state = result.fold((error) {
        return SignUpFailed(error: error.message);
      }, (result) {
        return SignUpSuccess();
      });
    } catch (e) {
      state = SignUpFailed(error: e.toString());
    }
  }
}
