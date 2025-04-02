import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/auth_data_source.dart';
import '../../data/repositories/auth_repo_implementation.dart';
import 'state_notifiers/login_notifiers.dart';
import 'states/login_states.dart';

final authDataProvider =
    Provider.autoDispose<AuthDataSource>((ref) => AuthDataSourceImpl());

final authRepoProvider = Provider.autoDispose<AuthRepository>((ref) {
  final dataSource = ref.watch(authDataProvider);
  return AuthRepoImpl(dataSource: dataSource);
});

final authProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginNotifier(authRepo: authRepo);
});

/// Using in Login
final isPasswordVisible =
    StateProvider.autoDispose<bool>((ref) => false, name: "isPswdVisible");

/// Using in change password
final isConfirmPassVisible = StateProvider.autoDispose<bool>((ref) => false,
    name: "isPassConfirmVisible");

/// Using in change password
final isNewPassVisible =
    StateProvider.autoDispose<bool>((ref) => false, name: "isPassVisible");
