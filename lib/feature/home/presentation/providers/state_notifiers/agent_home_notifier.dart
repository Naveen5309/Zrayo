import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/enums.dart';

import '../states/home_states.dart';

class AgentHomeNotifier extends StateNotifier<HomeState> {
  AgentHomeNotifier() : super(HomeInitial());
  DataViewTypes selectedViewType =
      DataViewTypes.list;

  void updateAgentHomeViewType() {
    selectedViewType =
        selectedViewType == DataViewTypes.list
            ? DataViewTypes.map
            : DataViewTypes.list;
    state = HomePageRefresh();
  }
}
