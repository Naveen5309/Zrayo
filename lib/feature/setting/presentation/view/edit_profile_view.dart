import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/profile_card.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

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
              children: [],
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
