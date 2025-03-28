import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/setting/data/data_source/setting_data_source.dart';
import 'package:zrayo_flutter/feature/setting/data/repository/setting_repository.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state_notifier/setting_notifier.dart';

final settingProvider =
    Provider.autoDispose<SettingDataSource>((ref) => SettingDataSourceImpl());

final settingRepoProvider = Provider.autoDispose<SettingRepository>((ref) {
  final dataSource = ref.watch(settingProvider);
  return SettingRepoImpl(dataSource: dataSource);
});

final contactUsProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>((ref) {
  final settingRepo = ref.watch(settingRepoProvider);
  return SettingNotifier(settingRepo: settingRepo);
});
