import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
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
      "name": "Diane Rusell",
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
  List<Map<String, dynamic>> users = [
    {
      "name": "Floyd Miles",
      "phone": "(205) 555-0100",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "selected": true
    },
    {
      "name": "Jenny Wilson",
      "phone": "(702) 555-0122",
      "image": "https://randomuser.me/api/portraits/women/1.jpg",
      "selected": false
    },
    {
      "name": "Jane Cooper",
      "phone": "(406) 555-0120",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
      "selected": false
    },
    {
      "name": "Floyd Miles",
      "phone": "(205) 555-0100",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "selected": true
    },
    {
      "name": "Jenny Wilson",
      "phone": "(702) 555-0122",
      "image": "https://randomuser.me/api/portraits/women/1.jpg",
      "selected": false
    },
    {
      "name": "Jane Cooper",
      "phone": "(406) 555-0120",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
      "selected": false
    },
  ];

  void toggleSelection(int index) {
    setState(() {
      for (var user in users) {
        user["selected"] = false;
      }
      users[index]["selected"] = true;
    });
  }

  String? _propertyType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppString.addProperty),
            Container(
              height: 5,
              color: AppColor.orangeFff9f0,
              width: screenWidth(context),
              child: Row(
                children: [
                  Container(
                    height: 5,
                    width: (screenWidth(context) / 5) * 5,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
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
                    spacing: 14.0,
                    runSpacing: 12.0,
                    children: widget.users.map((user) {
                      return _buildUserChip(user["name"]!, user["image"]!);
                    }).toList(),
                  ),
                  yHeight(20.h),
                  CustomTextField(
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
      ),
    );
  }

  Widget _buildUserChip(String name, String imageUrl) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.color21203F.withValues(alpha: .04),
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
              if (value == AppString.yes) {
                Utils.appBottomSheet(context: context, widget: bottomSheet());
              }
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _propertyType = label;
              });

              if (label == AppString.yes) {
                Utils.appBottomSheet(context: context, widget: bottomSheet());
              }
            },
            child: Text(label, style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          yHeight(12),
          AppText(
            text: AppString.chooseAgents,
            fontFamily: AppFonts.satoshiBold,
          ),
          yHeight(12),
          AppText(
            text: AppString.slectAgent,
            fontFamily: AppFonts.satoshiRegular,
            textSize: 13.sp,
            lineHeight: 1.2,
            color: AppColor.black000000.withValues(alpha: 0.6),
          ),
          yHeight(16.h),
          CustomTextField(
            hintText: AppString.search,
            prefixIcon: SvgPicture.asset(Assets.searchIcon),
          ),
          yHeight(16.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Column(
                children: [
                  ListTile(
                    minTileHeight: 8,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user["image"] ?? ""),
                    ),
                    title: AppText(
                      text: user["name"] ?? "Unknown",
                      textSize: 14.sp,
                      fontFamily: AppFonts.satoshiBold,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: AppText(
                        text: user["phone"] ?? "No number",
                        textSize: 12.sp,
                        fontFamily: AppFonts.satoshiRegular,
                        color: AppColor.color212121.withValues(alpha: 0.5),
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      (user["selected"] ?? false)
                          ? Assets.lucideTrue
                          : Assets.lucide,
                    ),
                    onTap: () {
                      setState(() {
                        users[index]["selected"] =
                            !(users[index]["selected"] ?? false);
                      });
                    },
                  ),
                  if (index != users.length - 1)
                    Divider(
                      color: AppColor.black000000.withValues(alpha: 0.5),
                    ),
                ],
              );
            },
          ),
          yHeight(15),
          CommonAppBtn(
            title: AppString.continueText,
          )
        ],
      ),
    );
  }
}
