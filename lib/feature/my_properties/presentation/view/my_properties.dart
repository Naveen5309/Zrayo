import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

import '../../../../config/app_utils.dart';
import '../../../../config/helper.dart';
import '../../../home/presentation/view/home_view_main.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        child: Icon(
          CupertinoIcons.plus,
          size: 30.sp,
        ),
        onPressed: () {
          toNamed(context, Routes.myPropertyBio);
        },
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: "My Properties",
            showNotificationIcon: true,
            showBackButton: false,
          ),
          yHeight(10),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      Utils.cardWidth(context) / Utils.cardHeight(context),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return PropertyBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
