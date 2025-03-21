import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/profile_card.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_text_field.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteFFFFFF,
      body: Column(
        children: [
          CustomAppBar(title: AppString.myProfile),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                yHeight(context.height / 15),
                profileCardWidget(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        prefixIcon: SvgPicture.asset(Assets.person),
                        controller: TextEditingController(text: "Paras"),
                      ),
                    ),
                    xWidth(10),
                    Expanded(
                      child: CustomTextField(
                        prefixIcon: SvgPicture.asset(Assets.person),
                        controller: TextEditingController(text: "robi"),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(Assets.callCalling),
                  controller: TextEditingController(text: "+1 3233333"),
                ),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(Assets.cake),
                  controller: TextEditingController(text: "01/08/1997"),
                ),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(Assets.location),
                  controller: TextEditingController(
                      text: "1901 Thornridge Cir. Shiloh, Hawaii 81063"),
                ),
                yHeight(context.height / 6),
                CommonAppBtn(
                  title: AppString.update,
                  onTap: () => back(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget profileCardWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: ProfileCard(
      borderColor: AppColor.whiteFFFFFF,
      thickness: 2,
      textColor: AppColor.primary,
      size: 12.sp,
      name: AppString.changeProfilePicture,
      imageUrl: "",
      onTap: () {},
    ),
  );
}
