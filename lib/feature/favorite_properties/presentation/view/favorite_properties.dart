import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

import '../../../home/presentation/view/home_view_main.dart';

class FavoriteProperties extends StatelessWidget {
  const FavoriteProperties({super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = screenWidth(context) / 3.2;
    double cardHeight = screenHeight(context) / 4;
    return Column(
      children: [
        CustomAppBar(
          title: "Favorite Properties",
          showNotificationIcon: true,
          showBackButton: false,
        ),
        yHeight(10),
        Expanded(
          child: GridView.builder(
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: cardWidth / cardHeight,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return PropertyBox();
            },
          ),
        )
      ],
    );
  }
}
