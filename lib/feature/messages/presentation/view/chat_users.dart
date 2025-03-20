import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/messages/presentation/view/chat_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class ChatUsersListView extends StatelessWidget {
  const ChatUsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            title: AppString.message,
            showBackButton: false,
            showNotificationIcon: true,
          ),
          yHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              hintText: AppString.search,
              prefixIcon: SvgPicture.asset(Assets.searchIcon),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatTile(
                  name: "Jenny Wilson",
                  message: "Oh yes, please send your CV/Res  software company",
                  time: "8m ago",
                  unreadCount: 0,
                  imageUrl: Assets.placeholder,
                  onTap: () => toNamed(context, Routes.chatView),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
