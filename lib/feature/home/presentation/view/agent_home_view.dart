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
                  InkWell(
                    onTap: () => toNamed(context, Routes.customViewAllScreen,
                        args: {"title": "Assigned Properties"}),
                    child: AppText(
                      text: "See all",
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

Widget ratingWidget(BuildContext context, WidgetRef ref) {
  final rating = ref.watch(ratingProvider);

  return Scaffold(
    appBar: AppBar(title: Text("Rate Your Visit")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Share Your Feedback & Rate of Your Last Visit",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SvgPicture.asset(Assets.bank)),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The East Apartment",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "St. Park 135, New York",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "\$12,589",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  Icons.star,
                  color: index < rating ? Colors.amber : Colors.grey,
                ),
                onPressed: () =>
                    ref.read(ratingProvider.notifier).state = index + 1,
              );
            }),
          ),
          SizedBox(height: 20),
          Text("Description"),
          CustomTextField(
            hintText: "Enter description",
            border: OutlineInputBorder(),
            maxLines: 4,
            minLines: 4,
          ),
        ],
      ),
    ),
  );
}
