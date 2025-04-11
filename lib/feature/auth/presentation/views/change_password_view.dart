import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

import '../../../../config/assets.dart';
import '../../../../config/helper.dart';
import '../../../z_common_widgets/app_text.dart';
import '../../../z_common_widgets/custom_app_bar.dart';
import '../../../z_common_widgets/custom_btn.dart';
import '../../../z_common_widgets/custom_text_field.dart';
import '../provider/auth_provider.dart';

class ChangePasswordView extends ConsumerWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changePasswordNotifier = ref.read(authProvider.notifier);
    final changePassState = ref.watch(authProvider);

    ref.listen<LoginState>(authProvider, (previous, next) {
      if (next is ChangePasswordSuccess) {
        offAllNamed(context, Routes.loginView);
      } else if (next is LoginFailed) {
        toast(msg: next.error, isError: true);
      }
    });

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
                  text: AppString.createNewPassword.tr(),
                  textSize: 22.sp,
                  color: AppColor.color1E2430,
                  fontFamily: AppFonts.satoshiBold,
                ),
                yHeight(10.sp),
                AppText(
                  text: AppString.yourNewPasswordMustBeUnique.tr(),
                  fontFamily: AppFonts.satoshiRegular,
                  textAlign: TextAlign.center,
                  color: AppColor.color465573,
                  lineHeight: 1.2,
                ),
                yHeight(20.sp),

                Consumer(builder:
                    (BuildContext context, WidgetRef ref, Widget? child) {
                  var isVisible = ref.watch(isNewPassVisible);

                  return CustomTextField(
                    onTapOnSuffixIcon: () {
                      ref.read(isNewPassVisible.notifier).state =
                          !ref.read(isNewPassVisible.notifier).state;
                    },
                    labelText: AppString.newPassword,
                    isObscure: !isVisible,
                    hintText: '********',
                    controller: changePasswordNotifier.newPasswordController,
                    prefixIcon: SvgPicture.asset(Assets.lock),
                    suffixIcon: !isVisible
                        ? SvgPicture.asset(Assets.eye)
                        : SvgPicture.asset(
                            Assets.eyeOff,
                            colorFilter: ColorFilter.mode(
                                AppColor.black4A4A4A, BlendMode.srcIn),
                          ),
                  );
                }),
                // Confirm PASSWORD
                10.verticalSpace,
                Consumer(builder:
                    (BuildContext context, WidgetRef ref, Widget? child) {
                  var isVisible = ref.watch(isConfirmPassVisible);

                  return CustomTextField(
                    onTapOnSuffixIcon: () {
                      ref.read(isConfirmPassVisible.notifier).state =
                          !ref.read(isConfirmPassVisible.notifier).state;
                    },
                    labelText: AppString.confirmPassword,
                    isObscure: !isVisible,
                    hintText: '********',
                    controller:
                        changePasswordNotifier.confirmPasswordController,
                    prefixIcon: SvgPicture.asset(Assets.lock),
                    suffixIcon: !isVisible
                        ? SvgPicture.asset(Assets.eye)
                        : SvgPicture.asset(
                            Assets.eyeOff,
                            colorFilter: ColorFilter.mode(
                                AppColor.black4A4A4A, BlendMode.srcIn),
                          ),
                  );
                })
              ],
            ),
          ),
          CommonAppBtn(
            margin: EdgeInsets.all(16.0),
            title: AppString.change.tr(),
            loading: changePassState is LoginApiLoading &&
                changePassState.route == Routes.changePasswordView,
            onTap: () {
              changePasswordNotifier.changePasswordValidator(context);
              // back(context);
              // back(context);
            },
          )
        ],
      ),
    );
  }
}
