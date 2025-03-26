import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/state_notifiers/customer_side_search_notifier.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/state_notifiers/home_notifier.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/states/home_states.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/states/search_states.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
  // final authRepo = ref.watch(authRepoProvider);
  return HomeNotifier();
});

final customerSideSearchProvider = StateNotifierProvider.autoDispose<
    CustomerSideSearchNotifier, CustomerSideSearchState>((ref) {
  // final authRepo = ref.watch(authRepoProvider);
  return CustomerSideSearchNotifier();
});
final ratingProvider = StateProvider<int>((ref) => 3);
