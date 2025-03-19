import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

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
        margin: EdgeInsets.symmetric(
            horizontal: context.width * .02, vertical: context.width * .02),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                      height: 50, width: 50, child: SvgPicture.asset(imageUrl)),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AppText(
                          text: name,
                          textSize: 16.sp,
                          fontFamily: AppFonts.satoshiBold,
                          maxlines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        8.verticalSpace,
                        AppText(
                            text: message,
                            textSize: 14.sp,
                            maxlines: 1,
                            overflow: TextOverflow.ellipsis,
                            color: unreadCount > 0
                                ? AppColor.black000000
                                : AppColor.grey040F2529),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: time,
                        textSize: 12.sp,
                        color: AppColor.greyAAA6B9,
                      ),
                      if (unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
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
            ),
            Divider(
              thickness: 1.sp,
              color: AppColor.black000000.withOpacity(.1),
            )
          ],
        ),
      ),
    );
  }
}
