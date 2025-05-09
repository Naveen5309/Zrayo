import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/home_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_rating_box.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

import '../../../../config/app_utils.dart';
import '../../../../config/enums.dart';

part 'agent_home_view.dart';

part 'customer_home_view.dart';

part 'customer_map_view.dart';

part 'property_box.dart';

class HomeViewMain extends ConsumerWidget {
  const HomeViewMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(customerHomeProvider);
    final homeNotifier = ref.read(customerHomeProvider.notifier);
    ref.watch(createProfileProvider);
    final userModel = ref.read(createProfileProvider.notifier).userModel ??
        Getters.getLocalStorage.getLoginUser();
    return Scaffold(
      floatingActionButton: Getters.isAgent()
          ? SizedBox.shrink()
          : FloatingActionButton(
              onPressed: () {
                homeNotifier.updateCustomerHomeView();
              },
              backgroundColor: AppColor.primary,
              child: SvgPicture.asset(
                  homeNotifier.selectedCustomerHomePageViewType ==
                          DataViewTypes.map
                      ? Assets.listBulletsIcon
                      : Assets.mapTrifold),
            ),
      body: (homeNotifier.selectedCustomerHomePageViewType ==
                  DataViewTypes.list ||
              Getters.isAgent())
          ? Container(
              color: AppColor.primary,
              height: screenHeight(context),
              width: screenWidth(context),
              child: Column(
                children: [
                  CustomAppBar(
                    title: "Hello, ${userModel?.firstName?.toTitleCase()} 👋",
                    subTitle: "Let’s find your cozy place ",
                    titleColor: AppColor.whiteFFFFFF,
                    showBackButton: false,
                    showNotificationIcon: true,
                    isFromHome: true,
                  ),
                  yHeight(30.h),
                  if (!Getters.isAgent()) ...{
                    Expanded(
                      child: CustomerHomeView(),
                    )
                  } else ...{
                    Expanded(
                      child: AgentHomeView(),
                    )
                  }
                ],
              ),
            )
          : CustomerMapView(),
    );
  }
}
