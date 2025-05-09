import 'package:easy_localization/easy_localization.dart';
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
      var auth = ref.read(authProvider.notifier);
      auth.secondsRemaining = 60;
      auth.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final verifyEmailNotifier = ref.read(authProvider.notifier);
    final verifyEmailState = ref.watch(authProvider);
    ref.listen<LoginState>(authProvider, (previous, next) {
      if (next is OtpVerifySuccess) {
        toNamed(context, Routes.changePasswordView);
        verifyEmailNotifier.cancelTimer();
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
          CustomAppBar(
            title: "",
            onBackIconTap: () {
              verifyEmailNotifier.cancelTimer();
              back(context);
            },
          ),
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
                      text: AppString.otpVerification.tr(),
                      textSize: 22.sp,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    yHeight(10.sp),
                    AppText(
                      text: AppString.pleaseEnterYourOtpCodeSentToYour.tr(),
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
                      text: AppString.didNotReceiveTheOtp.tr(),
                      fontFamily: AppFonts.satoshiRegular,
                    ),
                    yHeight(5.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: AppString.youCanResendOtpIn.tr(),
                          fontFamily: AppFonts.satoshiRegular,
                        ),
                        verifyEmailNotifier.enableResend
                            ? Consumer(
                                builder: (context, ref, _) {
                                  final state = ref.watch(authProvider);
                                  final notifier =
                                      ref.read(authProvider.notifier);

                                  return GestureDetector(
                                    onTap: () async {
                                      notifier.cancelTimer();
                                      await notifier.resendOtp();

                                      notifier.startTimer();
                                    },
                                    child: state is OtpResendApiLoading
                                        ? Row(
                                            children: [
                                              xWidth(10),
                                              SizedBox(
                                                height: 20.sp,
                                                width: 20.sp,
                                                child:
                                                    CircularProgressIndicator(
                                                        color: AppColor.primary,
                                                        strokeWidth: 3),
                                              ),
                                            ],
                                          )
                                        : AppText(
                                            text: AppString.resendOTP.tr(),
                                            textSize: 14.sp,
                                            fontFamily: AppFonts.satoshiBold,
                                            color: AppColor.black000000,
                                          ),
                                  );
                                },
                              )
                            : Consumer(builder: (BuildContext context,
                                WidgetRef ref, Widget? child) {
                                final loginState = ref.watch(authProvider);
                                final notifier =
                                    ref.read(authProvider.notifier);

                                final seconds = loginState is UpdateTimer
                                    ? loginState.secondsRemaining
                                    : notifier.secondsRemaining;

                                return AppText(
                                  text:
                                      ' (00:${seconds.toString().padLeft(2, '0')})'
                                          .tr(),
                                  textSize: 14.sp,
                                  fontFamily: AppFonts.satoshiBold,
                                  color: AppColor.black000000,
                                );
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
              title: AppString.verify.tr(),
              loading: verifyEmailState is LoginApiLoading &&
                  verifyEmailState.route == Routes.otpVerificationView,
              onTap: () =>
                  // toNamed(context, Routes.changePasswordView))
                  verifyEmailNotifier.verifyEmailValidator(context))
        ],
      ),
    );
  }
}
