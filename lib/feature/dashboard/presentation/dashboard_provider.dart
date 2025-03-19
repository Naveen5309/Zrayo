import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/provider/dashboard_state_notifier.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/states/dashboard_states.dart';

final dashboardProvider =
    StateNotifierProvider.autoDispose<DashboardNotifier, DashboardState>((ref) {
  // final authRepo = ref.watch(authRepoProvider);
  return DashboardNotifier();
});
