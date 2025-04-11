import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

class CustomRatingBox extends StatelessWidget {
  final String rating;
  const CustomRatingBox({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.colorFEF6EC,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Icon(
              Icons.star,
              size: 15,
              color: AppColor.primary,
            ),
          ),
          AppText(
            text: rating.tr(),
            textSize: 10.sp,
          ).align(),
        ],
      ),
    );
  }
}
