part of 'home_view_main.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.whiteFFFFFF,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      child: Column(
        children: [
          yHeight(20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search location...",
                    prefixIcon: SvgPicture.asset(Assets.searchIcon),
                    readOnly: true,
                    onTap: () => toNamed(context, Routes.searchPropertyView),
                  ),
                ),
                xWidth(20),
                InkWell(
                  onTap: () => toNamed(context, Routes.customFilterScreen),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.black000000,
                    ),
                    padding: EdgeInsets.all(14),
                    child: SvgPicture.asset(Assets.filterIcon),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                yHeight(25.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: AppString.featuredProperties.tr(),
                        fontFamily: AppFonts.satoshiBold,
                        textSize: 17.sp,
                      ),
                      InkWell(
                        onTap: () => toNamed(
                            context, Routes.customViewAllScreen,
                            args: {"title": AppString.featuredProperties.tr()}),
                        child: AppText(
                          text: AppString.seeAll.tr(),
                          color: AppColor.primary,
                          fontFamily: AppFonts.satoshiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                yHeight(20.h),
                SizedBox(
                  height: 112.h,
                  child: ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PropertyBox(showHorizontal: true);
                    },
                  ),
                ),
                yHeight(25.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: AppString.nearbyProperties.tr(),
                        fontFamily: AppFonts.satoshiBold,
                        textSize: 17.sp,
                      ),
                      InkWell(
                        onTap: () => toNamed(
                            context, Routes.customViewAllScreen,
                            args: {"title": AppString.nearbyProperties.tr()}),
                        child: AppText(
                          text: AppString.seeAll.tr(),
                          color: AppColor.primary,
                          fontFamily: AppFonts.satoshiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                yHeight(20.h),
                GridView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        Utils.cardWidth(context) / Utils.cardHeight(context),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return PropertyBox();
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
