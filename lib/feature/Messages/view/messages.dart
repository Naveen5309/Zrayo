import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/Messages/view/chat_tile.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
        child: Column(
          children: [
            yHeight(context.height / 7),
            ChatTile(
                name: "Paras",
                message: "Paras technology is a software company",
                time: "5m ago",
                unreadCount: 2,
                imageUrl: Assets.placeholder,
                onTap: () {}),
            ChatTile(
                name: "Paras",
                message: "Paras technology is a software company",
                time: "5m ago",
                unreadCount: 0,
                imageUrl: Assets.placeholder,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
