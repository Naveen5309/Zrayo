part of 'history_view.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.sp,
      width: double.infinity,
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
          color: AppColor.colorF6F6F6, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(child: tabBox(title: "For Sale", isSelected: true)),
          Expanded(child: tabBox(title: "For Rental"))
        ],
      ),
    );
  }

  Widget tabBox({required String title, bool isSelected = false}) {
    return Container(
      height: 52.sp,
      width: double.infinity,
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.whiteFFFFFF : AppColor.transparent,
          borderRadius: BorderRadius.circular(6)),
      alignment: Alignment.center,
      child: AppText(
        text: title,
        fontFamily: isSelected ? AppFonts.satoshiBold : null,
        color: isSelected ? null : AppColor.color8E8E8E,
      ),
    );
  }
}
