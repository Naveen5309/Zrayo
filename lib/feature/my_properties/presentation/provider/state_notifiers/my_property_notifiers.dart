import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/repositories/customer_property_repo_implementation.dart';

import '../states/my_property_states.dart';

class MyPropertyNotifier extends StateNotifier<MyPropertyState> {
  final CustomerPropertyRepository customerPropertyRepo;

  MyPropertyNotifier({required this.customerPropertyRepo})
      : super(MyPropertyInitial());
}
