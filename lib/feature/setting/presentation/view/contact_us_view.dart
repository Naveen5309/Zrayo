import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/contact_us_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class ContactUsView extends ConsumerWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsNotifier = ref.read(contactUsProvider.notifier);
    ref.watch(contactUsProvider);

    return Scaffold(
      body: Column(
        children: [
          yHeight(10.h),
          CustomAppBar(title: AppString.contactUs),
          yHeight(25.h),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16,),
            child: Column(
              children: [
                SvgPicture.asset(Assets.contactUs),
                yHeight(18.h),

                CustomTextField(
                  controller: contactUsNotifier.emailController,
                  labelText: AppString.email,
                  prefixIcon: SvgPicture.asset(Assets.email),
                  hintText: AppString.enterEmail,
                ),
                CustomTextField(
                  controller: contactUsNotifier.subjectController,
                  labelText: AppString.subject,
                  prefixIcon: SvgPicture.asset(Assets.write),
                  hintText: AppString.subject,
                ),
                CustomTextField(
                  controller: contactUsNotifier.messageController,
                  labelText: AppString.message,
                  minLines: 4,
                  maxLines: 4,
                  prefixIcon: SvgPicture.asset(Assets.check),
                  hintText: AppString.message,
                ),
                yHeight(context.height * 0.08),
                CommonAppBtn(title: AppString.submit, onTap: () => back(context)
                    //  contactUsNotifier.contactUsValidator(context),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
