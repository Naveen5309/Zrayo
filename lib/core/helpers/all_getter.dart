import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../local_storage/local_storage.dart';
import '../network/http_service.dart';
import '../network/network_info.dart';

/// general getter

class Getters {
  Getters._();

  static GlobalKey<NavigatorState> get navKey =>
      GetIt.I.get<GlobalKey<NavigatorState>>();

  static DateTime get now => DateTime.now();

  static LocalStorage get getLocalStorage => GetIt.I.get<LocalStorage>();

  static ApiProvider get getHttpService => GetIt.I.get<ApiProvider>();

  static NetworkInfo get networkInfo => GetIt.I.get<NetworkInfo>();

  static BuildContext? get getContext => navKey.currentContext;

  static String? authToken() {
    return GetIt.I.get<LocalStorage>().getToken();
  }

  static bool get isLoggedIn =>
      GetIt.I.get<LocalStorage>().getIsProfileComplete() == 1;

  static bool isAgent() =>
      GetIt.I.get<LocalStorage>().getUserType() == UserTypeEnum.agent;

}
