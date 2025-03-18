part of 'helper.dart';

class AppImagesInitialize {
  AppImagesInitialize._();

  static assetsImagesInitialize(BuildContext context) {
    precacheImage(const AssetImage(Assets.zrayoSplash), context);
    precacheImage(const AssetImage(Assets.chooseRole), context);
  }
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
  static const String uploadFromGallery = "Upload From Gallery";
  static const String takePhoto = "Take Photo";
  static const String uploadDocument = "Upload Document";
  static const String uploadIdentityDocument = "Upload Identity Document";
  static const String frontSide = "Front Side";
  static const String uploadFrontSide = "Upload Front Side";
  static const String backSide = "Back Side";
  static const String uploadBackSide = "Upload Back Side";
  static const String addAddress = "Add Address";
  static const String linkYourCardWithUs = "Link your card with us";
  static const String addCardDetail = "Add Card Detail";
  static const String accountHolderName = "Account Holder Name";
  static const String enterAccountHolderName = "Enter account holder name";
  static const String accountNumber = "Account Number";
  static const String enterAccountNumber = "Enter account number";
  static const String routingNumber = "Routing Number";
  static const String enterRoutingNumber = "Enter routing number";
  static const String addBankDetail = "Add Bank Detail";
  static const String skip = "Skip";
  static const String customer = "Customer";
  static const String agent = "Agent";
  static const String logInAsACustomerToFindProperties =
      "Log in as a customer to find properties or \n as an agent to assist buyers and sellers.";
  static const String chooseInterface = "Choose Interface";
  static const String pleaseEnterEmailAddressAssociated =
      "Don’t wary, Please enter email address associated\nwith your account.";
  static const String submit = "Submit";
  static const String choosePlan = "Choose Your Plan";
  static const String oneMonthFreeTrial =
      "Get one month free trial and you can cancel a subscription before your free trial ends.";
  static const String free = "Free";
  static const String givesDesignatedContact =
      "Gives designated contacts secure, read-only access to shared information, ensuring they have what they need when it matters most.";
  static const String basic = "Basic";
  static const String accessToBasiscTabs =
      "Access to basic tabs and features with limited entries per category, 2GB of secure storage, and email support.";
  static const String free7DaysTrial = "7-Day Free Trial";
  static const String continueText = "Continue";
  // static const String submit = "Submit";
  // static const String submit = "Submit";
  // static const String submit = "Submit";
  // static const String submit = "Submit";
}
