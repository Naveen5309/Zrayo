import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/verify_email_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

import '../../../../config/assets.dart';

class OtpVerificationView extends ConsumerWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyEmailNotifier = ref.read(verifyEmailProvider.notifier);
    ref.watch(verifyEmailProvider);
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColor.primary),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: focusedPinTheme.decoration,
    );
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: ""),
          yHeight(15.sp),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.otpView),
                    yHeight(15.sp),
                    AppText(
                      text: AppString.otpVerification,
                      textSize: 24.sp,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    yHeight(10.sp),
                    AppText(
                      text: AppString.pleaseEnterYourOtpCodeSentToYour,
                      fontFamily: AppFonts.satoshiRegular,
                      textAlign: TextAlign.center,
                      lineHeight: 1.2,
                    ),
                    yHeight(20.sp),
                    Pinput(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      controller: verifyEmailNotifier.otpController,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      cursor: Container(
                        height: 17.h,
                        width: 1,
                        color: AppColor.primary,
                      ),
                      showCursor: true,
                      onCompleted: (pin) => printLog(pin),
                    ),
                    yHeight(20.sp),
                    AppText(
                      text: AppString.didNotReceiveTheOtp,
                      fontFamily: AppFonts.satoshiRegular,
                    ),
                    yHeight(5.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: AppString.youCanResendOtpIn,
                          fontFamily: AppFonts.satoshiRegular,
                        ),
                        AppText(
                          text: " 9:30",
                          fontFamily: AppFonts.satoshiBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          CommonAppBtn(
            margin: EdgeInsets.all(16.0),
            title: AppString.verify,
            onTap: () =>
                // verifyEmailNotifier.verifyEmailValidator(context)
                toNamed(context, Routes.changePasswordView),
          )
        ],
      ),
    );
  }
}
