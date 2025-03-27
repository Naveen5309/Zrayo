import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/property_detail/prasentation/view/request_a_tour_view/book_your_date_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

class FeaturePrpertyView extends ConsumerWidget {
  const FeaturePrpertyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.blackF7F8FB,
      body: Column(
        children: [
          CustomAppBar(title: AppString.addProperty),
          yHeight(10.sp),
          Container(
            height: 5,
            color: AppColor.orangeFff9f0,
            width: screenWidth(context),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: (screenWidth(context) / 5) * 5,
                  color: AppColor.primary,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height / 8)),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: context.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColor.whiteFFFFFF,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 18,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            Text(
                              AppString.featureyourProperty,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: AppFonts.satoshiBold,
                              ),
                            ),
                            yHeight(8),
                            AppText(
                              text: AppString.increaseVisibilityBuyer,
                              textAlign: TextAlign.center,
                              color:
                                  AppColor.black000000.withValues(alpha: 0.6),
                              fontFamily: AppFonts.satoshiRegular,
                              textSize: 14.sp,
                            ),
                            yHeight(22),
                            AppText(
                              text: "@ \$120",
                              textSize: 24.sp,
                              fontFamily: AppFonts.satoshiBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -78,
                    child: SizedBox(
                      width: 138,
                      height: 138,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteFFFFFF,
                            border: Border.all(
                                color: AppColor.blackF7F8FB, width: 5),
                            shape: BoxShape.circle),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteFFFFFF,
                              border: Border.all(
                                  color: AppColor.blackF7F8FB, width: 10),
                              shape: BoxShape.circle),
                          child: Lottie.asset(Assets.homeJson),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              yHeight(context.height * 0.15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CommonAppBtn(
                      title: AppString.buyNow,
                      onTap: () {
                        Utils.appBottomSheet(
                            context: context,
                            widget: SuccessSheet(
                              title: AppString.propertySuccessfullyPosted,
                              subTitle: AppString.propertyUploaded,
                              onTap: () {
                                back(context);
                              },
                            ));
                      },
                    ),
                    yHeight(18),
                    CommonAppBtn(
                      title: AppString.skip,
                      textColor: AppColor.primary,
                      onTap: () {
                        Utils.appBottomSheet(
                            context: context,
                            widget: SuccessSheet(
                              title: AppString.propertySuccessfullyPosted,
                              subTitle: AppString.propertyUploaded,
                              onTap: () {
                                back(context);
                              },
                            ));
                      },
                      backGroundColor:
                          AppColor.orangeEA8913.withValues(alpha: .24),
                    ),
                    yHeight(11),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
