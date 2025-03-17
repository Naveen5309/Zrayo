// Define a Provider for AuthDataSource
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/auth/data/data_source/auth_data_source.dart';
import 'package:zrayo_flutter/feature/auth/data/repositories/auth_repo_implementation.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/sign_up_notifier.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';

final authDataProvider =
    Provider.autoDispose<AuthDataSource>((ref) => AuthDataSourceImpl());

// Define a Provider for AuthRepository
final authRepoProvider = Provider.autoDispose<AuthRepository>((ref) {
  final dataSource = ref.watch(authDataProvider);
  return AuthRepoImpl(dataSource: dataSource);
});

// Define a StateNotifierProvider forSignUpNotifier
final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return SignUpNotifier(authRepo: authRepo);
});

final isConfirmPassVisible = StateProvider.autoDispose<bool>((ref) => false,
    name: "isPassConfirmVisible");

final isPassVisible =
    StateProvider.autoDispose<bool>((ref) => false, name: "isPassVisible");
