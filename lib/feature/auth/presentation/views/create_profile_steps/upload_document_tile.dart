import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';

import '../../../../z_common_widgets/app_text.dart';

class UploadDocumentTile extends StatelessWidget {
  const UploadDocumentTile(
      {super.key,
      required this.title,
      required this.subTitle,
      this.filePath,
      this.isFromNetwork,
      this.iconWidget,
      this.assetSize,
      this.onTap});

  final String title;
  final String subTitle;
  final String? filePath;
  final bool? isFromNetwork;
  final Widget? iconWidget;
  final Function()? onTap;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: screenHeight(context) / 4.4,
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
            color: AppColor.orangeF285000F,
            borderRadius: BorderRadius.circular(12.sp),
            border: Border(),
            image: (filePath != null && (filePath?.isNotEmpty ?? false))
                ? (isFromNetwork ?? false)
                    ? DecorationImage(
                        image: NetworkImage(filePath!),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
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
                  if (iconWidget != null) ...{iconWidget!} else
                    SvgPicture.asset(
                      Assets.upload,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  yHeight(10),
                  AppText(
                    text: title.tr(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: AppFonts.satoshiMedium,
                  ),
                  yHeight(10),
                  AppText(
                    text: subTitle.tr(),
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
