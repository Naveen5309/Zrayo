import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.content, this.mainAxisSize = MainAxisSize.min});
  final Widget content;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: context.theme.bottomSheetTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18.sp),
            topLeft: Radius.circular(18.sp),
          ),
          border: Border.all(color: Colors.transparent)),
      padding: EdgeInsets.all(22.sp),
      child: Column(
        mainAxisSize: mainAxisSize,
        spacing: 14.sp,
        children: [
          Container(
            padding: EdgeInsets.all(4.sp),
            width: 60.sp,
            decoration: BoxDecoration(
              color:
                  AppColor.grey040F2529,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          Flexible(child: content),
        ],
      ),
    );
  }
}
