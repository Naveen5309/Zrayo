import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool? centerTitle;
  final bool isFromHome;
  final bool? showNotificationIcon;
  final bool? showBackButton;
  final VoidCallback? onBackIconTap;
  final Widget? action;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.centerTitle,
    this.showBackButton = true,
    this.isFromHome = false,
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      textSize: 22.sp,
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
                        ? notificationIcon(context)
                        : xWidth(30)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => toNamed(context, Routes.notificationView),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isFromHome ? AppColor.primaryEC9529 : AppColor.secondry,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
                isFromHome ? Assets.bellRinging : Assets.bellRinging1),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isFromHome ? AppColor.whiteFFFFFF : AppColor.primary,
              ),
              child: AppText(
                text: "3",
                textSize: 10.sp,
                color:
                    !isFromHome ? AppColor.whiteFFFFFF : AppColor.black000000,
              ).align(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget backIcon(
    {VoidCallback? onBackIconTap,
    required BuildContext context,
    ColorFilter? colorFilter}) {
  return GestureDetector(
    onTap: onBackIconTap ?? () => back(context),
    child: SvgPicture.asset(
      Assets.backBtn,
      colorFilter: colorFilter,
    ),
  );
}
