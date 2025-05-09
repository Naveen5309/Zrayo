import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_subscription_plan.dart';

class SubscriptionPlanView extends StatelessWidget {
  final bool fromSettings;

  const SubscriptionPlanView({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(spacing: 5.sp, children: [
      CustomAppBar(title: ''),
      yHeight(context.height / 15),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: AppString.choosePlan.tr(),
                  textSize: 24.sp,
                  fontFamily: AppFonts.satoshiBold,
                ),
                yHeight(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: AppString.getOneMonth.tr(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.satoshiRegular),
                            children: [
                              TextSpan(
                                text: AppString.freeTrial.tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.satoshiBold),
                              ),
                              TextSpan(
                                text: AppString.freeTrialEnds.tr(),
                                style: TextStyle(
                                  fontFamily: AppFonts.satoshiRegular,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                yHeight(30),
                Column(
                  spacing: 15.sp,
                  children: [
                    PlanCard(
                      title: AppString.free,
                      price: "\$0.00",
                      description: AppString.givesDesignatedContact,
                      onTap: () {},
                    ),
                    PlanCard(
                      isSelected: true,
                      title: AppString.basic,
                      price: "\$4.99",
                      description: AppString.accessToBasiscTabs,
                      isHighlighted: true,
                      trialText: AppString.free7DaysTrial,
                      onTap: () {},
                    ),
                  ],
                ),
                yHeight(context.height / 7),
                CommonAppBtn(
                  title: AppString.continueText.tr(),
                  onTap: () => fromSettings
                      ? back(context)
                      : offAllNamed(context, Routes.dashboard),
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
