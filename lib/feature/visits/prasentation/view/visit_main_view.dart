import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';

import '../../../home/presentation/view/home_view_main.dart';
import '../../../z_common_widgets/app_text.dart';
import '../../../z_common_widgets/custom_app_bar.dart';
import '../../../z_common_widgets/custom_cache_network_image.dart';
import '../../../z_common_widgets/custom_text_field.dart';
part 'visit_card.dart';
class VisitMainView extends StatelessWidget {
  const VisitMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "Visits",
          showNotificationIcon: true,
          showBackButton: false,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                yHeight(20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Search location...",
                        prefixIcon: SvgPicture.asset(Assets.searchIcon),
                      ),
                    ),
                    xWidth(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black000000,
                      ),
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset(Assets.filterIcon),
                    ),
                  ],
                ),
                yHeight(10),
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
    );
  }
}
