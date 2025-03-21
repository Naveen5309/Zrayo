import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.aboutUs),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height / 3),
            child: Text(
              "Empty",
            ),
          ),
        ],
      ),
    );
  }
}
