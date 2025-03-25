import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';

import '../../../../config/app_utils.dart';
import '../../../history/presentation/view/history_view.dart';
import '../../../home/presentation/view/home_view_main.dart';
import '../../../z_common_widgets/app_text.dart';
import '../../../z_common_widgets/common_property_type_filter_content.dart';
import '../../../z_common_widgets/custom_app_bar.dart';
import '../../../z_common_widgets/custom_cache_network_image.dart';

part 'visit_card.dart';

class VisitMainView extends StatelessWidget {
  final bool fromSettings;

  const VisitMainView({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          yHeight(10),
          CustomAppBar(
            title: "Visits",
            showBackButton: fromSettings,
            action: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.greyEDEDED.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Utils.appBottomSheet(
                      isScrolled: true,
                      context: context,
                      widget: CommonPropertyTypeFilterContent());
                },
                child: SvgPicture.asset(
                  Assets.filterIcon,
                  colorFilter:
                      ColorFilter.mode(AppColor.black000000, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // yHeight(10.h),
                  CustomTabBar(
                    firstString: "Current",
                    secondString: "Past",
                    selectedIndex: 0,
                    onChange: (value) {},
                  ),
                  yHeight(15.h),
                  Expanded(
                      child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VisitCard();
                    },
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
