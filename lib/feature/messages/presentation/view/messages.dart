import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/messages/presentation/view/chat_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(
              title: AppString.message,
              showBackButton: false,
              showNotificationIcon: true,
            ),
            CustomTextField(
              hintText: AppString.searchLocation,
              prefixIcon: SvgPicture.asset(Assets.searchIcon),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return ChatTile(
                  name: "Paras",
                  message: "Paras technology is an App software company",
                  time: "8m ago",
                  unreadCount: 0,
                  imageUrl: Assets.placeholder,
                  onTap: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
