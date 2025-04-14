import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/data_source/customer_property_data_source.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';
import 'state_notifiers/my_property_notifiers.dart';
import 'states/my_property_states.dart';

final customerPropertyDataProvider =
    Provider.autoDispose<CustomerPropertyDataSource>(
        (ref) => CustomerPropertyDataSourceImpl());

final customerPropertyRepoProvider =
    Provider.autoDispose<CustomerPropertyRepository>((ref) {
  final dataSource = ref.watch(customerPropertyDataProvider);
  return CustomerPropertyRepoImpl(customerPropertySource: dataSource);
});

final myPropertyProvider =
    StateNotifierProvider.autoDispose<MyPropertyNotifier, MyPropertyState>(
        (ref) {
  final customerPropertyRepo = ref.watch(customerPropertyRepoProvider);
  return MyPropertyNotifier(customerPropertyRepo: customerPropertyRepo);
});
