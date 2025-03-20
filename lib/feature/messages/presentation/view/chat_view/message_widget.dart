part of 'chat_view_main.dart';

class MessageWidget extends StatelessWidget {
  final int index;

  const MessageWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final isMyMessage = index % 2 == 0;
    if (!isMyMessage) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCacheNetworkImage(
            img: "",
            size: 50.sp,
          ),
          xWidth(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Savannah Nguyen",
                fontFamily: AppFonts.satoshiBold,
                textSize: 14.sp,
              ),
              yHeight(10),
              simpleMessageWidget(isMyMessage, context)
            ],
          )
        ],
      );
    } else {
      return simpleMessageWidget(isMyMessage, context);
    }
  }

  Widget simpleMessageWidget(bool isMyMessage, BuildContext context) {
    if (index == 3) {
      return bookingMessageWidget(context, isMyMessage);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17.h),
          constraints: BoxConstraints(maxWidth: screenWidth(context) / 1.3),
          decoration: BoxDecoration(
              color: isMyMessage ? AppColor.black000000 : AppColor.colorF3F3F3,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(isMyMessage ? 0 : 12),
                topLeft: Radius.circular(isMyMessage ? 12 : 0),
              )),
          child: AppText(
            text: "Hi! I’m doing well",
            color: isMyMessage ? AppColor.whiteFFFFFF : AppColor.black000000,
            textSize: 14.sp,
          ),
        ),
        yHeight(10),
        AppText(
          text: "09:25 AM",
          textSize: 10.sp,
          color: AppColor.color797C7B80,
        ),
      ],
    );
  }

  /// Widget for booked a visit
  Widget bookingMessageWidget(BuildContext context, bool isMyMessage) {
    final textColor = isMyMessage ? AppColor.whiteFFFFFF : AppColor.black000000;

    return Container(
      margin: EdgeInsets.only(bottom: 15.h, left: 2, right: 2),
      constraints: BoxConstraints(maxWidth: screenWidth(context) / 1.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isMyMessage ? AppColor.color1E2430 : AppColor.whiteFFFFFF,
        boxShadow: [
          BoxShadow(
            color: AppColor.black232323.withValues(alpha: 0.1),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          yHeight(10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isMyMessage
                  ? AppColor.whiteFFFFFF.withValues(alpha: 0.06)
                  : AppColor.colorFAFAFA,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Booked a visit:",
                  textSize: 12.sp,
                  fontFamily: AppFonts.satoshiBold,
                  color: textColor,
                ),
                yHeight(10),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.calendarIcon,
                      width: 16,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    xWidth(5),
                    AppText(
                      text: "October 25, 2019",
                      textSize: 12.sp,
                      color: textColor,
                    ),
                    xWidth(10),
                    Container(
                      height: 15,
                      width: 1,
                      color: textColor,
                    ),
                    xWidth(10),
                    SvgPicture.asset(
                      Assets.clockIcon,
                      width: 16,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    xWidth(5),
                    AppText(
                      text: "12:00PM",
                      textSize: 12.sp,
                      color: textColor,
                    ),
                  ],
                )
              ],
            ),
          ),
          yHeight(15),
          PropertyBox(
            showHorizontal: true,
            imageHeight: 80.sp,
            imageWidth: 80.sp,
            showFavorite: false,
            withFullCardWidth: true,
            textColor: textColor,
          )
        ],
      ),
    );
  }
}
