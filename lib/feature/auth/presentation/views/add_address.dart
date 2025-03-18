import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_text_field.dart';

import '../../../../core/utils/routing/routes.dart';

class AddAddressView extends ConsumerWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addAddress),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 2,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            yHeight(20.sp),
            Padding(
              padding: const EdgeInsets.all(16),
              child: formsFieldsSection(),
            ),
            CommonAppBtn(
              title: AppString.saveAndContinue,
              margin: const EdgeInsets.all(16),
              onTap: () => toNamed(context, Routes.uploadDocument),
            )
          ],
        ),
      ),
    );
  }
}

Widget formsFieldsSection() {
  return Column(
    spacing: 8.sp,
    children: [
      //EMAIL ADDRESS
      CustomTextField(
        hintText: AppString.enterAddress,
        prefixIcon: SvgPicture.asset(Assets.location),
        controller: TextEditingController(),
        labelText: AppString.address,
      ),

      //PASSWORD

      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var isVisible = ref.watch(isPswdVisible);
        return CustomDropdownButton(
          customBtn: IgnorePointer(
            child: CustomTextField(
              readOnly: true,
              labelText: AppString.city,
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
        );
      }),
      // Confirm PASSWORD
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          // var isVisible = ref.watch(isConfirmPswdVisible);
          return CustomDropdownButton(
            customBtn: IgnorePointer(
              child: CustomTextField(
                labelText: AppString.state,
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
          );
        },
      ),
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var isVisible = ref.watch(isConfirmPswdVisible);
        return CustomDropdownButton(
          customBtn: IgnorePointer(
            child: CustomTextField(
              labelText: AppString.country,
              hintText: AppString.selectCountry,
              controller: TextEditingController(),
              prefixIcon: SvgPicture.asset(Assets.global),
              suffixIcon: SvgPicture.asset(Assets.arrowDown),
            ),
          ),
          buttonDecoration: BoxDecoration(
            color: AppColor.transparent,
          ),
          hint: 'Global',
          value: "India",
          dropdownItems: ["India", "US", "melbran", "Houston", "Miami"],
          onChanged: (String? value) {},
        );
      }),
    ],
  );
}
