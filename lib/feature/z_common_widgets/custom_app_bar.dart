import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/enums.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? notificationSvg;

  final bool? centerTitle;
  final bool? showNotificationIcon;
  final bool? showBackButton;
  final VoidCallback? onBackIconTap;
  final Widget? action;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.notificationSvg,
    this.centerTitle,
    this.showBackButton = true,
    this.showNotificationIcon = false,
    this.titleColor,
    this.onBackIconTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          yHeight(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showBackButton ?? false)
                  backIcon(onBackIconTap: onBackIconTap, context: context),
                if ((centerTitle ?? false) && !(showBackButton ?? false)) ...{
                  const SizedBox()
                },
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      fontFamily: AppFonts.satoshiBold,
                      textSize: 20.sp,
                      color: titleColor,
                    ),
                    if (subTitle != null) ...{
                      yHeight(3),
                      AppText(
                        text: subTitle ?? "",
                        fontFamily: AppFonts.satoshiMedium,
                        textSize: 12.sp,
                        color: titleColor,
                      ),
                    }
                  ],
                ),
                action ??
                    ((showNotificationIcon ?? false)
                        ? notificationIcon()
                        : xWidth(30)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationIcon() {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: AppColor.primaryEC9529, shape: BoxShape.circle),
            child: SvgPicture.asset(notificationSvg ?? Assets.bellRinging1)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.whiteFFFFFF,
            ),
            child: AppText(
              text: "3",
              textSize: 10.sp,
            ).align(),
          ),
        ),
      ],
    );
  }
}

Widget backIcon({VoidCallback? onBackIconTap, required BuildContext context}) {
  return GestureDetector(
    onTap: onBackIconTap ?? () => back(context),
    child: SvgPicture.asset(Assets.backBtn),
  );
}
