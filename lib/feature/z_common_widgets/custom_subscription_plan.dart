import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String? trialText;
  final bool isSelected;
  final bool isHighlighted;
  final VoidCallback onTap;

  const PlanCard({super.key,
    required this.title,
    required this.price,
    required this.description,
    this.trialText,
    this.isSelected = false,
    this.isHighlighted = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: (isHighlighted) ? AppColor.orangeFFECD6 : AppColor.whiteFFFFFF,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.orange
                : AppColor.grey040F2529.withValues(alpha: .16),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    AppText(
                      text: price,
                      textSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppFonts.satoshiBold,
                      color: AppColor.black232323,
                    ),
                    if (isHighlighted)
                      AppText(
                        text: '/month',
                        fontFamily: AppFonts.satoshiMedium,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black232323,
                      ),
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: (isHighlighted)
                        ? AppColor.whiteFFFFFF
                        : AppColor.black000000,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: (isHighlighted)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          child: AppText(
                            text: title,
                            color: AppColor.primary,
                            textSize: 12.sp,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          child: AppText(
                              text: title,
                              fontFamily: AppFonts.satoshiMedium,
                              color: AppColor.whiteFFFFFF,
                              textSize: 12.sp),
                        ),
                ),
                Spacer(),
                (isSelected)
                    ? SvgPicture.asset(Assets.checkTrue)
                    : SvgPicture.asset(Assets.checkFalse)
              ],
            ),
            if (trialText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: AppText(
                  fontFamily: AppFonts.satoshiBold,
                  text: trialText!,
                  textSize: 11.sp,
                  color: AppColor.black232323,
                ),
              ),
            SizedBox(height: 10),
            AppText(
              text: description,
              color: AppColor.black4A4A4A,
              textSize: 13.sp,
              lineHeight: 1.1,
              fontFamily: AppFonts.satoshiMedium,
            ),
          ],
        ),
      ),
    );
  }
}
