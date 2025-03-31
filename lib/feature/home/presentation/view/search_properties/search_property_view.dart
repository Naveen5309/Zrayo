import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/home_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

import '../../../../../config/app_utils.dart';
import '../../../../../config/assets.dart';
import '../../../../../config/helper.dart';
import '../../../../z_common_widgets/custom_drop_down.dart';
import '../../../../z_common_widgets/custom_text_field.dart';

part 'price_slider.dart';
class SearchPropertyView extends ConsumerWidget {
  const SearchPropertyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(customerSideSearchProvider);
    final customerSideSearchNotifier =
        ref.read(customerSideSearchProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Search property",
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  yHeight(5.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
                    decoration: Utils.boxDecoWithShadow(),
                    child: Column(
                      children: [
                        AppText(
                          text: AppString.wanttoSellProperty,
                          textSize: 15.sp,
                        ),
                        yHeight(10),
                        Row(
                          children: [
                            _buildRadioButton(AppString.buy, context),
                            SizedBox(width: 20.w),
                            _buildRadioButton(AppString.rent, context),
                          ],
                        ),
                      ],
                    ),
                  ),
                  yHeight(20.h),

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
                        CustomDropdownButton(
                          customBtn: IgnorePointer(
                            child: CustomTextField(
                              readOnly: true,
                              hintText: AppString.selectCity,
                              controller: TextEditingController(),
                              prefixIcon: SvgPicture.asset(Assets.city),
                              suffixIcon: SvgPicture.asset(Assets.arrowDown),
                            ),
                          ),
                          buttonDecoration: BoxDecoration(
                            color: AppColor.transparent,
                          ),
                          hint: 'City',
                          value: "New York",
                          dropdownItems: [
                            "New York",
                            "Los Angeles",
                            "Chicago",
                            "Houston",
                            "Miami"
                          ],
                          onChanged: (String? value) {},
                        ),
                        CustomDropdownButton(
                          customBtn: IgnorePointer(
                            child: CustomTextField(
                              hintText: AppString.selectSate,
                              controller: TextEditingController(),
                              prefixIcon: SvgPicture.asset(Assets.state),
                              suffixIcon: SvgPicture.asset(Assets.arrowDown),
                            ),
                          ),
                          buttonDecoration: BoxDecoration(
                            color: AppColor.transparent,
                          ),
                          hint: 'State',
                          value: "Miami",
                          dropdownItems: [
                            "victoria",
                            "Los Angeles",
                            "melbran",
                            "Houston",
                            "Miami"
                          ],
                          onChanged: (String? value) {},
                        ),
                      ],
                    ),
                  ),
                  yHeight(20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
                    decoration: Utils.boxDecoWithShadow(),
                    child: PriceSlider(
                      value: customerSideSearchNotifier.priceRange,
                      onChanged: (value) {
                        customerSideSearchNotifier.updatePriceRange(value);
                      },
                    ),
                  ),
                  yHeight(20),

                  /// Property Type
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
                    decoration: Utils.boxDecoWithShadow(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Property Type",
                          color: AppColor.black232323,
                        ),
                        yHeight(15.h),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: customerSideSearchNotifier
                              .propertyTypeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => customerSideSearchNotifier
                                  .changePropertyType(customerSideSearchNotifier
                                      .propertyTypeList[index]['type']),
                              child: propertyTypeBox(
                                  customerSideSearchNotifier
                                      .propertyTypeList[index],
                                  customerSideSearchNotifier
                                          .propertyTypeList[index]['type'] ==
                                      customerSideSearchNotifier
                                          .selectedPropertyType),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  yHeight(20),

                  CommonAppBtn(
                    title: AppString.search,
                    onTap: () => toNamed(context, Routes.searchResultsView),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Widget propertyTypeBox(Map<String, dynamic> propertyTypeList, isSelected) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.colorB7B7B7)),
    child: Row(
      children: [
        if (propertyTypeList.containsKey("icon"))
          SvgPicture.asset(propertyTypeList['icon']),
        xWidth(10),
        Expanded(
            child: AppText(
          text: propertyTypeList['title'],
          color: AppColor.black4A4A4A,
        )),
        Container(
          padding: EdgeInsets.all(2.sp),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: isSelected ? AppColor.primary : AppColor.colorB7B7B7,
                  width: 2)),
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !isSelected ? AppColor.transparent : AppColor.primary),
          ),
        )
      ],
    ),
  );
}

Widget _buildRadioButton(String label, BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      unselectedWidgetColor: AppColor.colorB7B7B7,
    ),
    child: Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: "",
          activeColor: AppColor.primary,
          onChanged: (value) {},
        ),
        GestureDetector(
          onTap: () {},
          child: AppText(
            text: label,
            textSize: 14.sp,
            color: AppColor.black4A4A4A.withValues(alpha: .6),
          ),
        ),
      ],
    ),
  );
}
