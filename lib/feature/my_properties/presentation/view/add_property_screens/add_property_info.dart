import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

class AddPropertyInfo extends StatelessWidget {
  const AddPropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.addProperty),
          Container(
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: true ? AppColor.primary : AppColor.colorB7B7B7,
                    width: 2)),
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: false ? AppColor.transparent : AppColor.primary),
            ),
          )
        ],
      ),
    );
  }
}
