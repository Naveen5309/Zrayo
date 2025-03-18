part of 'helper.dart';

class AppImagesInitialize {
  AppImagesInitialize._();

/*  static assetsImagesInitialize(BuildContext context) {
    precacheImage(const AssetImage(Assets.forgotPassImage), context);
    precacheImage(AssetImage(Assets.setPassImage), context);
    precacheImage(AssetImage(Assets.loginImage), context);
  }*/
}

abstract final class AppString {
  static const String welcomeBack = "Welcome Back";
  static const String loginToYourAccount = "Please login to your account";
  static const String emailAddress = "Email Address";
  static const String exampleEamil = "example@gmail.com";
  static const String forgetPassword = "Forgot password?";
  static const String or = "OR";
  static const String login = "Login";
  static const String google = "Google";
  static const String apple = "Apple";
  static const String newUser = "New User?";
  static const String signUp = "Sign Up";
  static const String password = "Password";

  static const String confirmPassword = "Confirm Password";
  static const String alreadyHaveAccount = "Already have an account?";
  static const String startYourJourney = "Start Your Journey";
  static const String createAccountToAccessAllFeature =
      "Create an account to access all the\nfeatures of Zrayo";
  static const String createProfile = "Create Profile";
  static const String firstName = "First Name";
  static const String enterFirstName = "Enter first name";
  static const String lastName = "Last Name";
  static const String enterLastName = "Enter last name";
  static const String mobileNumber = "Mobile Number";
  static const String enterPhoneNumber = "Enter phone number";
  static const String dateOfBirth = "Date of birth";
  static const String ninNumberOrBvnNumber = "Nin Number or Bvn Number";
  static const String enterNinNumberOrBvnNumber =
      "Enter Nin Number or Bvn Number";
  static const String saveAndContinue = "Save and Continue";
  static const String address = "Address";
  static const String city = "City";
  static const String state = "State";
  static const String country = "Country";
  static const String enterAddress = "Enter address";
  static const String selectCity = "Select city";
  static const String selectSate = "Select state";
  static const String selectCountry = "Select country";
  static const String addAddress = "Add Address";
// static const String password = "Password";
// static const String password = "Password";
}

abstract final class AppConstants {
  static const String appName = "Zrayo";
  static const String localDirectory = "Zrayo";
}

abstract final class AppFonts {
  static const String satoshiBold = "Satoshi-Bold"; // 700
  static const String satoshiLight = "Satoshi-Light"; //300
  static const String satoshiMedium = "Satoshi-Medium"; //500
  static const String satoshiRegular = "Satoshi-Regular"; //400
}
