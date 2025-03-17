import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/login_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/login_notifiers.dart';
import 'package:zrayo_flutter/feature/common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_text_field.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            yHeight(context.height * .13),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.zrayo),
                  10.verticalSpace,
                  AppText(
                    text: AppString.welcomeBack,
                    fontFamily: AppFonts.satoshiBold,
                    lineHeight: 1.2,
                    textSize: 24.sp,
                    color: AppColor.black232323,
                  ),
                  5.verticalSpace,
                  AppText(
                    text: AppString.loginToYourAccount,
                    fontFamily: AppFonts.satoshiRegular,
                    color: AppColor.black4A4A4A,
                  ),
                  yHeight(context.height * 0.05),
                  formsFieldsSection(loginNotifier),
                  yHeight(context.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        text: AppString.forgetPassword,
                        fontFamily: AppFonts.satoshiBold,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                  yHeight(context.height * 0.02),
                  CommonAppBtn(
                    title: AppString.login,
                  ),
                  yHeight(context.height * 0.02),
                  dottedOrDivider(context),
                  yHeight(context.height * 0.015),
                  customSocialMediaSection(),
                  yHeight(context.height * 0.14),
                  Text.rich(
                    TextSpan(
                      text: "${AppString.newUser} ",
                      style: TextStyle(
                          color: AppColor.black4A4A4A,
                          fontFamily: AppFonts.satoshiRegular),
                      children: [
                        TextSpan(
                          text: AppString.signUp,
                          style: TextStyle(
                            color: AppColor.primary,
                            fontFamily: AppFonts.satoshiBold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              offAllNamed(context, Routes.signUpView);
                            },
                        ),
                      ],
                    ),
                  ),
                  yHeight(context.height * 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget formsFieldsSection(LoginNotifier loginNotifier) {
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
        var isVisible = ref.watch(isPasswordVisible);
        return CustomTextField(
          onTapOnSuffixIcon: () {
            ref.read(isPasswordVisible.notifier).state =
                !ref.read(isPasswordVisible.notifier).state;
          },
          labelText: AppString.password,
          isObscure: !isVisible,
          hintText: '********',
          controller: loginNotifier.passwordController,
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
    ],
  );
}

Widget dottedOrDivider(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * .01,
    ),
    child: Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(9, (index) {
              return Container(
                width: 8,
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: Color(0xff040F25)
                    .withValues(alpha: index != 8 ? index / 10 : 0.8),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AppText(
            text: AppString.or,
            color: AppColor.blue303744,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(9, (index) {
              return Container(
                width: 7,
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: Color(0xff040F25).withValues(alpha: 20 / (index * 10)),
              );
            }),
          ),
        ),
        // ),
      ],
    ),
  );
}

Widget customSocialMediaSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CommonAppBtn(
          prefixWidget: SvgPicture.asset(Assets.iconGoogle),
          title: AppString.google,
          backGroundColor: AppColor.orangeFFF9F6,
          borderColor: Colors.transparent,
          titleStyle: TextStyle(
              color: AppColor.black232323,
              fontFamily: AppFonts.satoshiBold,
              fontSize: 16.sp),
          onTap: () {},
        ),
      ),
      xWidth(20.sp),
      Expanded(
        child: CommonAppBtn(
          prefixWidget: SvgPicture.asset(Assets.iconApple),
          title: AppString.apple,
          backGroundColor: AppColor.orangeFFF9F6,
          borderColor: Colors.transparent,
          titleStyle: TextStyle(
              color: AppColor.black232323,
              fontFamily: AppFonts.satoshiBold,
              fontSize: 16.sp),
          onTap: () {},
        ),
      ),
    ],
  );
}
