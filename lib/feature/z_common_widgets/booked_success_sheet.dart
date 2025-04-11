part of '../property_detail/prasentation/view/request_a_tour_view/book_your_date_view.dart';

class SuccessSheet extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;
  const SuccessSheet({super.key, this.title, this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        yHeight(20.sp),
        SvgPicture.asset(Assets.successTick),
        yHeight(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: title ?? ''.tr(),
              //  "Booked Successfully!",
              textAlign: TextAlign.center,
              textSize: 20.sp,
              fontFamily: AppFonts.satoshiBold,
            ).align(),
          ],
        ),
        yHeight(10.sp),
        AppText(
          text: subTitle ?? ''.tr(),
          // "Your property visit is successfully booked. Please reach at the location on time.",
          fontFamily: AppFonts.satoshiRegular,
          textAlign: TextAlign.center, textSize: 14.sp,

          lineHeight: 1.2,
        ),
        yHeight(20.sp),
        CommonAppBtn(
          title: AppString.goBack.tr(),
          onTap: onTap ??
              () {
                back(context);
              },
        ),
        yHeight(20.sp),
      ],
    );
  }
}
