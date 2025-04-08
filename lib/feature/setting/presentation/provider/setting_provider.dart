import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/setting/data/data_source/setting_data_source.dart';
import 'package:zrayo_flutter/feature/setting/data/repository/setting_repository.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state_notifier/setting_notifier.dart';

import '../../../../core/helpers/all_getter.dart';

final settingDataSource =
    Provider.autoDispose<SettingDataSource>((ref) => SettingDataSourceImpl());

final settingRepoProvider = Provider.autoDispose<SettingRepository>((ref) {
  final dataSource = ref.watch(settingDataSource);
  return SettingRepoImpl(dataSource: dataSource);
});

final settingViewProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>((ref) {
  final settingRepo = ref.watch(settingRepoProvider);
  return SettingNotifier(settingRepo: settingRepo);
});

final isToggle = StateProvider.autoDispose<bool>((ref) {
  final userModel = Getters.getLocalStorage.getLoginUser();

  return userModel?.isNotification == 1 ? true : false;
}, name: "isToggle");
