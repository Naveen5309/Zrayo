part of 'property_detail_view.dart';

class PropertyFeaturesList extends StatelessWidget {
  const PropertyFeaturesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Features",
            textSize: 19.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(15.h),
          Container(
            decoration: Utils.boxDecoWithShadow(),
            padding: EdgeInsets.all(16.sp),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
              ),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SvgPicture.asset(Assets.circleCheckIcon),
                    xWidth(5),
                    AppText(text: "Air Condition"),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
