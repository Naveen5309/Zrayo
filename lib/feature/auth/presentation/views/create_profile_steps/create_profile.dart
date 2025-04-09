import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/create_profile_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/camera_bottom_sheet_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class CreateProfile extends ConsumerWidget {
  final bool fromSettings;

  const CreateProfile({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProfileState = ref.watch(createProfileProvider);
    final createProfileNotifier = ref.read(createProfileProvider.notifier);

    ref.listen<CreateProfileStates>(createProfileProvider, (previous, next) {
      if (next is CreateProfileSuccess) {
        fromSettings ? back(context) : toNamed(context, Routes.addAddressView);
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
                    ? AppString.personalDetails
                    : AppString.createProfile),
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
                          width: (screenWidth(context) / 5),
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
                      yHeight(10.sp),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 125.sp,
                          width: 125.sp,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (createProfileNotifier.pickedImage?.path !=
                                      null &&
                                  (createProfileNotifier
                                          .pickedImage?.path.isNotEmpty ??
                                      false)) ...{
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(createProfileNotifier
                                            .pickedImage?.path ??
                                        ""),
                                    height: 120.sp,
                                    width: 120.sp,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              } else ...{
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomCacheNetworkImage(
                                    img:
                                        createProfileNotifier.profileImageUrl ??
                                            "",
                                    size: 120.sp,
                                    imageRadius: 100.sp,
                                  ),
                                ),
                              },
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    Utils.appBottomSheet(
                                      widget: CameraBottomSheetView(
                                        onGetImage: (value) {
                                          createProfileNotifier
                                              .changeProfileImage(value);
                                        },
                                        title: "Upload profile image",
                                      ),
                                      context: context,
                                    );
                                  },
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        Assets.upload,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      yHeight(10),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                            prefixIcon: SvgPicture.asset(
                              Assets.person,
                            ),
                            labelText: AppString.firstName,
                            keyboardType: TextInputType.name,
                            controller:
                                createProfileNotifier.firstNameController,
                            hintText: AppString.enterFirstName,
                            contentPadding: EdgeInsets.all(2),
                          )),
                          xWidth(20),
                          Expanded(
                              child: CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.person),
                            labelText: AppString.lastName,
                            contentPadding: EdgeInsets.all(2),
                            controller:
                                createProfileNotifier.lastNameController,
                            hintText: AppString.enterLastName,
                          )),
                        ],
                      ),
                      CustomTextField(
                        prefixIcon: SvgPicture.asset(Assets.calling),
                        labelText: AppString.mobileNumber,
                        keyboardType: TextInputType.phone,
                        // maxLength: 10,
                        controller: createProfileNotifier.phoneController,
                        hintText: AppString.enterPhoneNumber,
                      ),
                      CustomTextField(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate:
                                DateTime.now().subtract(Duration(days: 1)),
                            firstDate: DateTime(1970, 8),
                            lastDate:
                                DateTime.now().subtract(Duration(days: 1)),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: AppColor.primary,
                                  hintColor: AppColor.primary,
                                  colorScheme: const ColorScheme.light(
                                      primary: AppColor.primary),
                                  buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (picked != null) {
                            createProfileNotifier.dobController.text =
                                formatDOBDDMMYYYY(picked);
                          }
                        },
                        prefixIcon: SvgPicture.asset(Assets.cake),
                        readOnly: true,
                        labelText: AppString.dateOfBirth,
                        hintText: "DD/MM/YYYY",
                        controller: createProfileNotifier.dobController,

                        // labelText: AppString.confirmPswd,
                      ),
                      CustomTextField(
                        prefixIcon: SvgPicture.asset(Assets.barcode),
                        labelText: AppString.ninNumberOrBvnNumber,
                        keyboardType: TextInputType.number,
                        controller: createProfileNotifier.ninNumberController,
                        hintText: AppString.enterNinNumberOrBvnNumber,
                      ),
                    ],
                  ),
                  yHeight(20),
                  CommonAppBtn(
                      title: fromSettings
                          ? AppString.update
                          : AppString.saveAndContinue,
                      loading: createProfileState is CreateProfileApiLoading &&
                          createProfileState.route == Routes.createProfile,
                      onTap: () => createProfileNotifier.createProfileValidator(
                          context,
                          isUpdateCall: fromSettings)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
