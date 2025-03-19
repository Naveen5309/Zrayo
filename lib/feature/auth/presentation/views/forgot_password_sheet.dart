import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.mailImage),
            yHeight(15.sp),
            AppText(
              text: AppString.forgetPassword,
              textSize: 24.sp,
              fontFamily: AppFonts.satoshiBold,
            ),
            yHeight(10.sp),
            AppText(
              text: AppString.pleaseEnterEmailAddressAssociated,
              fontFamily: AppFonts.satoshiRegular,
              textAlign: TextAlign.center,
              lineHeight: 1.2,
            ),
            yHeight(10.sp),
            CustomTextField(
              hintText: AppString.exampleEamil,
              prefixIcon: SvgPicture.asset(Assets.email),
              controller: TextEditingController(),
              labelText: AppString.emailAddress,
            ),
            yHeight(10.sp),
            CommonAppBtn(
              title: AppString.submit,
              onTap: () {
                back(context);
                toNamed(context, Routes.otpVerificationView);
              },
            )
          ],
        ),
      ),
    );
  }
}
