import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/sign_up_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/sign_up_notifier.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../provider/create_profile_provider.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpNotifier = ref.read(signUpProvider.notifier);
    final signUpState = ref.watch(signUpProvider);

    ref.listen<SignUpState>(signUpProvider, (previous, next) {
      if (next is SignUpSuccess) {
        ref.read(createProfileProvider.notifier).clearValues();
        toNamed(context, Routes.createProfile);
      } else if (next is SignUpFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        offAllNamed(context, Routes.loginView);
      },
      child: Scaffold(
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
                      textAlign: TextAlign.center,
                      text: AppString.startYourJourney.tr(),
                      fontFamily: AppFonts.satoshiBold,
                      lineHeight: 1.2,
                      textSize: 22.sp,
                      color: AppColor.black232323,
                    ),
                    5.verticalSpace,
                    AppText(
                      lineHeight: 1.1,
                      textAlign: TextAlign.center,
                      text: AppString.createAccountToAccessAllFeature.tr(),
                      fontFamily: AppFonts.satoshiRegular,
                      color: AppColor.black4A4A4A,
                    ),
                    yHeight(context.height * 0.04),
                    formsFieldsSection(signUpNotifier),
                    yHeight(context.height * 0.02),
                    CommonAppBtn(
                      title: AppString.signUp.tr(),
                      loading: signUpState is SignUpApiLoading,
                      onTap: () => signUpNotifier.signUpValidator(context),
                      // onTap: () => toNamed(context, Routes.createProfile),
                      // signUpNotifier.signUpValidator(context),
                    ),
                    yHeight(context.height * 0.14),
                    Text.rich(
                      TextSpan(
                        text: "${AppString.alreadyHaveAccount.tr()} ",
                        style: TextStyle(color: AppColor.black4A4A4A),
                        children: [
                          TextSpan(
                            text: AppString.login.tr(),
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
      ),
    );
  }
}

Widget formsFieldsSection(SignUpNotifier signUpNotifier) {
  return Column(
    children: [
      //EMAIL ADDRESS
      CustomTextField(
        hintText: AppString.exampleEamil.tr(),
        prefixIcon: SvgPicture.asset(Assets.email),
        controller: signUpNotifier.emailController,
        labelText: AppString.emailAddress.tr(),
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
          labelText: AppString.password.tr(),
          isObscure: !isVisible,
          hintText: '********'.tr(),
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
          labelText: AppString.confirmPassword.tr(),
          isObscure: !isVisible,
          hintText: '********'.tr(),
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
