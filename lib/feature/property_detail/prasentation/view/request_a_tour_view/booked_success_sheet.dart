part of 'book_your_date_view.dart';

class BookedSuccessSheet extends StatelessWidget {
  const BookedSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        yHeight(20.sp),
        SvgPicture.asset(Assets.successTick),
        yHeight(15.sp),
        AppText(
          text: "Booked Successfully!",
          textSize: 24.sp,
          fontFamily: AppFonts.satoshiBold,
        ),
        yHeight(10.sp),
        AppText(
          text:
              "Your property visit is successfully booked. Please reach at the location on time.",
          fontFamily: AppFonts.satoshiRegular,
          textAlign: TextAlign.center,
          lineHeight: 1.2,
        ),
        yHeight(20.sp),
        CommonAppBtn(
          title: "Go Back",
          onTap: () {
            back(context);
            back(context);
          },
        ),
        yHeight(20.sp),
      ],
    );
  }
}
