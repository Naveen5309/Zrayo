import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/helper.dart';
import 'config/provider_logs.dart';
import 'core/helpers/app_injector.dart';
import 'core/utils/routing/routes.dart';
import 'core/utils/routing/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await AppInjector.init(
    appRunner: () =>
        runApp(ProviderScope(observers: [MyObserver()], child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    // AppImagesInitialize.assetsImagesInitialize(context);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = botToastBuilder(context, child);
              return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child);
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
            ),
            initialRoute: Routes.splash,
            onGenerateRoute: RouteGenerator.generateRoute,
            onGenerateInitialRoutes: (String initialRouteName) {
              return [
                RouteGenerator.generateRoute(RouteSettings(
                  name: initialRouteName,
                )),
              ];
            },
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
