import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyBioView extends StatelessWidget {
  const AddPropertyBioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
      CustomAppBar(title: AppString.addProperty),
      yHeight(10.sp),
      Container(
        height: 5,
        color: AppColor.orangeFff9f0,
        width: screenWidth(context),
        child: Row(
          children: [
            Container(
              height: 5,
              width: (screenWidth(context) / 5) * 1.6,
              color: AppColor.primary,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              spacing: 10.sp,
              children: [
                yHeight(0),
                CustomTextField(
                  labelText: AppString.tittle,
                  keyboardType: TextInputType.name,
                  hintText: AppString.enterPropertyTittle,
                ),
                CustomTextField(
                  labelText: AppString.price,
                  keyboardType: TextInputType.number,
                  hintText: AppString.enterPropertyPrice,
                ),
                CustomTextField(
                  labelText: AppString.addressStreet,
                  keyboardType: TextInputType.number,
                  hintText: AppString.enterCompleteAddress,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.selectCity,
                            hintText: AppString.city,
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
                    ),
                    xWidth(context.width * 0.05),
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.stateProvince,
                            hintText: AppString.state,
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.arrowDown),
                          ),
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColor.transparent,
                        ),
                        hint: 'State',
                        value: "California",
                        dropdownItems: [
                          "California",
                          "Texas",
                          "Florida",
                          "New York",
                          "Illinois"
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: AppString.zIPCode,
                        hintText: AppString.zIPCode,
                        controller: TextEditingController(),
                      ),
                    ),
                    xWidth(context.width * 0.05),
                    Expanded(
                      child: CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            readOnly: true,
                            labelText: AppString.selectCountry,
                            hintText: AppString.country,
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.arrowDown),
                          ),
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColor.transparent,
                        ),
                        hint: 'Country',
                        value: "India",
                        dropdownItems: [
                          "India",
                          "Austraila",
                          "England",
                          "New York",
                          "Japan"
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: AppString.description,
                  keyboardType: TextInputType.name,
                  maxLines: 5,
                  minLines: 5,
                  hintText: AppString.enterDescription,
                ),
                CommonAppBtn(
                  title: AppString.next,
                  onTap: () => toNamed(context, Routes.addPropertyInfo),
                )
              ],
            ),
          ],
        ),
      ),
    ]))));
  }
}
