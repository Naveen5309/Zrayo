import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

part 'customer_home_view.dart';

part 'property_box.dart';

class HomeViewMain extends StatelessWidget {
  const HomeViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      height: screenHeight(context),
      width: screenWidth(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomAppBar(
              title: "Hello, Rachel 👋",
              subTitle: "Let’s find your cozy place ",
              titleColor: AppColor.whiteFFFFFF,
              showBackButton: false,
              showNotificationIcon: true,
            ),
          ),
          yHeight(20.h),
          if (!Getters.isAgent()) ...{
            Expanded(
              child: CustomerHomeView(),
            )
          }
        ],
      ),
    );
  }
}
