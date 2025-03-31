part of 'property_detail_view.dart';

class AgentsLandlordList extends StatelessWidget {
  final bool isAgentProperty;
  const AgentsLandlordList({super.key, this.isAgentProperty = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "List of Agents & Landlord ",
            textSize: 16.sp,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(15.h),
          Container(
            decoration: Utils.boxDecoWithShadow(),
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                agentBox(context),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Getters.isAgent() ? 0 : 3,
                  padding: EdgeInsets.only(top: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 2 ? 0 : 16),
                      child: agentBox(context),
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

  Widget agentBox(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                  Row(
                    children: [
                      AppText(
                        text: "Dianne Russell",
                        fontFamily: AppFonts.satoshiBold,
                        // textSize: 18.sp,
                      ),
                      xWidth(10),
                      if (Getters.isAgent())
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.primary.withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(33)),
                          width: 50.w,
                          height: 19.h,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: AppText(
                              color: AppColor.primary,
                              text: AppString.landloard,
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
              SvgPicture.asset(Assets.messageIcon)
          ],
        ),
        if (Getters.isAgent()) ...{
          yHeight(15),
          Divider(
            color: AppColor.black000000,
          ),
          yHeight(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    textSize: 14.sp,
                    fontFamily: AppFonts.satoshiRegular,
                    text: AppString.giveyourReviews,
                  ),
                  yHeight(5),
                  AppText(
                    fontFamily: AppFonts.satoshiBold,
                    text: AppString.giveRatingtoLandloard,
                  )
                ],
              ),
              CommonAppBtn(
                width: screenWidth(context) / 4.5,
                height: screenHeight(context) * 0.059,
                title: AppString.giveRatings,
                onTap: () => Utils.appBottomSheet(
                    context: context,
                    widget: ReviewBottomsheet(
                      name: "Paras",
                      isProperty: true,
                      title: AppString.giveRatings,
                      subtitle: AppString.propertyDeleted,
                    )),
                textSize: 13.sp,
              )
            ],
          )
        }
      ],
    );
  }
}
