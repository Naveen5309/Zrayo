import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

class ProfileCard extends StatelessWidget {
  final String? name;
  final String? email;
  final String imageUrl;
  final double? size;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? borderColor;
  final double? thickness;

  const ProfileCard({
    super.key,
    this.name,
    this.email,
    this.size,
    this.textColor,
    required this.imageUrl,
    this.onTap,
    this.borderColor,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(thickness ?? 6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: borderColor ?? AppColor.whiteFFFFFF.withAlpha(33),
                  border: Border.all(color: AppColor.greyEAEAEA)),
              child: CustomCacheNetworkImage(
                  img: imageUrl, imageRadius: 50, height: 90.sp, width: 90.sp)),

          5.verticalSpace,
          // Name and email below
          name != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: name ?? "",
                      textSize: size ?? 16.sp,
                      color: textColor,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                  ],
                )
              : const SizedBox(),
          yHeight(5),

          email != null
              ? AppText(
                  text: email ?? "",
                  textSize: 12.sp,
                  fontFamily: AppFonts.satoshiRegular,
                  color: AppColor.grey646464,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
