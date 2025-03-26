import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/home/presentation/providers/home_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_rating_box.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

import '../../../../config/app_utils.dart';
import '../../../../config/enums.dart';

part 'customer_home_view.dart';

part 'customer_map_view.dart';

part 'agent_home_view.dart';

part 'property_box.dart';

class HomeViewMain extends ConsumerWidget {
  const HomeViewMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    return Scaffold(
      floatingActionButton: Getters.isAgent()
          ? SizedBox.shrink()
          : FloatingActionButton(
              onPressed: () {
                homeNotifier.updateCustomerHomeView();
              },
              backgroundColor: AppColor.primary,
              child: SvgPicture.asset(Assets.mapTrifold),
            ),
      body: (homeNotifier.selectedCustomerHomePageType ==
                  CustomerHomePageTypesEnum.list ||
              Getters.isAgent())
          ? Container(
              color: AppColor.primary,
              height: screenHeight(context),
              width: screenWidth(context),
              child: Column(
                children: [
                  yHeight(15.h),
                  CustomAppBar(
                    title: "Hello, Rachel 👋",
                    subTitle: "Let’s find your cozy place ",
                    titleColor: AppColor.whiteFFFFFF,
                    showBackButton: false,
                    showNotificationIcon: true,
                    isFromHome: true,
                  ),
                  yHeight(30.h),
                  if (!Getters.isAgent()) ...{
                    Expanded(
                      child: CustomerHomeView(),
                    )
                  } else ...{
                    Expanded(
                      child: AgentHomeView(),
                    )
                  }
                ],
              ),
            )
          : CustomerMapView(),
    );
  }
}

Widget ratingWidget(BuildContext context, WidgetRef ref) {
  final rating = ref.watch(ratingProvider);

  return Scaffold(
    appBar: AppBar(title: Text("Rate Your Visit")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Share Your Feedback & Rate of Your Last Visit",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SvgPicture.asset(Assets.bank)),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The East Apartment",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "St. Park 135, New York",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "\$12,589",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  Icons.star,
                  color: index < rating ? Colors.amber : Colors.grey,
                ),
                onPressed: () =>
                    ref.read(ratingProvider.notifier).state = index + 1,
              );
            }),
          ),
          SizedBox(height: 20),
          Text("Description"),
          CustomTextField(
            hintText: "Enter description",
            border: OutlineInputBorder(),
            maxLines: 4,
            minLines: 4,
          ),
        ],
      ),
    ),
  );
}
