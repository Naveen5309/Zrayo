import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../states/home_states.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeInitial());
  CustomerHomePageTypesEnum selectedCustomerHomePageType =
      CustomerHomePageTypesEnum.list;

  void updateCustomerHomeView() {
    selectedCustomerHomePageType = selectedCustomerHomePageType ==
        CustomerHomePageTypesEnum.list?CustomerHomePageTypesEnum.map:CustomerHomePageTypesEnum.list;
    state = HomePageRefresh();
  }
}
