import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_text_field.dart';

import '../../../../../config/assets.dart';
import '../../../../common_widgets/camera_bottom_sheet_view.dart';
import '../../../../common_widgets/custom_cache_network_image.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: AppString.createProfile),
              Container(
                height: 7,
                color: AppColor.primary,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10.sp,
                  children: [
                    yHeight(30.sp),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 100.sp,
                        width: 100.sp,
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
                            CustomCacheNetworkImage(
                              img: '',
                              size: 100.sp,
                              imageRadius: 100.sp,
                            ),
                            // },
                            Positioned(
                              bottom: 0,
                              right: -10,
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
                                      borderRadius: BorderRadius.circular(100),
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
                    yHeight(0),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                              prefixIcon: SvgPicture.asset(Assets.person),
                              labelText: AppString.firstName,
                              hintText: AppString.enterFirstName,
                            )),
                        xWidth(20),
                        Expanded(
                            child: CustomTextField(
                              prefixIcon: SvgPicture.asset(Assets.person),
                              labelText: AppString.lastName,
                              hintText: AppString.enterLastName,
                            )),
                      ],
                    ),
                    CustomTextField(
                      prefixIcon: SvgPicture.asset(Assets.calling),
                      labelText: AppString.mobileNumber,
                      keyboardType: TextInputType.phone,
                      hintText: AppString.enterPhoneNumber,
                    ),
                    CustomTextField(
                      prefixIcon: SvgPicture.asset(Assets.cake),
                      readOnly: true,
                      labelText: AppString.dateOfBirth,
                      hintText: "DD/MM/YYYY",
                    ),
                    CustomTextField(
                      prefixIcon: SvgPicture.asset(Assets.cake),
                      labelText: AppString.ninNumberOrBvnNumber,
                      keyboardType: TextInputType.number,
                      hintText: AppString.enterNinNumberOrBvnNumber,
                    ),
                  ],
                ),
              ),
              yHeight(60.sp),
              CommonAppBtn(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                title: AppString.saveAndContinue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
