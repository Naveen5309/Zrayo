import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

import '../../../../core/network/http_service.dart';
import '../../../auth/presentation/provider/create_profile_provider.dart';

class ProfileDetailView extends ConsumerWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = Getters.getLocalStorage.getLoginUser();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppString.myProfile),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 11,
                children: [
                  yHeight(context.height * .02),

                  /// personal detail
                  personalDetail(context, userModel),
                  yHeight(context.height * 0.002),

                  /// address detail
                  addressDetail(context),
                  yHeight(context.height * 0.002),

                  /// Uploaded document
                  uploadedDocDetail(context, userModel),
                  yHeight(context.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// personal detail widget
  Widget personalDetail(BuildContext context, UserModel? userModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Utils.boxDecoWithShadow(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppString.personalDetails,
                textSize: 20.sp,
                fontFamily: AppFonts.satoshiBold,
              ),
              GestureDetector(
                  onTap: () {
                    toNamed(context, Routes.createProfile,
                        args: {"fromSettings": true});
                  },
                  child: SvgPicture.asset(Assets.edit)),
            ],
          ),
          yHeight(context.height * .04),
          CustomCacheNetworkImage(
              img: "${ApiEndpoints.profileImageUrl}${userModel?.userProfile}"),
          yHeight(context.height * .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.name,
                    textSize: 14.sp,
                    color: AppColor.black111111,
                    fontFamily: AppFonts.satoshiBlack,
                  ),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: userModel?.fullName ?? "",
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: AppString.contactNumber,
                      textSize: 14.sp,
                      color: AppColor.black111111,
                      fontFamily: AppFonts.satoshiBlack),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: userModel?.phoneNumber ?? "",
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.email,
                    textSize: 14.sp,
                    color: AppColor.black111111,
                    fontFamily: AppFonts.satoshiBlack,
                  ),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: userModel?.email ?? "",
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
              yHeight(context.height * 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: AppString.dateOfBirth,
                      textSize: 14.sp,
                      color: AppColor.black111111,
                      fontFamily: AppFonts.satoshiBlack),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: formatDOBDDMMYYYY(userModel?.dob ?? DateTime.now()),
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// address detail widget
  Widget addressDetail(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Utils.boxDecoWithShadow(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppString.address,
                textSize: 20.sp,
                fontFamily: AppFonts.satoshiBold,
              ),
              GestureDetector(
                  onTap: () => toNamed(context, Routes.addAddressView,
                      args: {"fromSettings": true}),
                  child: SvgPicture.asset(Assets.edit)),
            ],
          ),
          yHeight(context.height * .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.country,
                    textSize: 14.sp,
                    color: AppColor.black111111,
                    fontFamily: AppFonts.satoshiBlack,
                  ),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: 'United state',
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: AppString.state,
                      textSize: 14.sp,
                      color: AppColor.black111111,
                      fontFamily: AppFonts.satoshiBlack),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: 'California',
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.city,
                    textSize: 14.sp,
                    color: AppColor.black111111,
                    fontFamily: AppFonts.satoshiBlack,
                  ),
                  yHeight(context.height * 0.01),
                  AppText(
                    text: 'Los Angeles',
                    textSize: 14.sp,
                    color: AppColor.black111111,
                  ),
                ],
              ),
              yHeight(context.height * 0.1),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: AppString.completeAddress,
                      textSize: 14.sp,
                      color: AppColor.black111111,
                      fontFamily: AppFonts.satoshiBlack),
                  yHeight(context.height * 0.01),
                  AppText(
                    text:
                        '1234 Elm Street,Los Angeles, CA 90001,\nUnited States',
                    textSize: 14.sp,
                    lineHeight: 1.2,
                    color: AppColor.black111111,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Uploaded document detail widget
  Widget uploadedDocDetail(BuildContext context, UserModel? userModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: Utils.boxDecoWithShadow(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppString.identityDocument,
                textSize: 20.sp,
                fontFamily: AppFonts.satoshiBold,
              ),
              GestureDetector(
                  onTap: () => toNamed(context, Routes.uploadDocument,
                      args: {"fromSettings": true}),
                  child: SvgPicture.asset(Assets.edit)),
            ],
          ),
          yHeight(context.height * .04),
          if ((userModel?.idDocumentBack == null ||
                  (userModel?.idDocumentBack?.isEmpty ?? false)) &&
              (userModel?.idDocumentFront == null ||
                  (userModel?.idDocumentFront?.isEmpty ?? false))) ...{
            AppText(text: "No Document Found").align()
          } else ...{
            if ((userModel?.idDocumentFront != null &&
                (userModel?.idDocumentFront?.isNotEmpty ?? false))) ...{
              CustomCacheNetworkImage(
                  height: context.height / 4,
                  width: context.width / 1.31,
                  imageRadius: 12,
                  img:
                      "${ApiEndpoints.docImageUrl}${userModel?.idDocumentFront}"),
              yHeight(context.height * 0.04)
            },
            if ((userModel?.idDocumentBack != null &&
                (userModel?.idDocumentBack?.isNotEmpty ?? false)))
              CustomCacheNetworkImage(
                  height: context.height / 4,
                  width: context.width / 1.31,
                  imageRadius: 12,
                  img:
                      "${ApiEndpoints.docImageUrl}${userModel?.idDocumentBack}"),
          }
        ],
      ),
    );
  }
}
