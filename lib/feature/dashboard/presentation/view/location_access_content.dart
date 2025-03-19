import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

class LocationAccessContent extends StatelessWidget {
  const LocationAccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              text: AppString.allow,
              style: TextStyle(
                  fontSize: 18.sp, fontFamily: AppFonts.satoshiMedium),
              children: [
                TextSpan(
                  text: AppString.zrayoText,
                  style: TextStyle(
                      fontSize: 18.sp, fontFamily: AppFonts.satoshiBold),
                ),
                TextSpan(
                  text: AppString.accessDeviceLocation,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshiMedium,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
          yHeight(30),
          SvgPicture.asset(Assets.mapLocation),
          yHeight(20),
          CommonAppBtn(
            onTap: () {
              back(context);
            },
            title: AppString.enableLocation,
            backGroundColor: AppColor.primary,
          ),
          yHeight(10),
          CommonAppBtn(
            onTap: () => back(context),
            title: AppString.deny,
            textColor: AppColor.primary,
            backGroundColor: AppColor.orangeF285000F,
            borderColor: AppColor.transparent,
          ),
        ],
      ),
    );
  }
}
