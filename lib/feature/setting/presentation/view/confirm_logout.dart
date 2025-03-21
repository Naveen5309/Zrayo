import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class LogoutConfirmationView extends StatelessWidget {
  const LogoutConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.logoutConfirm,
              height: 105,
              width: 114,
            ),
            yHeight(context.height * 0.03),

            AppText(
              text: AppString.logout,
              fontFamily: AppFonts.satoshiBold,
              textSize: 24.sp,
              textAlign: TextAlign.center,
            ),
            yHeight(context.height * 0.02),
            AppText(
              text: AppString.areYouSureLogOut,
              textAlign: TextAlign.center,
              color: AppColor.grey646464,
            ),
            yHeight(context.height * 0.03),
            yHeight(20),
            // CommonAppBtn(
            //   onTap: () => back(context),
            //   title: AppString.deny,
            //   textColor: AppColor.primary,
            //   backGroundColor: AppColor.secondry,
            //   borderColor: AppColor.transparent,
            // ),
            // yHeight(15),
            //
            // CommonAppBtn(
            //   onTap: () {
            //     back(context);
            //   },
            //   title: AppString.enableLocation,
            //   backGroundColor: AppColor.primary,
            // ),

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
                        Navigator.pop(context);
                      },
                      title: AppString.cancel,
                      borderColor: AppColor.transparent,
                      width: context.width,
                    ),
                  ),
                  xWidth(context.width / 18),

                  //CONFIRM
                  Expanded(
                    child: CommonAppBtn(
                      onTap: () {
                        offAllNamed(context, Routes.chooseInterfaceView);
                        toast(
                            msg: "User successfully logged out",
                            isError: false);
                      },
                      title: AppString.logout,
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
            yHeight(20)
          ],
        ),
      ),
    );
  }
}
