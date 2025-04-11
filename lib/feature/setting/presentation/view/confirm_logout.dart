import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/setting_provider.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class LogoutConfirmationView extends ConsumerWidget {
  const LogoutConfirmationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingState = ref.watch(settingViewProvider);
    final settingNotifier = ref.read(settingViewProvider.notifier);

    ref.listen<SettingState>(settingViewProvider, (previous, next) {
      if (next is SettingSuccess) {
        offAllNamed(context, Routes.chooseInterfaceView);
      } else if (next is SettingFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.logoutConfirm,
            height: 105,
            width: 114,
          ),
          yHeight(context.height * 0.03),
          AppText(
            text: AppString.logout.tr(),
            fontFamily: AppFonts.satoshiBold,
            textSize: 22.sp,
            textAlign: TextAlign.center,
          ),
          yHeight(context.height * 0.02),
          AppText(
            text: AppString.areYouSureLogOut.tr(),
            textAlign: TextAlign.center,
            color: AppColor.grey646464,
          ),
          yHeight(context.height * 0.03),
          yHeight(20),
          Padding(
            padding: EdgeInsets.only(bottom: context.height * .02),
            child: Row(
              children: [
                //CANCEL
                Expanded(
                  child: CommonAppBtn(
                    textColor: AppColor.primary,
                    backGroundColor: AppColor.secondry,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: AppString.cancel.tr(),
                    borderColor: AppColor.transparent,
                    width: context.width,
                  ),
                ),
                xWidth(context.width / 18),

                //CONFIRM
                Expanded(
                  child: CommonAppBtn(
                    loading: settingState is SettingApiLoading,
                    onTap: () {
                      ref.read(createProfileProvider.notifier).clearValues();
                      settingNotifier.logout();
                    },
                    title: AppString.logout.tr(),
                    width: context.width,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
