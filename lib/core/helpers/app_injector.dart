import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/data_source/customer_property_data_source.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';

import '../../config/helper.dart';
import '../../feature/auth/data/data_source/auth_data_source.dart';
import '../../feature/auth/data/repositories/auth_repo_implementation.dart';
import '../local_storage/local_storage.dart';
import '../network/http_service.dart';
import '../network/interceptor.dart';
import '../network/network_info.dart';

typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await Hive.initFlutter(AppConstants.localDirectory);
    await GetIt.I.allReady();
    final storage = await HiveStorageImp.init();
    GetIt.I.registerLazySingleton<LocalStorage>(() => storage);
    GetIt.I.registerLazySingleton<Injector>(() => Injector());
    GetIt.I.registerLazySingleton<Connectivity>(() => Connectivity());
    GetIt.I.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImplementation(GetIt.I<Connectivity>()));
    GetIt.I.registerLazySingleton<ApiProvider>(() => ApiProvider());
    GetIt.I.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
    GetIt.I.registerLazySingleton<AuthRepository>(
        () => AuthRepoImpl(dataSource: GetIt.I<AuthDataSource>()));
    GetIt.I.registerLazySingleton<CustomerPropertyDataSource>(
        () => CustomerPropertyDataSourceImpl());
    GetIt.I.registerLazySingleton<CustomerPropertyRepository>(() =>
        CustomerPropertyRepoImpl(
            customerPropertySource: GetIt.I<CustomerPropertyDataSource>()));
  }
}
