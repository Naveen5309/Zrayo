import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Notification"),
          yHeight(10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                return notificationBox();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget notificationBox() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: AppColor.colorF3F3F3),
      child: Row(
        children: [
          CustomCacheNetworkImage(
            img: "",
            imageRadius: 100,
            size: 44.sp,
          ),
          xWidth(10),
          Expanded(
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: "Your training with “",
                    style: TextStyle(
                        // color: AppColor.black4A4A4A,
                        fontFamily: AppFonts.satoshiMedium),
                    children: [
                      TextSpan(
                        text: "MAGGIE",
                        style: TextStyle(
                          // color: AppColor.primary,
                          fontFamily: AppFonts.satoshiBold,
                        ),
                      ),
                      TextSpan(
                        text: "” has been scheduled successfully.",
                        style: TextStyle(
                          // color: AppColor.primary,
                          fontFamily: AppFonts.satoshiMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                AppText(
                  text: "1 week ago".tr(),
                  fontFamily: AppFonts.satoshiBold,
                  textSize: 12.sp,
                ).align(alignment: Alignment.centerRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
