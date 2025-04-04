import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/add_address_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/create_profile_notifiers.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddAddressView extends ConsumerWidget {
  final bool fromSettings;

  const AddAddressView({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addAddressProvider);
    final addAddressNotifier = ref.read(addAddressProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                title: fromSettings ? AppString.address : AppString.addAddress),
            yHeight(10.sp),
            fromSettings
                ? SizedBox()
                : Container(
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
              child: formsFieldsSection(addAddressNotifier),
            ),
            // if (fromSettings)
            yHeight(context.height / 4.5),
            CommonAppBtn(
              title:
                  fromSettings ? AppString.update : AppString.saveAndContinue,
              margin: const EdgeInsets.all(16),
              onTap: () => fromSettings
                  ? back(context)
                  :
                  //  addAddressNotifier.addAddressValidator(context)
                  toNamed(context, Routes.uploadDocument),
            )
          ],
        ),
      ),
    );
  }
}

Widget formsFieldsSection(CreateProfileNotifiers addAddressNotifier) {
  return Column(
    spacing: 8.sp,
    children: [
      //EMAIL ADDRESS
      CustomTextField(
        hintText: AppString.enterAddress,
        prefixIcon: SvgPicture.asset(Assets.location),
        controller: addAddressNotifier.addressController,
        labelText: AppString.address,
      ),

      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        printLog(
            "addAddressNotifier.countries.length-==>${addAddressNotifier.countries.length}");
        return CustomDropdownButton(
          customBtn: IgnorePointer(
            child: CustomTextField(
              labelText: AppString.country,
              hintText: AppString.selectCountry,
              controller: addAddressNotifier.countryController,
              prefixIcon: SvgPicture.asset(Assets.global),
              suffixIcon: SvgPicture.asset(Assets.arrowDown),
            ),
          ),
          buttonDecoration: BoxDecoration(
            color: AppColor.transparent,
          ),
          hint: 'Global',
          value: addAddressNotifier.countryController.text.isNotEmpty
              ? addAddressNotifier.countryController.text
              : null,
          dropdownItems:
              addAddressNotifier.countries.map((e) => e.name).toList(),
          onChanged: (String? value) {
            if (value != null) {
              addAddressNotifier.selectCountry(value);
            }
          },
        );
      }),
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          // var isVisible = ref.watch(isConfirmPswdVisible);
          return CustomDropdownButton(
            customBtn: IgnorePointer(
              child: CustomTextField(
                labelText: AppString.state,
                hintText: AppString.selectSate,
                controller: addAddressNotifier.stateController,
                prefixIcon: SvgPicture.asset(Assets.state),
                suffixIcon: SvgPicture.asset(Assets.arrowDown),
              ),
            ),
            buttonDecoration: BoxDecoration(
              color: AppColor.transparent,
            ),
            hint: 'State',
            value: addAddressNotifier.stateController.text.isNotEmpty
                ? addAddressNotifier.stateController.text
                : null,
            dropdownItems:
                addAddressNotifier.filteredStates.map((e) => e.name).toList(),
            onChanged: (String? value) {
              if (value != null) {
                addAddressNotifier.selectState(value);
              }
            },
          );
        },
      ),
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return CustomDropdownButton(
          customBtn: IgnorePointer(
            child: CustomTextField(
              readOnly: true,
              labelText: AppString.city,
              hintText: AppString.selectCity,
              controller: addAddressNotifier.cityController,
              prefixIcon: SvgPicture.asset(Assets.city),
              suffixIcon: SvgPicture.asset(Assets.arrowDown),
            ),
          ),
          buttonDecoration: BoxDecoration(
            color: AppColor.transparent,
          ),
          hint: 'City',
          value: addAddressNotifier.cityController.text.isNotEmpty
              ? addAddressNotifier.cityController.text
              : null,
          dropdownItems:
              addAddressNotifier.filteredCities.map((e) => e.name).toList(),
          onChanged: (String? value) {
            if (value != null) {
              addAddressNotifier.cityController.text = value;
            }
          },
        );
      }),
    ],
  );
}
