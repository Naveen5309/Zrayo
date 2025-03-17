import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/login_view.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/sign_up_view.dart';
import 'package:zrayo_flutter/feature/common_widgets/app_text.dart';
import '../../../feature/auth/presentation/views/splash_view.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    printLog('Current Screen: ${settings.name}');
    if (args != null) {
      printLog('Current Screen args: $args');
    }
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text:'Error'),
      ),
      body: const Center(
        child: AppText(text: 'No Such screen found in route generator'),
      ),
    );
  }
}
