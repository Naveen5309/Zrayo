import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../states/home_states.dart';

class CustomerHomeNotifier extends StateNotifier<HomeState> {
  CustomerHomeNotifier() : super(HomeInitial());
  DataViewTypes selectedCustomerHomePageViewType =
      DataViewTypes.list;

  void updateCustomerHomeView() {
    selectedCustomerHomePageViewType = selectedCustomerHomePageViewType ==
        DataViewTypes.list?DataViewTypes.map:DataViewTypes.list;
    state = HomePageRefresh();
  }
}
