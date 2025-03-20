import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/custom_edit_profile_feild.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/profile_card.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/update_profile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.myProfile),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 11,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.width / 15),
                  child: Column(
                    children: [
                      profileCardWidget(),
                    ],
                  ),
                ),
                CustomEditProfileFeild(
                  icon: Assets.callCalling,
                  title: "+1 3233333",
                ),
                CustomEditProfileFeild(
                  icon: Assets.cake,
                  title: "01/08/1997",
                ),
                CustomEditProfileFeild(
                  icon: Assets.location,
                  title: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                ),
                yHeight(context.height / 5),
                CommonAppBtn(
                  title: AppString.editProfile,
                  onTap: () => toNamed(context, Routes.updateProfileView),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget profileCardWidget() {
  return Container(
    decoration: BoxDecoration(
        color: AppColor.whiteFFFFFF, borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: ProfileCard(
        borderColor: AppColor.whiteFFFFFF,
        thickness: 2,
        name: "Paras",
        email: 'paras@gmail.com',
        imageUrl: "",
        onTap: () {},
      ),
    ),
  );
}
