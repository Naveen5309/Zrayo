part of 'property_detail_view.dart';
class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: "Booking",
          textSize: 16.sp,
          fontFamily: AppFonts.satoshiBold,
        ),
        yHeight(15.h),
        Container(
          decoration: Utils.boxDecoWithShadow(),
          padding: EdgeInsets.all(16.sp),
          child: Column(
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
                        AppText(
                          text: "Dianne Russell",
                          fontFamily: AppFonts.satoshiBold,
                          // textSize: 18.sp,
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
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Date",
                        textSize: 14.sp,
                        fontFamily: AppFonts.satoshiRegular,
                        lineHeight: 1.4,
                      ),
                      yHeight(5.h),
                      AppText(
                        text: "Oct 25, 2019",
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
                        text: "Time",
                        textSize: 14.sp,
                        fontFamily: AppFonts.satoshiRegular,
                        lineHeight: 1.4,
                      ),
                      yHeight(5.h),
                      AppText(
                        text: "11:00 AM",
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
                        text: "Viewing Fees",
                        textSize: 14.sp,
                        fontFamily: AppFonts.satoshiRegular,
                        lineHeight: 1.4,
                      ),
                      yHeight(5.h),
                      AppText(
                        text: "\$120",
                        textSize: 14.sp,
                        fontFamily: AppFonts.satoshiBold,
                        lineHeight: 1.4,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
