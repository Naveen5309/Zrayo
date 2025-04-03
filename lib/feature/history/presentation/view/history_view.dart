import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_property_type_filter_content.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

import '../../../../config/app_utils.dart';
import '../../../../config/assets.dart';
import '../../../../config/helper.dart';
import '../../../home/presentation/view/home_view_main.dart';
import '../../../z_common_widgets/custom_text_field.dart';

part 'custom_tab_bar.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "History",
            showNotificationIcon: true,
            showBackButton: false,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  yHeight(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: "Search location...",
                          prefixIcon: SvgPicture.asset(Assets.searchIcon),
                        ),
                      ),
                      xWidth(20),
                      InkWell(
                        onTap: () {
                          Utils.appBottomSheet(
                              isScrolled: true,
                              context: context,
                              barOnTop: false,
                              widget: CommonPropertyTypeFilterContent());
                        },
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
                  yHeight(10),
                  Expanded(
                      child: GridView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: Utils.cardWidth(context) /
                            Utils.cardHeight(context),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return PropertyBox(
                        showFavorite: false,
                        onTap: () => toNamed(context, Routes.propertyDetailView,
                            args: {"isSold": true}),
                      );
                    },
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
