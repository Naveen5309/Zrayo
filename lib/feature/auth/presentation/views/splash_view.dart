import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrayo_flutter/core/helpers/all_getter.dart';
import 'package:zrayo_flutter/core/notification_service.dart';

import '../../../../config/assets.dart';
import '../../../../config/helper.dart';
import '../../../../core/utils/routing/routes.dart';

final animationProvider = StateProvider.autoDispose<bool>((ref) => false);

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    // notification();
    splashMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(animationProvider);
    final animation = ref.read(animationProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.black000000,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.linearToEaseOut,
          height: animation.state ? screenHeight(context) / 5 : 0,
          width: animation.state ? screenWidth(context) / 2.5 : 0,
          child: SvgPicture.asset(
            Assets.zrayoSplash,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void notification() async {
    final NotificationService service = NotificationService();
    await service.initializeFcm();
    await service.initPushNotificationListeners();
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
      final userModel = Getters.getLocalStorage.getLoginUser();
      final token = Getters.getLocalStorage.getToken();
      if (token == null ||
          (token.isEmpty) ||
          userModel?.firstName == null ||
          (userModel?.firstName?.isEmpty ?? false) ||
          (userModel?.detail?.address==null) ||
          (userModel?.detail?.address?.isEmpty ?? false) ||
          ((userModel?.detail?.idDocumentFront==null||(userModel?.detail?.idDocumentFront?.isEmpty ?? false)) &&
              (userModel?.detail?.idDocumentBack==null||(userModel?.detail?.idDocumentBack?.isEmpty ?? false)))) {
        offAllNamed(context, Routes.chooseInterfaceView);
      } else {
        offAllNamed(context, Routes.dashboard);
      }
    });
  }
}
