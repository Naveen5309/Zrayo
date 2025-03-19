import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/custom_setting_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Setting"),
          yHeight(11),
          SettingTile(
              hasToggle: true,
              icon: Assets.barcode,
              title: "title",
              subtitle: "subtitle"),
          SettingTile(
              icon: Assets.barcode, title: "title", subtitle: "subtitle"),
        ],
      ),
    );
  }
}
