import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_source/auth_data_source.dart';
import '../../data/repositories/auth_repo_implementation.dart';
import 'state_notifiers/login_notifiers.dart';
import 'states/auth_states.dart';

// Define a Provider for AuthDataSource
final authDataProvider = Provider.autoDispose<AuthDataSource>((ref) => AuthDataSourceImpl());

// Define a Provider for AuthRepository
final authRepoProvider = Provider.autoDispose<AuthRepository>((ref) {
  final dataSource = ref.watch(authDataProvider);
  return AuthRepoImpl(dataSource: dataSource);
});



// Define a StateNotifierProvider for LoginNotifier
final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginNotifier(authRepo: authRepo);
});
