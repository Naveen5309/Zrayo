import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/auth/data/data_source/auth_data_source.dart';
import 'package:zrayo_flutter/feature/auth/data/repositories/auth_repo_implementation.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/create_profile_notifiers.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/create_profile_states.dart';

final authDataProvider =
    Provider.autoDispose<AuthDataSource>((ref) => AuthDataSourceImpl());

final authRepoProvider = Provider.autoDispose<AuthRepository>((ref) {
  final dataSource = ref.watch(authDataProvider);
  return AuthRepoImpl(dataSource: dataSource);
});

final addAddressProvider = StateNotifierProvider.autoDispose<
    CreateProfileNotifiers, CreateProfileStates>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return CreateProfileNotifiers(authRepo: authRepo);
});
