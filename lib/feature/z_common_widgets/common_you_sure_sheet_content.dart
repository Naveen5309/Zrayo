import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class CommonYouSureSheetContent extends StatelessWidget {
  final VoidCallback onYes;

  const CommonYouSureSheetContent({super.key, required this.onYes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.questionIcon,
            // height: 105,
            // width: 114,
          ),
          yHeight(context.height * 0.03),
          AppText(
            text: AppString.areYouSure,
            fontFamily: AppFonts.satoshiBold,
            textSize: 22.sp,
            textAlign: TextAlign.center,
          ),
          yHeight(context.height * 0.02),
          AppText(
            text: AppString.doYouWantToMarkPropertyAsSold,
            textAlign: TextAlign.center,
            color: AppColor.grey646464,
          ),
          yHeight(context.height * 0.03),
          Padding(
            padding: EdgeInsets.only(bottom: context.height * .02),
            child: Row(
              children: [
                //CANCEL
                Expanded(
                  child: CommonAppBtn(
                    textColor: AppColor.primary,
                    backGroundColor: AppColor.secondry,
                    onTap: () {
                      back(context);
                    },
                    title: AppString.no,
                    borderColor: AppColor.transparent,
                    width: context.width,
                  ),
                ),
                xWidth(context.width / 18),

                //CONFIRM
                Expanded(
                  child: CommonAppBtn(
                    onTap: onYes,
                    title: AppString.yes,
                    width: context.width,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
