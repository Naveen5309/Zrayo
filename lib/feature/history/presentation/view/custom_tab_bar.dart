part of 'history_view.dart';

class CustomTabBar extends StatelessWidget {
  final String firstString, secondString;
  final int selectedIndex;
  final ValueChanged<int> onChange;

  const CustomTabBar({
    super.key,
    required this.firstString,
    required this.secondString,
    required this.selectedIndex,
    required this.onChange,
  });

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
          Expanded(child: tabBox(title: firstString, value: 0)),
          Expanded(child: tabBox(title: secondString, value: 1))
        ],
      ),
    );
  }

  Widget tabBox({required String title, required int value}) {
    final isSelected = selectedIndex == value;
    return GestureDetector(
      onTap: () => onChange(value),
      child: Container(
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
      ),
    );
  }
}
