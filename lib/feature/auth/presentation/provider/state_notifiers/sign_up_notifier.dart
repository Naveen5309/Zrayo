import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/auth/data/repositories/auth_repo_implementation.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/auth_states.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthRepository authRepo;
  final phoneController =
      TextEditingController(text: kDebugMode ? "9876543210" : "");
  final otpController = TextEditingController(text: kDebugMode ? "1234" : "");
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final referralController = TextEditingController();

  SignUpNotifier({required this.authRepo}) : super(SignUpInitial());
}
