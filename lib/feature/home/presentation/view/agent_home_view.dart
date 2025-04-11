part of 'home_view_main.dart';

class AgentHomeView extends StatelessWidget {
  const AgentHomeView({super.key});

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              yHeight(25.h),
              AppText(
                text: AppString.dashboard.tr(),
                fontFamily: AppFonts.satoshiBold,
                textSize: 17.sp,
              ),
              yHeight(20.h),
              Row(
                children: [
                  dashboardBox(
                    icon: Assets.earnedIcon,
                    title: "Total Income Earned",
                    value: "\$567",
                  ),
                  xWidth(20),
                  dashboardBox(
                    icon: Assets.assignedIcon,
                    title: "Assigned Properties",
                    value: "20",
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Search location...",
                      prefixIcon: SvgPicture.asset(Assets.searchIcon),
                      // readOnly: true,
                      // onTap: () => toNamed(context, Routes.searchPropertyView),
                    ),
                  ),
                  xWidth(20),
                  InkWell(
                    // onTap: () => toNamed(context, Routes.customFilterScreen),
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
              yHeight(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: AppString.recentlyAssignedProperties.tr(),
                    fontFamily: AppFonts.satoshiBold,
                    textSize: 17.sp,
                  ),
                  InkWell(
                    onTap: () =>
                        toNamed(context, Routes.customViewAllScreen, args: {
                      "title": AppString.assignedProperties,
                    }),
                    child: AppText(
                      text: AppString.seeAll.tr(),
                      color: AppColor.primary,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                  ),
                ],
              ),
              yHeight(20.h),
              GridView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        Utils.cardWidth(context) / Utils.cardHeight(context),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return PropertyBox(
                    showFavorite: false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardBox(
      {required String icon, required String title, required String value}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColor.whiteFFFFFF,
          boxShadow: [
            BoxShadow(
              color: AppColor.black232323.withValues(alpha: 0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                xWidth(5),
                Expanded(
                  child: AppText(
                    text: title.tr(),
                    textSize: 12.sp,
                  ),
                ),
              ],
            ),
            yHeight(10),
            AppText(
              text: value.tr(),
              fontFamily: AppFonts.satoshiBold,
              textSize: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
