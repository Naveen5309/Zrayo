import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/common_widgets/app_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? centerTitle;
  final bool? showBackButton;
  final VoidCallback? onBackIconTap;
  final Widget? action;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle,
    this.showBackButton = true,
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
                AppText(
                  text: title,
                  fontFamily: AppFonts.satoshiBold,
                  textSize: 20.sp,
                ),
                action ?? xWidth(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget backIcon({VoidCallback? onBackIconTap, required BuildContext context}) {
  return GestureDetector(
    onTap: onBackIconTap ?? () => back(context),
    child: SvgPicture.asset(Assets.backBtn),
  );
}
