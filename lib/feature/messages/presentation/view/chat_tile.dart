import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_cache_network_image.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String imageUrl;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.width * .02),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: CustomCacheNetworkImage(
                        img:
                            "https://cdn.pixabay.com/photo/2017/07/08/02/16/house-2483336_640.jpg",
                        size: 55,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CustomCacheNetworkImage(
                        img:
                            "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D",
                        size: 33,
                      ),
                    )
                  ],
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              text: name,
                              textSize: 16.sp,
                              fontFamily: AppFonts.satoshiBold,
                              maxlines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                                text: message,
                                textSize: 14.sp,
                                maxlines: 1,
                                overflow: TextOverflow.ellipsis,
                                color: unreadCount > 0
                                    ? AppColor.black000000
                                    : AppColor.grey999999),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      text: time,
                      textSize: 12.sp,
                      fontFamily: AppFonts.satoshiRegular,
                      color: AppColor.greyAAA6B9,
                    ),
                    if (unreadCount > 0)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary,
                        ),
                        child: AppText(
                          text: unreadCount.toString(),
                          textSize: 10,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            yHeight(context.width * .03),
            Divider(
              color: AppColor.black000000.withValues(alpha: .1),
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}
