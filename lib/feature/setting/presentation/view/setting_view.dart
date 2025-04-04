import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/setting_provider.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/confirm_logout.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/custom_setting_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

import '../../../../core/network/http_service.dart';

class SettingView extends ConsumerWidget {
  const SettingView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingViewProvider);
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            CustomAppBar(
              title: AppString.setting,
              showBackButton: false,
              centerTitle: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 11,
                children: [
                  yHeight(11),
                  profileSection(context),
                  GestureDetector(
                      onTap: () => toNamed(context, Routes.subscriptionPlanView,
                          args: {"fromSettings": true}),
                      child: subscriptionSection(context)),
                  Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    var isToogleTrue = ref.watch(isToogle);

                    return SettingTile(
                      hasToggle: true,
                      toggleValue: isToogleTrue,
                      icon: Assets.notification,
                      onToggleChanged: (value) {
                        ref.read(isToogle.notifier).state =
                            !ref.read(isToogle.notifier).state;
                      },
                      title: AppString.notifications,
                    );
                  }),
                  SettingTile(
                    icon: Assets.personAdd,
                    title: AppString.inviteFriend,
                  ),
                  if (!Getters.isAgent())
                    SettingTile(
                      onTap: () => toNamed(context, Routes.visitMainView,
                          args: {"fromSettings": true}),
                      icon: Assets.visit,
                      title: AppString.visits,
                    ),
                  SettingTile(
                    onTap: () => toNamed(context, Routes.addBankDetail,
                        args: {"fromSettings": true}),
                    icon: Assets.bank,
                    title: AppString.bankDetails,
                  ),
                  if (!Getters.isAgent())
                    SettingTile(
                      onTap: () => toNamed(context, Routes.addPaymentCard,
                          args: {"fromSettings": true}),
                      icon: Assets.card,
                      title: AppString.cardDetails,
                    ),
                  SettingTile(
                    onTap: () => toNamed(context, Routes.aboutUs),
                    icon: Assets.document,
                    title: AppString.aboutUs,
                  ),
                  SettingTile(
                    onTap: () => toNamed(context, Routes.contactUs),
                    icon: Assets.headphone,
                    title: AppString.contactUs,
                  ),
                  SettingTile(
                    icon: Assets.star,
                    title: AppString.rateOurApp,
                  ),
                  SettingTile(
                    onTap: () {
                      Utils.appBottomSheet(
                        isScrolled: true,
                        context: context,
                        widget: LogoutConfirmationView(),
                      );
                    },
                    textColor: AppColor.redF75454,
                    icon: Assets.logout,
                    title: AppString.logout,
                  ),
                  if (!Getters.isAgent())
                    GestureDetector(
                        onTap: () => toNamed(
                            context, Routes.subscriptionPlanView,
                            args: {"fromSettings": true}),
                        child: premiumSection(context)),
                  yHeight(11)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget profileSection(BuildContext context) {
  final userModel = Getters.getLocalStorage.getLoginUser();
  printLog(userModel?.token);
  return GestureDetector(
    onTap: () {
      toNamed(context, Routes.profileDetailView);
    },
    child: Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColor.whiteFFFFFF,
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.whiteFFFFFF.withValues(alpha: .1),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.grey99ABC6.withValues(alpha: 0.18),
                    blurRadius: 62,
                    offset: Offset(0, 4),
                  ),
                ]),
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: CustomCacheNetworkImage(
                  img:
                      "${ApiEndpoints.profileImageUrl}${userModel?.userProfile}",
                  size: 50,
                )),
          ),
          xWidth(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: userModel?.fullName?.toTitleCase() ?? "",
                  textSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),

                5.verticalSpace,
                //SUBTITLE
                AppText(
                  text: userModel?.email ?? "",
                  textSize: 12.sp,
                  color: AppColor.grey646464,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColor.black160C08,
          ),
          xWidth(16.w)
        ],
      ),
    ),
  );
}

Widget subscriptionSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: AppColor.orangeEA8913.withValues(alpha: 0.08),
      border: Border.all(
        color: AppColor.orangeEA8913.withValues(alpha: 0.4),
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(22),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.subscribe),
          xWidth(11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TITLE
                AppText(
                  text: AppString.subscription,
                  textSize: 15.sp,
                  fontFamily: AppFonts.satoshiBold,
                ),

                yHeight(8),
                //SUBTITLE
                AppText(
                  text: AppString.freeTriall,
                  textSize: 12.sp,
                  color: AppColor.grey646464,
                ),
              ],
            ),
          ),
          AppText(
            text: '27 days left',
            textSize: 12.sp,
            color: AppColor.primary,
            fontFamily: AppFonts.satoshiBold,
          ),
        ],
      ),
    ),
  );
}

Widget premiumSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: AppColor.primary.withValues(alpha: 0.5),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.premium),
        const SizedBox(width: 8),
        const AppText(
          text: AppString.becomePremiumMember,
          fontFamily: AppFonts.satoshiBold,
          color: AppColor.whiteFFFFFF,
        ),
      ],
    ),
  );
}
