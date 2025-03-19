import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/sign_up_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/sign_up_notifier.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

import '../../../../core/utils/routing/routes.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpNotifier = ref.watch(signUpProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  yHeight(
                    context.height * .13,
                  ),
                  SvgPicture.asset(Assets.zrayo),
                  10.verticalSpace,
                  AppText(
                    text: AppString.startYourJourney,
                    fontFamily: AppFonts.satoshiBold,
                    lineHeight: 1.2,
                    textSize: 24.sp,
                    color: AppColor.black232323,
                  ),
                  5.verticalSpace,
                  AppText(
                    lineHeight: 1.1,
                    textAlign: TextAlign.center,
                    text: AppString.createAccountToAccessAllFeature,
                    fontFamily: AppFonts.satoshiRegular,
                    color: AppColor.black4A4A4A,
                  ),
                  yHeight(context.height * 0.04),
                  formsFieldsSection(signUpNotifier),
                  yHeight(context.height * 0.02),
                  CommonAppBtn(
                    title: AppString.signUp,
                    onTap: () => toNamed(context, Routes.createProfile),
                  ),
                  yHeight(context.height * 0.12),
                  Text.rich(
                    TextSpan(
                      text: "${AppString.alreadyHaveAccount} ",
                      style: TextStyle(color: AppColor.black4A4A4A),
                      children: [
                        TextSpan(
                          text: AppString.login,
                          style: TextStyle(
                            color: AppColor.primary,
                            fontFamily: AppFonts.satoshiBold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              offAllNamed(context, Routes.loginView);
                            },
                        ),
                      ],
                    ),
                  ),
                  yHeight(context.height * 0.01),
                ])),
      ),
    );
  }
}

Widget formsFieldsSection(SignUpNotifier signUpNotifier) {
  return Column(
    children: [
      //EMAIL ADDRESS
      CustomTextField(
        hintText: AppString.exampleEamil,
        prefixIcon: SvgPicture.asset(Assets.email),
        controller: TextEditingController(),
        labelText: AppString.emailAddress,
      ),
      10.verticalSpace,
      //PASSWORD

      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var isVisible = ref.watch(isPassVisible);
        return CustomTextField(
          onTapOnSuffixIcon: () {
            ref.read(isPassVisible.notifier).state =
                !ref.read(isPassVisible.notifier).state;
          },
          labelText: AppString.password,
          isObscure: !isVisible,
          hintText: '********',
          controller: signUpNotifier.passwordController,
          prefixIcon: SvgPicture.asset(Assets.lock),
          suffixIcon: !isVisible
              ? SvgPicture.asset(Assets.eye)
              : SvgPicture.asset(
                  Assets.eyeOff,
                  colorFilter:
                      ColorFilter.mode(AppColor.black4A4A4A, BlendMode.srcIn),
                ),
        );
      }),
      // Confirm PASSWORD
      10.verticalSpace,
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var isVisible = ref.watch(isConfirmPassVisible);
        return CustomTextField(
          onTapOnSuffixIcon: () {
            ref.read(isConfirmPassVisible.notifier).state =
                !ref.read(isConfirmPassVisible.notifier).state;
          },
          labelText: AppString.confirmPassword,
          isObscure: !isVisible,
          hintText: '********',
          controller: signUpNotifier.confirmPasswordController,
          prefixIcon: SvgPicture.asset(Assets.lock),
          suffixIcon: !isVisible
              ? SvgPicture.asset(Assets.eye)
              : SvgPicture.asset(
                  Assets.eyeOff,
                  colorFilter:
                      ColorFilter.mode(AppColor.black4A4A4A, BlendMode.srcIn),
                ),
        );
      })
    ],
  );
}
