import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/search_properties/search_property_view.dart';

import '../../../../core/utils/routing/routes.dart';
import '../../../z_common_widgets/app_text.dart';
import '../../../z_common_widgets/custom_app_bar.dart';
import '../../../z_common_widgets/custom_btn.dart';
import '../../../z_common_widgets/custom_text_field.dart';

class CustomFilterScreen extends StatelessWidget {
  const CustomFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Filter",
          ),
          yHeight(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  yHeight(20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
                    decoration: Utils.boxDecoWithShadow(),
                    child: PriceSlider(
                      // value: customerSideSearchNotifier.priceRange,
                      onChanged: (value) {
                        // customerSideSearchNotifier.updatePriceRange(value);
                      },
                    ),
                  ),
                  yHeight(20),

                  /// Location
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
                    decoration: Utils.boxDecoWithShadow(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Location",
                          color: AppColor.black232323,
                        ),
                        yHeight(10.h),
                        CustomTextField(
                          readOnly: true,
                          hintText: AppString.search,
                          prefixIcon: SvgPicture.asset(Assets.searchIcon),
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CommonAppBtn(
                    title: AppString.apply,
                    onTap: () => back(context),
                  ),
                  yHeight(15.h),
                  CommonAppBtn(
                    title: AppString.reset,
                    onTap: () => back(context),
                    backGroundColor: AppColor.secondry,
                    borderColor: AppColor.transparent,
                    textColor: AppColor.primary,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
