import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_dotted_border.dart';

class CustomAddWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomAddWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: CommonDottedBorder(
          child: SizedBox(
            height: 122,
            width: context.width * .25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.upload,
                  colorFilter: const ColorFilter.mode(
                      AppColor.color7A7A7A, BlendMode.srcIn),
                ),
                const SizedBox(height: 8),
                AppText(
                  text: AppString.uploadImage,
                  textSize: 11.sp,
                  color: AppColor.color7A7A7A,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
