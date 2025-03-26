part of '../property_detail/prasentation/view/request_a_tour_view/book_your_date_view.dart';

class SuccessSheet extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;
  const SuccessSheet({super.key, this.title, this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        yHeight(20.sp),
        SvgPicture.asset(Assets.successTick),
        yHeight(15.sp),
        AppText(
          text: title.toString(),
          //  "Booked Successfully!",
          textSize: 23.sp,
          fontFamily: AppFonts.satoshiBold,
        ),
        yHeight(10.sp),
        AppText(
          text: subTitle.toString(),
          // "Your property visit is successfully booked. Please reach at the location on time.",
          fontFamily: AppFonts.satoshiRegular,
          textAlign: TextAlign.center, textSize: 14.sp,

          lineHeight: 1.2,
        ),
        yHeight(20.sp),
        CommonAppBtn(
          title: "Go Back",
          onTap: onTap ?? () {},
        ),
        yHeight(20.sp),
      ],
    );
  }
}
