import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.content,this.barOnTop=true, this.mainAxisSize = MainAxisSize.min});
  final Widget content;
  final bool barOnTop;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.sp),
      child: Column(
        mainAxisSize: mainAxisSize,
        spacing: 14.sp,
        children: [
          if(barOnTop)
          Container(
            padding: EdgeInsets.all(3.sp),
            width: screenWidth(context)/2.7,
            decoration: BoxDecoration(
              color:
                  AppColor.colorAEAEAE,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          content,
        ],
      ),
    );
  }
}
