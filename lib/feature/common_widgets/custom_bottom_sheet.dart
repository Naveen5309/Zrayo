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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: mainAxisSize,
        spacing: 14.sp,
        children: [
          yHeight(0),
          Container(
            padding: EdgeInsets.all(3.sp),
            width: 70.sp,
            decoration: BoxDecoration(
              color:
                  AppColor.primary,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          Flexible(child: content),
        ],
      ),
    );
  }
}
