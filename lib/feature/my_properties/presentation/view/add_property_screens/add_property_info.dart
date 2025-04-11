import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyInfo extends ConsumerWidget {
  AddPropertyInfo({super.key});

  final List<String> features = [
    "Air Condition",
    "Parquet Balcony",
    "Smoking Allowed",
    "Roof",
    "Hi-Fi Heating",
    "Use of Pool",
    "Terrace"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addProperty.tr()),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 3.5,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yHeight(20.h),
                  AppText(
                    text: AppString.doYouWantToSellProperty.tr(),
                    textSize: 15.sp,
                    fontFamily: AppFonts.satoshiBold,
                  ),
                  yHeight(5.h),
                  Row(
                    children: [
                      _buildRadioButton(AppString.forSale.tr(), context),
                      SizedBox(width: 20.w),
                      _buildRadioButton(AppString.forRent.tr(), context),
                    ],
                  ),
                  yHeight(5),
                  CustomDropdownButton(
                    customBtn: IgnorePointer(
                      child: CustomTextField(
                        labelText: AppString.propertyType.tr(),
                        hintText: AppString.selectPropertyType.tr(),
                        controller: TextEditingController(),
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
                  yHeight(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: AppString.bathroomSize.tr(),
                          hintText: AppString.enterSq.tr(),
                          controller: TextEditingController(),
                        ),
                      ),
                      xWidth(context.width * 0.05),
                      Expanded(
                        child: CustomTextField(
                          labelText: AppString.bedroomSize.tr(),
                          hintText: AppString.enterSq.tr(),
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  yHeight(10.h),
                  AppText(text: AppString.propertyFeatures.tr()),
                  yHeight(8),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColor.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: AppColor.grey99ABC6.withValues(alpha: 0.18),
                          blurRadius: 62,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: features.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: features[index],
                                      color: AppColor.black4A4A4A
                                          .withValues(alpha: 0.6),
                                    ),
                                    SvgPicture.asset(Assets.lucide)
                                  ],
                                ),
                                Divider(
                                  color: AppColor.black111111
                                      .withValues(alpha: 0.19),
                                ),
                                yHeight(8)
                              ],
                            );
                          },
                        ),
                        yHeight(11),
                        CustomTextField(
                          labelText: AppString.other.tr(),
                          hintText: AppString.enterPropertyFeature.tr(),
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ),
                  yHeight(8),
                  CommonAppBtn(
                    title: AppString.next.tr(),
                    onTap: () => toNamed(context, Routes.addPropertyAgent),
                  ),
                  yHeight(5),
                ],
              ),
            ),
          ],
        ),
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
            groupValue: '',
            activeColor: AppColor.primary,
            onChanged: (value) {},
          ),
          AppText(
            text: label.tr(),
            textSize: 14.sp,
            color: AppColor.black4A4A4A,
          ),
        ],
      ),
    );
  }
}
