import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/upload_document_tile.dart';

import '../../../../../config/app_utils.dart';
import '../../../../common_widgets/camera_bottom_sheet_view.dart';
import '../../../../common_widgets/common_dotted_border.dart';
import '../../../../common_widgets/custom_app_bar.dart';
import '../../../../common_widgets/custom_btn.dart';

class UploadDocument extends StatelessWidget {
  const UploadDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: AppString.uploadDocument),
            yHeight(10.sp),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 3,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    yHeight(40.sp),
                    CommonDottedBorder(
                      child: UploadDocumentTile(
                        isUploadedView: true,
                        filePath: "",
                        title: AppString.uploadIdentityDocument,
                        subTitle: AppString.frontSide,
                        onTap: () {
                          Utils.appBottomSheet(
                            widget: CameraBottomSheetView(
                              onGetImage: (value) {
                                // if (value.path.isNotEmpty) {
                                //   createProfileController
                                //       .documentFrontFile = value;
                                //   createProfileController.update();
                                // }
                              },
                              title: AppString.uploadFrontSide,
                            ),
                            context: context,
                          );
                        },
                      ),
                    ),
                    yHeight(40.sp),
                    CommonDottedBorder(
                      child: UploadDocumentTile(
                        isUploadedView: true,
                        filePath: "",
                        title: AppString.uploadIdentityDocument,
                        subTitle: AppString.backSide,
                        onTap: () {
                          Utils.appBottomSheet(
                            widget: CameraBottomSheetView(
                              onGetImage: (value) {
                                // if (value.path.isNotEmpty) {
                                //   createProfileController
                                //       .documentFrontFile = value;
                                //   createProfileController.update();
                                // }
                              },
                              title: AppString.uploadBackSide,
                            ),
                            context: context,
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    CommonAppBtn(
                      title: AppString.saveAndContinue,
                      onTap: () => toNamed(context, Routes.addBankDetail),
                    ),
                    yHeight(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
