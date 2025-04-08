import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/setting_provider.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

class AboutUsView extends ConsumerWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutUsNotifier = ref.read(settingViewProvider.notifier);
    ref.watch(settingViewProvider);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.aboutUs),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: AppText(text: aboutUsNotifier.aboutContant)),
        ],
      ),
    );
  }
}
