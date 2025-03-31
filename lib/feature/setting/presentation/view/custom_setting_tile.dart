import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';

class SettingTile extends StatelessWidget {
  final String icon;
  final String title;
  final Color? textColor;
  final bool hasToggle;
  final bool toggleValue;
  final ValueChanged<bool>? onToggleChanged;
  final VoidCallback? onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.hasToggle = false,
    this.textColor,
    this.toggleValue = false,
    this.onToggleChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColor.whiteFFFFFF,
          borderRadius: BorderRadius.all(Radius.circular(22)),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey99ABC6.withValues(alpha: 0.18),
              blurRadius: 62,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: hasToggle ? null : onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(icon),
                ),
                xWidth(10),
                AppText(
                  text: title,
                  textSize: 15.sp,
                  color: textColor ?? AppColor.black111111,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                if (hasToggle)
                  GestureDetector(
                    onTap: () => onToggleChanged?.call(!toggleValue),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: toggleValue
                            ? AppColor.primary
                            : AppColor.greyEDEDED,
                        borderRadius: BorderRadius.circular(500),
                        border:
                            Border.all(width: 2, color: AppColor.greyDBDBDB),
                      ),
                      child: Align(
                        alignment: toggleValue
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: AppColor.whiteFFFFFF,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!hasToggle)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: AppColor.black160C08,
                  ),
                xWidth(15)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
