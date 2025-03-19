import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/common_widgets/custom_subscription_plan.dart';

class SubscriptionPlanView extends StatelessWidget {
  const SubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(spacing: 5.sp, children: [
      CustomAppBar(title: ''),
      yHeight(context.height / 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              text: AppString.choosePlan,
              textSize: 24.sp,
              fontFamily: AppFonts.satoshiBold,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Get one month ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshiRegular),
                        children: [
                          TextSpan(
                            text: "free trial",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.satoshiBold),
                          ),
                          TextSpan(
                            text:
                                " and you can cancel a subscription before your free trial ends.",
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
            SizedBox(height: 20),
            Column(
              spacing: 15.sp,
              children: [
                PlanCard(
                  title: AppString.free,
                  price: AppString.price0,
                  description: AppString.givesDesignatedContact,
                  onTap: () {},
                ),
                PlanCard(
                  isSelected: true,
                  title: AppString.basic,
                  price: AppString.priceAbove0,
                  description: AppString.accessToBasiscTabs,
                  isHighlighted: true,
                  trialText: AppString.free7DaysTrial,
                  onTap: () {},
                ),
              ],
            ),
            yHeight(context.height / 7),
            CommonAppBtn(
              title: AppString.continueText,
            ),
          ],
        ),
      ),
    ]));
  }
}
