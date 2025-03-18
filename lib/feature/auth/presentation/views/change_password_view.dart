import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/assets.dart';
import '../../../../config/helper.dart';
import '../../../common_widgets/app_text.dart';
import '../../../common_widgets/custom_app_bar.dart';
import '../../../common_widgets/custom_btn.dart';
import '../../../common_widgets/custom_text_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: ""),
          yHeight(15.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.changePassIcon),
                yHeight(15.sp),
                AppText(
                  text: AppString.createNewPassword ,
                  textSize: 24.sp,
                  fontFamily: AppFonts.satoshiBold,
                ),
                yHeight(10.sp),
                AppText(
                  text: AppString.yourNewPasswordMustBeUnique,
                  fontFamily: AppFonts.satoshiRegular,
                  textAlign: TextAlign.center,
                  lineHeight: 1.2,
                ),
                yHeight(20.sp),

                CustomTextField(
                  onTapOnSuffixIcon: () {
                    // ref.read(isPassVisible.notifier).state =
                    // !ref.read(isPassVisible.notifier).state;
                  },
                  labelText: AppString.newPassword,
                  isObscure: false,
                  hintText: '********',
                  // controller: signUpNotifier.passwordController,
                  prefixIcon: SvgPicture.asset(Assets.lock),
                  suffixIcon: false
                      ? SvgPicture.asset(Assets.eye)
                      : SvgPicture.asset(
                    Assets.eyeOff,
                    colorFilter:
                    ColorFilter.mode(AppColor.black4A4A4A, BlendMode.srcIn),
                  ),
                ),
                // Confirm PASSWORD
                10.verticalSpace,
                CustomTextField(
                  onTapOnSuffixIcon: () {
                    // ref.read(isConfirmPassVisible.notifier).state =
                    // !ref.read(isConfirmPassVisible.notifier).state;
                  },
                  labelText: AppString.confirmPassword,
                  isObscure: true,
                  hintText: '********',
                  // controller: signUpNotifier.confirmPasswordController,
                  prefixIcon: SvgPicture.asset(Assets.lock),
                  suffixIcon: true
                      ? SvgPicture.asset(Assets.eye)
                      : SvgPicture.asset(
                    Assets.eyeOff,
                    colorFilter:
                    ColorFilter.mode(AppColor.black4A4A4A, BlendMode.srcIn),
                  ),
                )
              ],
            ),
          ),
          CommonAppBtn(
            margin: EdgeInsets.all(16.0),
            title: AppString.change,
          )
        ],
      ),
    );
  }
}
