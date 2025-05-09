import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/review_bottomsheet.dart';
import 'package:zrayo_flutter/feature/property_detail/prasentation/view/request_a_tour_view/book_your_date_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_dotted_border.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_you_sure_sheet_content.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_rating_box.dart';

part 'agents_landlord_list.dart';
part 'all_pictures_view.dart';
part 'property_features_list.dart';
part 'property_historical_data.dart';
part 'property_map_view.dart';

part 'booking_detail.dart';

class PropertyDetailView extends StatelessWidget {
  final bool isSold;
  final bool isVisit;
  final bool isMyProperty;

  const PropertyDetailView({
    super.key,
    this.isSold = false,
    this.isVisit = false,
    this.isMyProperty = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// image view
                  Stack(
                    children: [
                      CustomCacheNetworkImage(
                        img: "https://cdn.pixabay.com/photo/2017/07/08/02/16/house-2483336_640.jpg",
                        width: double.infinity,
                        height: screenHeight(context) / 2.5,
                        imageBorderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(34),
                          bottomRight: Radius.circular(34),
                        ),
                      ),
                      if (isSold)
                        Positioned(
                          top: safeAreaHeight(context) + 15.h,
                          right: 0.h,
                          left: 0.h,
                          child: SvgPicture.asset(Assets.soldImage),
                        ),
                      Positioned(
                        top: safeAreaHeight(context) + 15.h,
                        right: 16.h,
                        left: 16.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => back(context),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.whiteFFFFFF,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  Assets.leftArrow,
                                  width: 18.h,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                // if (isSold) ...{
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteFFFFFF,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    Assets.shareIcon,
                                    width: 18.h,
                                  ),
                                ),
                                xWidth(10.h),
                                // },
                                if (!Getters.isAgent())
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.whiteFFFFFF,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      Assets.heartUnselected,
                                      width: 18.h,
                                      colorFilter: ColorFilter.mode(
                                          AppColor.black000000,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  yHeight(15.h),

                  /// All images
                  SizedBox(
                    height: 80.sp,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 3) {
                              toNamed(context, Routes.allPicturesView);
                            }
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: index == 3 ? 0 : 15.sp),
                            child: Stack(
                              children: [
                                CustomCacheNetworkImage(
                                  img: "https://cdn.pixabay.com/photo/2017/07/08/02/16/house-2483336_640.jpg",
                                  size: 74.sp,
                                  imageRadius: 10.sp,
                                  imageBorder: Border.all(
                                      color: index == 0
                                          ? AppColor.primary
                                          : AppColor.transparent,
                                      width: 2),
                                ),
                                if (index == 3)
                                  Container(
                                    height: 74.sp,
                                    width: 74.sp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: AppColor.black000000
                                          .withValues(alpha: 0.30),
                                    ),
                                    child: AppText(
                                      text: "9+",
                                      fontFamily: AppFonts.satoshiBold,
                                      textSize: 22.sp,
                                      color: AppColor.whiteFFFFFF,
                                    ).align(),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ).align(),
                  ),

                  /// propertyInfo
                  propertyInfo(context),

                  // yHeight(16.h),
                  PropertyFeaturesList(),
                  if (!isVisit) AgentsLandlordList(),
                  yHeight(16.sp),
                  PropertyMapView(),
                  yHeight(16.sp),
                  PropertyHistoricalData(),
                ],
              ),
            ),
          ),
          if (isVisit) ...{
            CommonAppBtn(
              title: AppString.cancelBooking.tr(),
              backGroundColor: AppColor.secondry,
              textColor: AppColor.primary,
              borderColor: AppColor.transparent,
              margin: EdgeInsets.all(16.sp),
            ),
            CommonAppBtn(
              title: AppString.message.tr(),
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              onTap: () => toNamed(context, Routes.chatView),
            ),
          },
          if (!Getters.isAgent() && !isVisit && !isMyProperty) ...{
            CommonAppBtn(
                title: AppString.requestaTour.tr(),
                margin: EdgeInsets.all(16.sp),
                onTap: () => Utils.appBottomSheet(
                    context: context,
                    widget: bottomSheet(context),
                    isScrolled: true)),
            CommonAppBtn(
              title: AppString.message.tr(),
              backGroundColor: AppColor.secondry,
              textColor: AppColor.primary,
              borderColor: AppColor.transparent,
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              onTap: () => toNamed(context, Routes.chatView),
            ),
          },
          if (isMyProperty) ...{
            CommonAppBtn(
              title: AppString.edit.tr(),
              backGroundColor: AppColor.secondry,
              textColor: AppColor.primary,
              borderColor: AppColor.transparent,
              margin: EdgeInsets.all(16.sp),
              prefixWidget: SvgPicture.asset(Assets.editt),
            ),
            CommonAppBtn(
              title: AppString.propertySold.tr(),
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              onTap: () {
                Utils.appBottomSheet(
                    context: context,
                    widget: CommonYouSureSheetContent(
                      onYes: () {
                        back(context);
                        Utils.appBottomSheet(
                            context: context,
                            isDismissible: false,
                            widget: SuccessSheet(
                              title: AppString.soldSuccessfully.tr(),
                              subTitle:
                                  AppString.yourPropertyisSuccessfullySold.tr(),
                              onTap: () {
                                back(context);
                                back(context);
                              },
                            ),
                            isScrolled: true);
                      },
                    ),
                    isScrolled: true);
              },
            ),
          },
          yHeight(10)
        ],
      ),
    );
  }

  Widget propertyInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Hexagon villa",
                      textSize: 20.sp,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    yHeight(15),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.locationDark),
                        xWidth(5),
                        Expanded(
                          child: AppText(
                            text: "Street Gistieng  no 12",
                            textSize: 14.sp,
                            fontFamily: AppFonts.satoshiRegular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              yHeight(5),
              Column(
                children: [
                  AppText(
                    text: "\$1200",
                    textSize: 18.sp,
                    fontFamily: AppFonts.satoshiBlack,
                  ),
                  yHeight(5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColor.blue046EC4.withValues(alpha: .10),
                        borderRadius: BorderRadius.circular(6)),
                    child: AppText(
                      text: AppString.forSale.tr(),
                      textSize: 12.sp,
                      color: AppColor.blue046EC4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          yHeight(10.h),
          if (Getters.isAgent()) dottedContainer(context),
          yHeight(13.h),
          AppText(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
            textSize: 14.sp,
            fontFamily: AppFonts.satoshiRegular,
            lineHeight: 1.4,
          ),
          yHeight(30.sp),
          if (isVisit) ...{
            BookingDetail(),
            yHeight(30.sp),
          },
          AppText(
            text: AppString.propertyDetails.tr(),
            textSize: 16.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(15.h),
          Container(
            decoration: Utils.boxDecoWithShadow(),
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppString.propertyType.tr(),
                  textSize: 14.sp,
                  fontFamily: AppFonts.satoshiRegular,
                  lineHeight: 1.4,
                ),
                yHeight(5.h),
                AppText(
                  text: "House Building Land",
                  textSize: 16.sp,
                  fontFamily: AppFonts.satoshiBold,
                  lineHeight: 1.4,
                ),
                yHeight(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.bath,
                          textSize: 14.sp,
                          fontFamily: AppFonts.satoshiRegular,
                          lineHeight: 1.4,
                        ),
                        yHeight(5.h),
                        AppText(
                          text: "120 Sq.Ft",
                          textSize: 14.sp,
                          fontFamily: AppFonts.satoshiBold,
                          lineHeight: 1.4,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.bed.tr(),
                          textSize: 14.sp,
                          fontFamily: AppFonts.satoshiRegular,
                          lineHeight: 1.4,
                        ),
                        yHeight(5.h),
                        AppText(
                          text: "120 Sq.Ft",
                          textSize: 14.sp,
                          fontFamily: AppFonts.satoshiBold,
                          lineHeight: 1.4,
                        ),
                      ],
                    ),
                  ],
                ),
                if (isVisit && !Getters.isAgent()) ...{
                  yHeight(16.h),
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
                                  text: "Dianne Russell",
                                  fontFamily: AppFonts.satoshiBold,
                                  // textSize: 18.sp,
                                ),
                                xWidth(10),
                                // if (isFirst)
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.primary
                                          .withValues(alpha: .1),
                                      borderRadius: BorderRadius.circular(33)),
                                  width: 50.w,
                                  height: 19.h,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: AppText(
                                      color: AppColor.primary,
                                      text: AppString.landloard.tr(),
                                      textSize: 8.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            yHeight(3),
                            AppText(
                              text: "nevaeh.simmons@example.com",
                              fontFamily: AppFonts.satoshiMedium,
                              textSize: 12.sp,
                              color: AppColor.color7D8B98,
                            ),
                          ],
                        ),
                      ),
                      if (!Getters.isAgent())
                        CustomRatingBox(rating: "4.8")
                      else
                        InkWell(
                            onTap: () => toNamed(context, Routes.chatView),
                            child: SvgPicture.asset(Assets.messageIcon))
                    ],
                  )
                },
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget dottedContainer(BuildContext context) {
  return CommonDottedBorder(
    color: AppColor.primary.withValues(alpha: .36),
    child: Container(
      color: AppColor.primary.withValues(alpha: .06),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: 'Viewing Fees',
            color: AppColor.primary,
            textSize: 14.sp,
          ),
          AppText(
            text: '\$1200',
            color: AppColor.primary,
            textSize: 14.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
        ],
      ),
    ),
  );
}

