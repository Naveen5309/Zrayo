import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/home_view_main.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

import '../../../../config/assets.dart';
import '../../../../core/utils/routing/routes.dart';
import '../../../z_common_widgets/custom_text_field.dart';

class CustomViewAllScreen extends StatelessWidget {
  final String? title;

  const CustomViewAllScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          yHeight(10),
          CustomAppBar(title: title ?? ""),
          yHeight(15.h),
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
                InkWell(
                  onTap: () => toNamed(context, Routes.customFilterScreen),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.black000000,
                    ),
                    padding: EdgeInsets.all(14),
                    child: SvgPicture.asset(Assets.filterIcon),
                  ),
                ),
              ],
            ),
          ),

          yHeight(10),
          Expanded(
              child: GridView.builder(
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  Utils.cardWidth(context) / Utils.cardHeight(context),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return PropertyBox();
            },
          ))
        ],
      ),
    );
  }
}

