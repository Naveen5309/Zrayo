import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/auth_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/login_states.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class ForgotPasswordSheet extends ConsumerWidget {
  const ForgotPasswordSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgetPasswordNotifier = ref.read(authProvider.notifier);
    final loginState = ref.watch(authProvider);

    ref.listen<LoginState>(authProvider, (previous, next) {
      if (next is OtpSentSuccess) {
        // back(context);
        toNamed(context, Routes.otpVerificationView);
      } else if (next is LoginFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => back(context),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.close,
                size: 28.h,
              ),
            ),
          ),
          SvgPicture.asset(Assets.mailImage),
          yHeight(15.sp),
          AppText(
            text: AppString.forgetPassword.tr(),
            textSize: 22.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(10.sp),
          AppText(
            text: AppString.pleaseEnterEmailAddressAssociated.tr(),
            fontFamily: AppFonts.satoshiRegular,
            textAlign: TextAlign.center,
            lineHeight: 1.2,
          ),
          yHeight(10.sp),
          CustomTextField(
            hintText: AppString.exampleEamil.tr(),
            prefixIcon: SvgPicture.asset(Assets.email),
            controller: forgetPasswordNotifier.forgetEmailController,
            labelText: AppString.emailAddress.tr(),
          ),
          yHeight(10.sp),
          CommonAppBtn(
            title: AppString.submit.tr(),
            loading: loginState is LoginApiLoading &&
                loginState.route == Routes.forgetView,
            onTap: () {
              forgetPasswordNotifier.forgetPasswordValidator(context);
              // toNamed(context, Routes.otpVerificationView);
            },
          )
        ],
      ),
    );
  }
}
