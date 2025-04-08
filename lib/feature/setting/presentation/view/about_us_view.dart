import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/setting_provider.dart';
import 'package:zrayo_flutter/feature/setting/presentation/provider/state/setting_state.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';

class AboutUsView extends ConsumerWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutUsNotifier = ref.read(settingViewProvider.notifier);
    final abousUsState = ref.watch(settingViewProvider);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: AppString.aboutUs),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: abousUsState is SettingApiLoading
                  ? const Center(child: CircularProgressIndicator())
                  : AppText(
                      text: aboutUsNotifier.aboutContant,
                      color: AppColor.black4A4A4A,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
