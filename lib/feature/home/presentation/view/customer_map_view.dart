part of 'home_view_main.dart';

class CustomerMapView extends StatelessWidget {
  const CustomerMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!Getters.isAgent()) ...{
          yHeight(safeAreaHeight(context) + 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search location...",
                    prefixIcon: SvgPicture.asset(Assets.searchIcon),
                  ),
                ),
                xWidth(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.black000000,
                  ),
                  padding: EdgeInsets.all(14),
                  child: SvgPicture.asset(Assets.filterIcon),
                ),
              ],
            ),
          ),
          yHeight(10.h)
        },
        Expanded(child: AppText(text: "MAP VIEW PENDING").align())
      ],
    );
  }
}
