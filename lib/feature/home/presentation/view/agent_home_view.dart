part of 'home_view_main.dart';

class AgentHomeView extends StatelessWidget {
  const AgentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = screenWidth(context) / 3.2;
    double cardHeight = screenHeight(context) / 4;
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
                text: "Dashboard",
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
              yHeight(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Recently Assigned Properties",
                    fontFamily: AppFonts.satoshiBold,
                    textSize: 17.sp,
                  ),
                  AppText(
                    text: "See all",
                    color: AppColor.primary,
                    fontFamily: AppFonts.satoshiBold,
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
                    childAspectRatio: cardWidth / cardHeight,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return PropertyBox();
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
        padding: EdgeInsets.symmetric(vertical:14.sp,horizontal: 10),
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
                    text: title,
                    textSize: 12.sp,
                  ),
                ),
              ],
            ),
            yHeight(10),
            AppText(
              text: value,
              fontFamily: AppFonts.satoshiBold,
              textSize: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
