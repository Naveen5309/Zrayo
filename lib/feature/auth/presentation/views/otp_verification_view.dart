import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../../config/assets.dart';
import '../provider/auth_provider.dart';

class OtpVerificationView extends ConsumerStatefulWidget {
  const OtpVerificationView({super.key});

  @override
  OtpVerificationViewState createState() => OtpVerificationViewState();
}

class OtpVerificationViewState extends ConsumerState<OtpVerificationView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(authProvider.notifier).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final verifyEmailNotifier = ref.read(authProvider.notifier);
    final verifyEmailState = ref.watch(authProvider.notifier);

    ref.listen<LoginState>(authProvider, (previous, next) {
      if (next is OtpVerifySuccess) {
        toNamed(context, Routes.changePasswordView);
        verifyEmailState.cancelTimer();
      } else if (next is LoginFailed) {
        toast(msg: next.error, isError: true);
      }
    });

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
                      textSize: 22.sp,
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
                        verifyEmailState.enableResend
                            ? const SizedBox()
                            : Consumer(builder: (BuildContext context,
                                WidgetRef ref, Widget? child) {
                                final loginState = ref.watch(authProvider);
                                final loginNotifier =
                                    ref.read(authProvider.notifier);

                                if (loginState is UpdateTimer) {
                                  return loginState.enableResend
                                      ? GestureDetector(
                                          onTap: () {
                                            loginNotifier.cancelTimer();
                                            loginNotifier.startTimer();
                                          },
                                          child: AppText(
                                            text: "Resend OTP",
                                            textSize: 14.sp,
                                            fontFamily: AppFonts.satoshiBold,
                                            color: AppColor.black000000,
                                          ),
                                        )
                                      : AppText(
                                          text:
                                              ' (00:${loginState.secondsRemaining})',
                                          textSize: 14.sp,
                                          fontFamily: AppFonts.satoshiBold,
                                          color: AppColor.black000000,
                                        );
                                }

                                return const SizedBox.shrink();
                              }),
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
              loading: verifyEmailState is LoginApiLoading,
              onTap: () =>
                  // toNamed(context, Routes.changePasswordView))
                  verifyEmailNotifier.verifyEmailValidator(context))
        ],
      ),
    );
  }
}
