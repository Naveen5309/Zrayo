part of 'property_detail_view.dart';

class AgentsLandlordList extends StatelessWidget {
  const AgentsLandlordList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "List of Agents & Landlord ",
            textSize: 19.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(15.h),
          Container(
            decoration: Utils.boxDecoWithShadow(),
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                agentBox(),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  padding: EdgeInsets.only(top: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 2 ? 0 : 16),
                      child: agentBox(),
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

  Widget agentBox() {
    return Row(
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
        CustomRatingBox(rating: "4.8")
      ],
    );
  }
}