Widget bottomSheet(BuildContext context) {
  return Column(
    children: [
      yHeight(12),
      AppText(
        text: AppString.chooseYourAgent.tr(),
        textSize: 20.sp,
        fontFamily: AppFonts.satoshiBold,
      ),
      yHeight(12),
      AppText(
        text: AppString.minimumAgentAndFeedback.tr(),
        fontFamily: AppFonts.satoshiRegular,
        lineHeight: 1.2,
        textSize: 14.sp,
        textAlign: TextAlign.center,
        color: AppColor.black000000.withValues(alpha: 0.6),
      ),
      yHeight(16.h),
      ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Column(
            children: [
              ListTile(
                minTileHeight: 8,
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/2.jpg"),
                ),
                title: AppText(
                  text: "User name",
                  textSize: 14.sp,
                  fontFamily: AppFonts.satoshiBold,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: AppText(
                    text: "test@yopmail.com",
                    textSize: 12.sp,
                    fontFamily: AppFonts.satoshiRegular,
                    color: AppColor.color212121.withValues(alpha: 0.5),
                  ),
                ),
                trailing: SvgPicture.asset(
                  (isSelected) ? Assets.radio : Assets.radioOff,
                ),
                onTap: () {},
              ),
              if (index != 2)
                Divider(
                  color: AppColor.colorDDDDDD.withValues(alpha: .9),
                ),
            ],
          );
        },
      ),
      yHeight(15),
      CommonAppBtn(
          title: AppString.continueText.tr(),
          onTap: () {
            back(context);
            toNamed(context, Routes.bookYourDateView);
          })
    ],
  );
}
