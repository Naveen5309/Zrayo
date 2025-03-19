import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/view/location_access_content.dart';
import 'package:zrayo_flutter/feature/messages/presentation/view/messages.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_dialog.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_subscription_plan.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomDialog(context, content: LocationAccessContent());
    });
  }

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
            yHeight(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: AppString.getOneMonth,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshiRegular),
                        children: [
                          TextSpan(
                            text: AppString.freeTrial,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.satoshiBold),
                          ),
                          TextSpan(
                            text: AppString.freeTrialEnds,
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
              onTap: () => offAllNamed(context, Routes.dashboard),
            ),
          ],
        ),
      ),
    ]));
  }
}
