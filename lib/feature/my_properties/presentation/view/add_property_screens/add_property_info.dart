import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/my_property_provider.dart';
import 'package:zrayo_flutter/feature/my_properties/presentation/provider/state_notifiers/my_property_notifiers.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyInfo extends ConsumerWidget {
  const AddPropertyInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myPropertyProvider);
    final myPropertyNotifier = ref.read(myPropertyProvider.notifier);
    // ref.listen<MyPropertyState>(myPropertyProvider, (previous, next) {
    //   if (next is MyPropertyFailed) {
    //     toast(msg: next.error, isError: true);
    //   }
    // });
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
                      _buildRadioButton(
                        label: AppString.forSale.tr(),
                        context: context,
                        type: PropertyListingType.sell,
                        myPropertyNotifier: myPropertyNotifier,
                      ),
                      SizedBox(width: 20.w),
                      _buildRadioButton(
                        label: AppString.forRent.tr(),
                        context: context,
                        type: PropertyListingType.rent,
                        myPropertyNotifier: myPropertyNotifier,
                      ),
                    ],
                  ),
                  yHeight(5),
                  CustomDropdownButton(
                    customBtn: IgnorePointer(
                      child: CustomTextField(
                        labelText: AppString.propertyType.tr(),
                        hintText: AppString.selectPropertyType.tr(),
                        controller: TextEditingController(
                            text:
                                myPropertyNotifier.selectedPropertyType?.title),
                        suffixIcon: SvgPicture.asset(Assets.arrowDown),
                      ),
                    ),
                    buttonDecoration: BoxDecoration(
                      color: AppColor.transparent,
                    ),
                    hint: "",
                    value: myPropertyNotifier.selectedPropertyType != null
                        ? myPropertyNotifier.selectedPropertyType?.title ?? ""
                        : null,
                    dropdownItems: myPropertyNotifier.propertyTypesAndFeatures
                            ?.map(
                              (e) => e.title ?? "",
                            )
                            .toList() ??
                        [],
                    onChanged: (String? value) {
                      myPropertyNotifier.setSelectedPropertyType(value);
                    },
                  ),
                  yHeight(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: AppString.bathroomSize.tr(),
                          hintText: AppString.enterSq.tr(),
                          controller: myPropertyNotifier.bathroomSize,
                        ),
                      ),
                      xWidth(context.width * 0.05),
                      Expanded(
                        child: CustomTextField(
                          labelText: AppString.bedroomSize.tr(),
                          hintText: AppString.enterSq.tr(),
                          controller: myPropertyNotifier.bedroomSize,
                        ),
                      ),
                    ],
                  ),
                  yHeight(10.h),
                  AppText(text: AppString.propertyFeatures.tr()),
                  yHeight(8),
                  if (myPropertyNotifier.selectedPropertyType != null)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                            itemCount: myPropertyNotifier
                                .selectedPropertyType?.features?.length,
                            itemBuilder: (context, index) {
                              final feature = myPropertyNotifier
                                  .selectedPropertyType?.features?[index];
                              final isSelected = myPropertyNotifier
                                      .selectedPropertyFeatures
                                      ?.any(
                                    (element) =>
                                        element.title == feature?.title,
                                  ) ??
                                  false;
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => myPropertyNotifier
                                        .setSelectedPropertyFeatures(feature),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: feature?.title ?? "",
                                          color: AppColor.black4A4A4A
                                              .withValues(alpha: 0.6),
                                        ),
                                        SvgPicture.asset(isSelected
                                            ? Assets.lucideTrue
                                            : Assets.lucide)
                                      ],
                                    ),
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
                            controller: myPropertyNotifier.otherFeature,
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

  Widget _buildRadioButton({
    required String label,
    required BuildContext context,
    required PropertyListingType type,
    required MyPropertyNotifier myPropertyNotifier,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColor.colorB7B7B7,
      ),
      child: Row(
        children: [
          Radio<String>(
            value: type.name,
            groupValue: myPropertyNotifier.sellOrRentType?.name,
            activeColor: AppColor.primary,
            onChanged: (value) => myPropertyNotifier.setSellOrRentType(type),
          ),
          AppText(
            text: label,
            textSize: 14.sp,
            color: AppColor.black4A4A4A,
          ),
        ],
      ),
    );
  }
}
