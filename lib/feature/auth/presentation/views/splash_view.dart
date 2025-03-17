import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/assets.dart';
import '../../../../config/helper.dart';
import '../../../../core/utils/routing/routes.dart';
import '../provider/splash_provider.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    splashMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(animationProvider.notifier);
    final animation = ref.watch(animationProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.black000000,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.linearToEaseOut,
          height: true ? screenHeight(context) / 5 : 0,
          width: true ? screenWidth(context) / 3 : 0,
          child: SvgPicture.asset(
            Assets.zrayoSplash,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void splashMethod() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      if (FocusScope.of(context).hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ref.read(animationProvider.notifier).update(
          (state) => false,
        );
    Timer(const Duration(milliseconds: 800), () async {
      ref.read(animationProvider.notifier).update(
            (state) => true,
          );
    });
    Timer(const Duration(seconds: 3), () async {
      offAllNamed(context, Routes.loginView);
    });
  }
}
