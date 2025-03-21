import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.contactUs),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: context.width / 12),
            child: Column(
              children: [
                SvgPicture.asset(Assets.contactUs),
                CustomTextField(
                  labelText: AppString.email,
                  prefixIcon: SvgPicture.asset(Assets.email),
                  hintText: AppString.enterEmail,
                ),
                CustomTextField(
                  labelText: AppString.subject,
                  prefixIcon: SvgPicture.asset(Assets.write),
                  hintText: AppString.subject,
                ),
                CustomTextField(
                  labelText: AppString.message,
                  minLines: 4,
                  maxLines: 4,
                  prefixIcon: SvgPicture.asset(Assets.check),
                  hintText: AppString.message,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
