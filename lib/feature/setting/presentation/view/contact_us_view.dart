import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/setting_provider.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class ContactUsView extends ConsumerWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsNotifier = ref.read(settingViewProvider.notifier);
    final contactUsViewState = ref.watch(settingViewProvider);
    ref.listen<SettingState>(settingViewProvider, (previous, next) {
      if (next is SettingSuccess) {
        back(context);
      } else if (next is SettingFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.contactUs),
          yHeight(25.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(Assets.contactUs),
                    yHeight(18.h),
                    CustomTextField(
                      controller: contactUsNotifier.emailController,
                      labelText: AppString.email.tr(),
                      prefixIcon: SvgPicture.asset(Assets.email),
                      hintText: AppString.enterEmail.tr(),
                    ),
                    CustomTextField(
                      controller: contactUsNotifier.subjectController,
                      labelText: AppString.subject.tr(),
                      prefixIcon: SvgPicture.asset(Assets.write),
                      hintText: AppString.subject.tr(),
                    ),
                    CustomTextField(
                      controller: contactUsNotifier.messageController,
                      labelText: AppString.message.tr(),
                      prefixIcon: SvgPicture.asset(Assets.check),
                      minLines: 4,
                      prefixIconPadding:
                          EdgeInsets.only(bottom: 55, left: 12, right: 12),
                      hintText: AppString.message.tr(),
                    ),
                    yHeight(context.height * 0.08),
                    CommonAppBtn(
                      title: AppString.submit.tr(),
                      loading: contactUsViewState is SettingApiLoading,
                      onTap: () =>
                          contactUsNotifier.contactUsValidator(context),
                    ),
                    yHeight(10)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
