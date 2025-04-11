import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zrayo_flutter/config/helper.dart';

import '../../config/assets.dart';
import 'app_text.dart';

class CameraBottomSheetView extends StatelessWidget {
  const CameraBottomSheetView(
      {super.key, required this.onGetImage, required this.title});

  final Function(CroppedFile value) onGetImage;
  final String title;

  /// used to get the image .
  static Future<CroppedFile?> getImage({int source = 1}) async {
    CroppedFile? croppedFile;
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: source == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      final image = File(pickedFile.path);

      croppedFile = await ImageCropper().cropImage(
        compressQuality: 40,
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              initAspectRatio: CropAspectRatioPreset.original,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
        ],
      );
    }

    return croppedFile;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.sp,
      children: [
        yHeight(0.sp),
        Align(
          alignment: Alignment.center,
          child: AppText(
            text: title.tr(),
            maxlines: 1,
            textAlign: TextAlign.center,
            textSize: 23.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
        ),
        yHeight(0.sp),
        InkWell(
          onTap: () async {
            back(context);
            await getImage().then((v) {
              if (v != null) {
                onGetImage(v);
              }
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 18.sp,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.orangeFff9f0),
                    child: SvgPicture.asset(
                      Assets.camera,
                    ),
                  ),
                  AppText(
                    text: AppString.takePhoto.tr(),
                    textAlign: TextAlign.center,
                    fontFamily: AppFonts.satoshiMedium,
                    maxlines: 1,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.sp,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            back(context);
            await getImage(source: 2).then((v) {
              if (v != null) {
                onGetImage(v);
              }
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 18.sp,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.orangeFff9f0),
                    child: SvgPicture.asset(
                      Assets.gallery,
                      // colorFilter: ColorFilter.mode(
                      // context.textTheme.labelMedium!.color!
                      //     .withValues(alpha: .50),
                      //   BlendMode.srcIn,
                      // ),
                    ),
                  ),
                  AppText(
                    text: AppString.uploadFromGallery.tr(),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    maxlines: 1,
                    // color: context.textTheme.labelMedium?.color
                    //     ?.withValues(alpha: .50),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                // color: context.textTheme.labelMedium?.color
                //     ?.withValues(alpha: .30),
                size: 15.sp,
              ),
            ],
          ),
        ),
        yHeight(0.sp),
      ],
    );
  }
}
