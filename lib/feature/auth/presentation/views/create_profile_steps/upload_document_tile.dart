import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';

import '../../../../common_widgets/app_text.dart';

class UploadDocumentTile extends StatelessWidget {
  const UploadDocumentTile(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isUploadedView = false,
      this.contentPadding,
      this.filePath,
      this.assetSize,
      this.height,
      required this.onTap});

  final String title;
  final String subTitle;
  final String? filePath;
  final Function() onTap;
  final bool isUploadedView;
  final double? assetSize;
  final double? height;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? screenHeight(context) / 4.4,
        padding: contentPadding ?? EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
            color: AppColor.orangeF285000F,
            borderRadius: BorderRadius.circular(12.sp),
            border: Border(),
            image: (filePath != null && (filePath?.isNotEmpty ?? false))
                ? DecorationImage(
                    image: FileImage(File(filePath!)),
                    fit: BoxFit.cover,
                  )
                : null),
        child: (filePath != null && (filePath?.isNotEmpty ?? false))
            ? null
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.upload,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                    // colorFilter: isUploadedView
                    //     ? null
                    //     : ColorFilter.mode(context.textTheme.labelSmall!.color!,
                    //         BlendMode.srcIn),
                  ),
                  // isUploadedView ? Dimens.box8 : Dimens.box16,
                  yHeight(10),

                  AppText(
                    text: title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: AppFonts.satoshiMedium,
                  ),

                  yHeight(10),

                  AppText(
                    text: subTitle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: AppFonts.satoshiMedium,
                    color: AppColor.orange878787,
                    maxlines: 2,
                  ),
                ],
              ),
      ),
    );
  }
}
