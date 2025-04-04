import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

import '../../../../home/presentation/view/home_view_main.dart';
import '../../../../z_common_widgets/custom_cache_network_image.dart';

part 'chat_app_bar.dart';
part 'message_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteFFFFFF,
      body: Column(
        children: [
          ChatAppBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemBuilder: (context, index) {
                final isMyMessage = index % 2 == 0;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: MessageWidget(index: index).align(
                      alignment: isMyMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  hintText: "Message...",
                  prefixIcon: SvgPicture.asset(Assets.emojiIcon),
                )),
                xWidth(15.w),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(Assets.sendBtn),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
