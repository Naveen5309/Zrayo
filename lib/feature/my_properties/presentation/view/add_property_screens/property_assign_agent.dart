import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class AddPropertyAgentView extends ConsumerStatefulWidget {
  final List<Map<String, String>> users = [
    {
      "name": "Jerome Bell",
      "image": "https://randomuser.me/api/portraits/women/1.jpg"
    },
    {
      "name": "Dianne Russell",
      "image": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "Cameron Williamson",
      "image": "https://randomuser.me/api/portraits/women/2.jpg"
    },
  ];
  AddPropertyAgentView({super.key});

  @override
  ConsumerState<AddPropertyAgentView> createState() =>
      _PropertyAssignAgentViewState();
}

class _PropertyAssignAgentViewState
    extends ConsumerState<AddPropertyAgentView> {
  String? _propertyType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.addProperty),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                yHeight(20.h),
                AppText(
                  text: AppString.assignAgent,
                  textSize: 15.sp,
                  fontFamily: AppFonts.satoshiBold,
                ),
                yHeight(10),
                Row(
                  children: [
                    _buildRadioButton(AppString.yes),
                    SizedBox(width: 20.w),
                    _buildRadioButton(AppString.no),
                  ],
                ),
                yHeight(10.h),
                Wrap(
                  spacing: 15.0,
                  runSpacing: 12.0,
                  children: widget.users.map((user) {
                    return _buildUserChip(user["name"]!, user["image"]!);
                  }).toList(),
                ),
                yHeight(20.h),
                CustomTextField(
                  readOnly: true,
                  labelText: AppString.setCommissionPercentage,
                  hintText: AppString.enterPercentage,
                  controller: TextEditingController(),
                ),
                yHeight(context.height / 4.5),
                CommonAppBtn(
                  title: AppString.next,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserChip(String name, String imageUrl) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.color21203F.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 15,
          ),
          xWidth(8),
          AppText(
            text: name,
            textSize: 14.sp,
          ),
          xWidth(8),
          GestureDetector(onTap: () {}, child: SvgPicture.asset(Assets.x)),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String label) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColor.colorB7B7B7,
      ),
      child: Row(
        children: [
          Radio<String>(
            value: label,
            groupValue: _propertyType,
            activeColor: AppColor.primary,
            onChanged: (value) {
              setState(() {
                _propertyType = value;
              });
            },
          ),
          Text(label, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
