part of 'property_detail_view.dart';

class PropertyHistoricalData extends StatelessWidget {
  const PropertyHistoricalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: AppString.historicalData,
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
                    Expanded(
                        child: AppText(
                      text: AppString.date.tr(),
                      fontFamily: AppFonts.satoshiBold,
                    )),
                    Expanded(
                        child: AppText(
                      text: AppString.event.tr(),
                      fontFamily: AppFonts.satoshiBold,
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: AppText(
                        text: AppString.price.tr(),
                        fontFamily: AppFonts.satoshiBold,
                      ),
                    )),
                  ],
                ),
                yHeight(10),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: "1/15/2025"),
                          AppText(
                            text: "Price change",
                            fontFamily: AppFonts.satoshiRegular,
                          ),
                          AppText(
                            text: "US\$375,000\nUS\$168/sqft\n-3.8%",
                            lineHeight: 1.5,
                            fontFamily: AppFonts.satoshiRegular,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
