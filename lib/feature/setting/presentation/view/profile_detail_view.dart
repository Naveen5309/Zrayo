import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/state_notifiers/create_profile_notifiers.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

import '../../../../core/network/http_service.dart';
import '../../../auth/presentation/provider/create_profile_provider.dart';

class ProfileDetailView extends ConsumerWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(createProfileProvider);
    final createProfileNotifier = ref.read(createProfileProvider.notifier);
    final userModel = createProfileNotifier.userModel;
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
                  personalDetail(context, userModel,createProfileNotifier),
                  yHeight(context.height * 0.002),

                  /// address detail
                  addressDetail(context, userModel, createProfileNotifier),
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
  Widget personalDetail(BuildContext context, UserModel? userModel, CreateProfileNotifiers createProfileNotifier) {
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
            children: [
              Expanded(
                child: Column(
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
                      text: (userModel?.fullName ?? ""),
                      textSize: 14.sp,
                      color: AppColor.black111111,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
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
                      maxlines: 2,
                      textSize: 14.sp,
                      color: AppColor.black111111,
                    ),
                  ],
                ),
              ),
              xWidth(context.width / 5.5),
              yHeight(context.height * 0.1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// address detail widget
  Widget addressDetail(BuildContext context, UserModel? userModel,
      CreateProfileNotifiers createProfileNotifier) {
    final userDetail = userModel?.detail;

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
                  onTap: () {

                    toNamed(context, Routes.addAddressView,
                        args: {"fromSettings": true});
                  },
                  child: SvgPicture.asset(Assets.edit)),
            ],
          ),
          yHeight(context.height * .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
                      maxlines: 2,
                      text: userDetail?.country ?? "",
                      textSize: 14.sp,
                      color: AppColor.black111111,
                    ),
                  ],
                ),
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
                    maxlines: 2,
                    text: userDetail?.state ?? "",
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
                    text: userDetail?.city ?? "",
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
                        '${userDetail?.address},${userDetail?.city}, ${userDetail?.state},${userDetail?.country}',
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
    final userDetail = userModel?.detail;
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
          if ((userDetail?.idDocumentBack == null ||
                  (userDetail?.idDocumentBack?.isEmpty ?? false)) &&
              (userDetail?.idDocumentFront == null ||
                  (userDetail?.idDocumentFront?.isEmpty ?? false))) ...{
            AppText(text: "No Document Found").align()
          } else ...{
            if ((userDetail?.idDocumentFront != null &&
                (userDetail?.idDocumentFront?.isNotEmpty ?? false))) ...{
              CustomCacheNetworkImage(
                  height: context.height / 4,
                  width: context.width / 1.31,
                  imageRadius: 12,
                  img:
                      "${ApiEndpoints.docImageUrl}${userDetail?.idDocumentFront}"),
              yHeight(context.height * 0.04)
            },
            if ((userDetail?.idDocumentBack != null &&
                (userDetail?.idDocumentBack?.isNotEmpty ?? false)))
              CustomCacheNetworkImage(
                  height: context.height / 4,
                  width: context.width / 1.31,
                  imageRadius: 12,
                  img:
                      "${ApiEndpoints.docImageUrl}${userDetail?.idDocumentBack}"),
          }
        ],
      ),
    );
  }
}
