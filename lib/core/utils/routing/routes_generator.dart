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
import 'package:zrayo_flutter/feature/dashboard/presentation/view/dashboard.dart';
import 'package:zrayo_flutter/feature/dashboard/presentation/view/notification_view.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/custom_filter_screen.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/custom_view_all_screen.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/search_properties/search_property_view.dart';
import 'package:zrayo_flutter/feature/home/presentation/view/search_properties/search_results_view.dart';
import 'package:zrayo_flutter/feature/messages/presentation/view/chat_view/chat_view_main.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/about_us_view.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/bank_details.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/card_details.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/contact_us_view.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/edit_profile_view.dart';
import 'package:zrayo_flutter/feature/setting/presentation/view/update_profile.dart';
import 'package:zrayo_flutter/feature/visits/prasentation/view/visit_main_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/app_text.dart';
import '../../../feature/auth/presentation/views/change_password_view.dart';
import '../../../feature/auth/presentation/views/choose_interface_view.dart';
import '../../../feature/auth/presentation/views/create_profile_steps/upload_document.dart';
import '../../../feature/auth/presentation/views/splash_view.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : null;
    printLog('Current Screen: ${settings.name}');
    if (args != null && args.isNotEmpty) {
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
        return _fadeTransitionRoute(
            UploadDocument(fromSettings: args?['fromSettings'] ?? false));

      case Routes.createProfile:
        return _fadeTransitionRoute(
            CreateProfile(fromSettings: args?['fromSettings'] ?? false));
      case Routes.addBankDetail:
        return _fadeTransitionRoute(
            AddBankDetail(fromSettings: args?['fromSettings'] ?? false));

      case Routes.addAddressView:
        return _fadeTransitionRoute(
            AddAddressView(fromSettings: args?['fromSettings'] ?? false));
      case Routes.addPaymentCard:
        return _fadeTransitionRoute(const AddPaymentCard());
      case Routes.otpVerificationView:
        return _fadeTransitionRoute(const OtpVerificationView());
      case Routes.changePasswordView:
        return _fadeTransitionRoute(const ChangePasswordView());
      case Routes.subscriptionPlanView:
        return _fadeTransitionRoute(const SubscriptionPlanView());

      case Routes.dashboard:
        return _fadeTransitionRoute(const Dashboard());
      case Routes.notificationView:
        return _fadeTransitionRoute(const NotificationView());

      // case Routes.chatView:
      //   return _fadeTransitionRoute(const ChatView());
      case Routes.editProfileView:
        return _fadeTransitionRoute(const EditProfileView());
      case Routes.updateProfileView:
        return _fadeTransitionRoute(const UpdateProfileView());
      case Routes.bankDetails:
        return _fadeTransitionRoute(const BankDetailsView());
      case Routes.cardDetail:
        return _fadeTransitionRoute(const CardDetailView());
      case Routes.contactUs:
        return _fadeTransitionRoute(ContactUsView());
      case Routes.aboutUs:
        return _fadeTransitionRoute(const AboutUsView());

      case Routes.chatView:
        return _fadeTransitionRoute(const ChatView());

      case Routes.searchPropertyView:
        return _fadeTransitionRoute(const SearchPropertyView());

   case Routes.searchResultsView:
        return _fadeTransitionRoute(const SearchResultsView());
case Routes.customFilterScreen:
        return _fadeTransitionRoute(const CustomFilterScreen());
      case Routes.addAddressView:
        return _fadeTransitionRoute(
            VisitMainView(fromSettings: args?['fromSettings'] ?? false));
      case Routes.customViewAllScreen:
        return _fadeTransitionRoute( CustomViewAllScreen(
          title:args?['title']
        ));

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
