import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';

import '../dashboard_provider.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dashboardProvider);

    final dashboardProviderObj = ref.read(dashboardProvider.notifier);
    final bottomTabList =
        Getters.getLocalStorage.getUserType() == UserType.customer
            ? dashboardProviderObj.customerTabList
            : dashboardProviderObj.agentTabList;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColor.whiteFFFFFF,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: AppColor.black000000.withValues(alpha: .3),
              offset: Offset(0, -1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomTabList.length,
            (index) {
              return InkWell(
                onTap: () {
                  dashboardProviderObj.changeTab(bottomTabList[index]);
                },
                child: SvgPicture.asset(
                    dashboardProviderObj.tabSvgs(bottomTabList[index])),
              );
            },
          ),
        ),
      ),
      body: dashboardProviderObj.getScreen(),
    );
  }
}
