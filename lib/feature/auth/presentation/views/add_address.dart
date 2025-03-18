import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_text_field.dart';

class AddAddressView extends ConsumerWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomAppBar(title: AppString.addAddress),
            yHeight(context.height * 0.03),
            formsFieldsSection(),
          ],
        ),
      ),
    );
  }
}

Widget formsFieldsSection() {
  return Column(
    children: [
      //EMAIL ADDRESS
      CustomTextField(
        hintText: AppString.enterAddress,
        prefixIcon: SvgPicture.asset(Assets.location),
        controller: TextEditingController(),
        labelText: AppString.address,
      ),
      10.verticalSpace,
      //PASSWORD

      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var isVisible = ref.watch(isPswdVisible);
        return CustomTextField(
          labelText: AppString.city,
          hintText: AppString.selectCity,
          controller: TextEditingController(),
          prefixIcon: SvgPicture.asset(Assets.city),
        );
      }),
      // Confirm PASSWORD
      10.verticalSpace,
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var isVisible = ref.watch(isConfirmPswdVisible);
        return CustomTextField(
            labelText: AppString.state,
            hintText: AppString.selectSate,
            controller: TextEditingController(),
            prefixIcon: SvgPicture.asset(Assets.state),
            suffixIcon: CustomDropdown(
              hintText: 'city',
              iconPath: Assets.arrowDown,
              items: ["New York", "Los Angeles", "Chicago", "Houston", "Miami"],
              onChanged: (value) {
                print("Selected City: $value");
              },
            ));
      }),
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var isVisible = ref.watch(isConfirmPswdVisible);
        return CustomTextField(
          labelText: AppString.country,
          hintText: AppString.selectCountry,
          controller: TextEditingController(),
          prefixIcon: SvgPicture.asset(Assets.global),
        );
      })
    ],
  );
}
