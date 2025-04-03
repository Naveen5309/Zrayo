import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/auth_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/login_notifiers.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/forgot_password_sheet.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

import '../../../z_common_widgets/custom_toast.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(authProvider);
    final loginNotifier = ref.read(authProvider.notifier);

    ref.listen<LoginState>(authProvider, (previous, next) {
      if (next is LoginSuccess) {
        offAllNamed(context, Routes.dashboard);
      } else if (next is LoginFailed) {
        toast(msg: next.error, isError: true);
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        offAllNamed(context, Routes.chooseInterfaceView);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.height * .13),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.zrayo),
                    yHeight(10),
                    AppText(
                      text: AppString.welcomeBack,
                      fontFamily: AppFonts.satoshiBold,
                      lineHeight: 1.2,
                      textSize: 24.sp,
                      color: AppColor.black232323,
                    ),
                    yHeight(5),
                    AppText(
                      text: AppString.loginToYourAccount,
                      fontFamily: AppFonts.satoshiRegular,
                      color: AppColor.black4A4A4A,
                    ),
                    yHeight(context.height * 0.05),
                    _buildFormFieldsSection(loginNotifier),
                    yHeight(context.height * 0.01),
                    _buildForgotPasswordLink(context),
                    yHeight(context.height * 0.02),
                    _buildLoginButton(loginState, loginNotifier, context),
                    yHeight(context.height * 0.02),
                    SvgPicture.asset(Assets.loginOr),
                    yHeight(context.height * 0.015),
                    _buildSocialMediaSection(),
                    yHeight(context.height * 0.12),
                    _buildSignUpText(context),
                    yHeight(context.height * 0.01),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldsSection(LoginNotifier loginNotifier) {
    return Column(
      children: [
        // EMAIL ADDRESS
        CustomTextField(
          hintText: AppString.exampleEamil,
          prefixIcon: SvgPicture.asset(Assets.email),
          controller: loginNotifier.emailController,
          labelText: AppString.emailAddress,
        ),
        yHeight(10),

        // PASSWORD
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            var isVisible = ref.watch(isPasswordVisible);
            return CustomTextField(
              onTapOnSuffixIcon: () {
                ref.read(isPasswordVisible.notifier).state = !isVisible;
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
                      colorFilter: ColorFilter.mode(
                          AppColor.black4A4A4A, BlendMode.srcIn),
                    ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.appBottomSheet(
            isScrolled: true,
            context: context,
            barOnTop: false,
            setMaxHeight:false,
            widget: ForgotPasswordSheet());
      },
      child: AppText(
        text: AppString.forgetPassword,
        fontFamily: AppFonts.satoshiBold,
        color: AppColor.primary,
      ).align(alignment: Alignment.centerRight),
    );
  }

  Widget _buildLoginButton(LoginState loginState, LoginNotifier loginNotifier,
      BuildContext context) {
    return CommonAppBtn(
      title: AppString.login,
      loading: loginState is LoginApiLoading,
      onTap: () => loginNotifier.loginValidator(context),
    );
  }

  Widget _buildSocialMediaSection() {
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
        if (Platform.isIOS) ...{
          SizedBox(width: 20.sp),
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
          )
        },
      ],
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "${AppString.newUser} ",
        style: TextStyle(
            color: AppColor.black4A4A4A, fontFamily: AppFonts.satoshiRegular),
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
    );
  }
}
