import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/create_profile_notifiers.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/create_profile_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_drop_down.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class AddAddressView extends ConsumerWidget {
  final bool fromSettings;

  const AddAddressView({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addAddressState = ref.watch(createProfileProvider);
    final addAddressNotifier = ref.read(createProfileProvider.notifier);
    ref.listen<CreateProfileStates>(createProfileProvider, (previous, next) {
      if (next is AddressSuccess) {
        fromSettings ? back(context) : toNamed(context, Routes.uploadDocument);
      } else if (next is CreateProfileFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                title: fromSettings
                    ? AppString.address.tr()
                    : AppString.addAddress.tr()),
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
            yHeight(context.height / 5),
            CommonAppBtn(
                title: fromSettings
                    ? AppString.update.tr()
                    : AppString.saveAndContinue.tr(),
                margin: const EdgeInsets.all(16),
                loading: addAddressState is CreateProfileApiLoading &&
                    addAddressState.route == Routes.addAddressView,
                onTap: () =>
                    addAddressNotifier.addAddressValidator(fromSettings))
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
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ref.watch(createProfileProvider);
        return CustomTextField(
          hintText: AppString.enterAddress.tr(),
          prefixIcon: SvgPicture.asset(Assets.location),
          controller: addAddressNotifier.addressController,
          labelText: AppString.address.tr(),
        );
      }),

      CustomDropdownButton(
        customBtn: IgnorePointer(
          child: CustomTextField(
            labelText: AppString.country.tr(),
            hintText: AppString.selectCountry.tr(),
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
        dropdownItems: addAddressNotifier.countries.map((e) => e.name).toList(),
        onChanged: (String? value) {
          if (value != null) {
            addAddressNotifier.selectCountry(value);
          }
        },
      ),
      CustomDropdownButton(
        customBtn: IgnorePointer(
          child: CustomTextField(
            labelText: AppString.state.tr(),
            hintText: AppString.selectSate.tr(),
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
      ),
      CustomDropdownButton(
        customBtn: IgnorePointer(
          child: CustomTextField(
            readOnly: true,
            labelText: AppString.city.tr(),
            hintText: AppString.selectCity.tr(),
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
      ),
    ],
  );
}
