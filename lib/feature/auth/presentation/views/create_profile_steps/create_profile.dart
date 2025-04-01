import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/camera_bottom_sheet_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class CreateProfile extends ConsumerWidget {
  final bool fromSettings;
  const CreateProfile({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProfileNotifier = ref.read(createProfileProvider.notifier);

    ref.watch(createProfileProvider);
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
                              // if (createProfileController.pickedImage?.path != null &&
                              //     (createProfileController.pickedImage?.path.isNotEmpty ??
                              //         false)) ...{
                              //   ClipRRect(
                              //     borderRadius: BorderRadius.circular(Dimens.hundred),
                              //     child: Image.file(
                              //       File(createProfileController.pickedImage?.path ?? ""),
                              //       height: Dimens.hundred,
                              //       width: Dimens.hundred,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   )
                              // } else ...{
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomCacheNetworkImage(
                                  img: '',
                                  size: 120.sp,
                                  imageRadius: 100.sp,
                                ),
                              ),
                              // },
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    Utils.appBottomSheet(
                                      widget: CameraBottomSheetView(
                                        onGetImage: (value) {},
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
                            prefixIcon: SvgPicture.asset(Assets.person),
                            labelText: AppString.firstName,
                            controller:
                                createProfileNotifier.firstNameController,
                            hintText: AppString.enterFirstName,
                          )),
                          xWidth(20),
                          Expanded(
                              child: CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.person),
                            labelText: AppString.lastName,
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
                        controller: createProfileNotifier.phoneController,
                        hintText: AppString.enterPhoneNumber,
                      ),
                      CustomTextField(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1970, 8),
                            lastDate: DateTime.now(),
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
                                formatDOB(picked);
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
                  CommonAppBtn(
                    title: fromSettings
                        ? AppString.update
                        : AppString.saveAndContinue,
                    onTap: () => fromSettings
                        ? back(context)
                        :
                        // createProfileNotifier
                        // .createProfileValidator(context)
                        toNamed(context, Routes.addAddressView),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
