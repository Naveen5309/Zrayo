import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/upload_document_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_dotted_border.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

class AddPaymentCard extends StatelessWidget {
  final bool fromSettings;
  const AddPaymentCard({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.addCardDetail),
          yHeight(10.sp),
          Container(
            height: 5,
            color: AppColor.orangeFff9f0,
            width: screenWidth(context),
            child: fromSettings
                ? SizedBox()
                : Row(
                    children: [
                      Container(
                        height: 5,
                        width: (screenWidth(context) / 5) * 5,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
          ),
          yHeight(22.sp),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColor.colorDDDDDD.withValues(alpha: .7),
                    width: 1.0),
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomCacheNetworkImage(
                      img: "",
                      size: 38.sp,
                    ),
                    xWidth(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppText(
                                  text: "xxxxxxxxx 3615".toUpperCase(),
                                  fontFamily: AppFonts.satoshiBold,
                                  textSize: 14.sp,
                                  color: AppColor.color212121),
                              xWidth(10),
                            ],
                          ),
                          yHeight(3),
                          AppText(
                              text: "Visa Card",
                              fontFamily: AppFonts.satoshiRegular,
                              textSize: 14.sp,
                              color: AppColor.color212121.withValues(alpha: .7)),
                        ],
                      ),
                    ),
                    SvgPicture.asset(Assets.trash)
                  ],
                ),
                yHeight(15),
                Divider(
                  color: AppColor.colorDDDDDD.withValues(alpha: .7),
                ),
                yHeight(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          textSize: 12.sp,
                          color: AppColor.color212121.withValues(alpha: .7),
                          fontFamily: AppFonts.satoshiRegular,
                          text: 'Holder Name',
                        ),
                        yHeight(8),
                        AppText(
                          textSize: 12.sp,
                          color: AppColor.color212121,
                          fontFamily: AppFonts.satoshiBold,
                          text: 'Albert Flores'.toUpperCase(),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          textSize: 12.sp,
                          color: AppColor.color212121.withValues(alpha: .7),
                          fontFamily: AppFonts.satoshiRegular,
                          text: 'Exp.',
                        ),
                        yHeight(8),
                        AppText(
                          textSize: 12.sp,
                          color: AppColor.color212121,
                          fontFamily: AppFonts.satoshiBold,
                          text: '12/2027',
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  yHeight(40.sp),
                  CommonDottedBorder(
                    child: UploadDocumentTile(
                      iconWidget: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.secondry,
                        ),
                        child: Icon(CupertinoIcons.plus),
                      ),
                      filePath: "",
                      title: AppString.linkYourCardWithUs,
                      subTitle: "",
                      onTap: () {},
                    ),
                  ),
                  Spacer(),
                  CommonAppBtn(
                    title: fromSettings
                        ? AppString.update
                        : AppString.saveAndContinue,
                    onTap: () => fromSettings
                        ? back(context)
                        : toNamed(context, Routes.subscriptionPlanView),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
