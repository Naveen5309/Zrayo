import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/add_address.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/add_bank_detail.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/add_payment_card.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/create_profile.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/subscription_plan.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/login_view.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/otp_verification_view.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/sign_up_view.dart';
import 'package:zrayo_flutter/feature/common_widgets/app_text.dart';
import '../../../feature/auth/presentation/views/change_password_view.dart';
import '../../../feature/auth/presentation/views/choose_interface_view.dart';
import '../../../feature/auth/presentation/views/create_profile_steps/upload_document.dart';
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
        return _fadeTransitionRoute(const SplashView());
      case Routes.chooseInterfaceView:
        return _fadeTransitionRoute(const ChooseInterfaceView());

      case Routes.loginView:
        return _fadeTransitionRoute(const LoginView());

      case Routes.signUpView:
        return _fadeTransitionRoute(const SignUpView());

      case Routes.uploadDocument:
        return _fadeTransitionRoute(const UploadDocument());

      case Routes.createProfile:
        return _fadeTransitionRoute(const CreateProfile());
      case Routes.addBankDetail:
        return _fadeTransitionRoute(const AddBankDetail());

      case Routes.addAddressView:
        return _fadeTransitionRoute(const AddAddressView());
      case Routes.addPaymentCard:
        return _fadeTransitionRoute(const AddPaymentCard());
      case Routes.otpVerificationView:
        return _fadeTransitionRoute(const OtpVerificationView());
      case Routes.changePasswordView:
        return _fadeTransitionRoute(const ChangePasswordView());
      case Routes.subscriptionPlanView:
        return _fadeTransitionRoute(const SubscriptionPlanView());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }

  static PageRouteBuilder _fadeTransitionRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Right to Left Slide transition
        const begin = Offset(1.0, 0.0); // Slide from right to left
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: 'Error'),
      ),
      body: const Center(
        child: AppText(text: 'No Such screen found in route generator'),
      ),
    );
  }
}
