import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/feature/messages/presentation/view/messages.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/states/dashboard_states.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/home_view_main.dart';

import '../../../favorite_properties/presentation/view/favorite_properties.dart';
import '../../../my_properties/presentation/view/my_properties.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(DashboardInitial());
  DashboardEnum selectedTab = DashboardEnum.home;
  List<DashboardEnum> customerTabList = [
    DashboardEnum.home,
    DashboardEnum.message,
    DashboardEnum.favorite,
    DashboardEnum.property,
    DashboardEnum.profile,
  ];
  List<DashboardEnum> agentTabList = [
    DashboardEnum.home,
    DashboardEnum.message,
    DashboardEnum.visit,
    DashboardEnum.history,
    DashboardEnum.profile,
  ];

  String tabSvgs(DashboardEnum tab) {
    switch (tab) {
      case DashboardEnum.home:
        return selectedTab == DashboardEnum.home
            ? Assets.dashHomeSelected
            : Assets.dashHomeUnselected;
      case DashboardEnum.profile:
        return selectedTab == DashboardEnum.profile
            ? Assets.dashProfileSelected
            : Assets.dashProfileUnselected;
      case DashboardEnum.message:
        return selectedTab == DashboardEnum.message
            ? Assets.dashMsgSelected
            : Assets.dashMsgUnselected;

      case DashboardEnum.property:
        return selectedTab == DashboardEnum.property
            ? Assets.dashPropertySelected
            : Assets.dashPropertyUnselected;

      case DashboardEnum.visit:
        return selectedTab == DashboardEnum.visit
            ? Assets.dashVisitSelected
            : Assets.dashVisitUnselected;

      case DashboardEnum.favorite:
        return selectedTab == DashboardEnum.favorite
            ? Assets.dashFavorite
            : Assets.dashFavorite;
      case DashboardEnum.history:
        return selectedTab == DashboardEnum.history
            ? Assets.dashHistorySelected
            : Assets.dashHistoryUnselected;
    }
  }

  void changeTab(DashboardEnum newTab) {
    selectedTab = newTab;
    state = DashboardChangeTabSuccess();
  }

  Widget getScreen() {
    if (selectedTab == DashboardEnum.home) {
      return HomeViewMain();
    } else if (selectedTab == DashboardEnum.property) {
      return MyProperties();
    } else if (selectedTab == DashboardEnum.favorite) {
      return FavoriteProperties();
    } else if (selectedTab == DashboardEnum.message) {
      return MessagesView();
    }
    return SizedBox();
  }
}
