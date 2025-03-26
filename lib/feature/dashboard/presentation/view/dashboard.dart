import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/view/location_access_content.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/home_view_main.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_bottom_sheet.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_dialog.dart';

import '../provider/dashboard_provider.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomDialog(context, content: LocationAccessContent());
      CustomBottomSheet(content: ratingWidget(context, ref));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(dashboardProvider);

    final dashboardProviderObj = ref.read(dashboardProvider.notifier);
    final bottomTabList =
        Getters.getLocalStorage.getUserType() == UserTypeEnum.customer
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
