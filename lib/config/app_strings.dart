part of 'helper.dart';

class AppImagesInitialize {
  AppImagesInitialize._();

  // static assetsImagesInitialize(BuildContext context) {
  //   precacheImage(const AssetImage(Assets.zrayoSplash), context);
  //   precacheImage(const AssetImage(Assets.chooseRole), context);
  // }
}

abstract final class AppConstants {
  static const String appName = "Zrayo";
  static const String localDirectory = "Zrayo";
}

abstract final class AppFonts {
  static const String satoshiBlack = "Satoshi-Black"; // 900
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
  static const String name = "Name";
  static const String yes = "Yes";
  static const String no = "No";
  static const String rent = "Rent";
  static const String buy = "Buy";
  static const String wanttoSellProperty =
      "Do you want to sell property or sell property?";
  static const String chooseAgents = "Choose Agents";
  static const String slectAgent =
      "Please select a minimum of 1 agent and a maximum of 3 agents to continue with the process.";
  static const String setCommissionPercentage = "Set commission percentage";
  static const String enterPercentage = "Enter percentage";
  static const String contactNumber = "Contact Number";
  static const String forgetPassword = "Forgot password?";
  static const String otpVerification = "OTP Verification";
  static const String createNewPassword = "Create new password";
  static const String yourNewPasswordMustBeUnique =
      "Your new password must be unique from\nthose previously used.";

  static const String or = "OR";
  static const String login = "Login";
  static const String google = "Google";
  static const String apple = "Apple";
  static const String newUser = "New User?";
  static const String signUp = "Sign Up";
  static const String password = "Password";
  static const String newPassword = "New Password";

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
  static const String phoneNumberShouldBe = "Phone number should be 10 number ";
  static const String dateOfBirth = "Date of birth";
  static const String ninNumberOrBvnNumber = "Nin Number or Bvn Number";
  static const String enterNinNumberOrBvnNumber =
      "Enter Nin Number or Bvn Number";
  static const String saveAndContinue = "Save and Continue";
  static const String address = "Address";
  static const String city = "City";
  static const String country = "Country";
  static const String stateProvince = "State/Province";
  static const String completeAddress = "Complete Address";
  static const String identityDocument = "Identity Document";
  static const String state = "State";
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
  static const String personalDetails = "Personal details";
  static const String linkYourCardWithUs = "Link your card with us";
  static const String addCardDetail = "Add Card Detail";
  static const String accountHolderName = "Account Holder Name";
  static const String enterAccountHolderName = "Enter account holder name";
  static const String accountNumber = "Account Number";
  static const String enterAccountNumber = "Enter account number";
  static const String routingNumber = "Routing Number";
  static const String enterRoutingNumber = "Enter routing number";
  static const String addBankDetail = "Add Bank Details";
  static const String skip = "Skip";
  static const String customer = "Customer";
  static const String agent = "Agent";
  static const String logInAsACustomerToFindProperties =
      "Log in as a customer to find properties or \n as an agent to assist buyers and sellers.";
  static const String chooseInterface = "Choose Interface";
  static const String pleaseEnterEmailAddressAssociated =
      "Don’t worry, Please enter email address associated with your account.";
  static const String pleaseEnterYourOtpCodeSentToYour =
      "Please enter your OTP code sent to your\nemail address.";
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
  static const String didNotReceiveTheOtp = "Didn’t receive the OTP?";
  static const String youCanResendOtpIn = "̌You can resend OTP in:";
  static const String verify = "Verify";
  static const String change = "Change";
  static const String priceAbove0 = "\$4.99";
  static const String price0 = "\$0.00";
  static const String getOneMonth = "Get one month ";
  static const String freeTrial = "free trial";
  static const String freeTrialEnds =
      " and you can cancel a subscription before your free trial ends.";
  static const String allow = "Allow ";
  static const String deny = "Deny";
  static const String zrayoText = '"Zrayo"';
  static const String accessDeviceLocation =
      " to access the device precise location?";
  static const String message = "Message";
  static const String searchLocation = "Search location...";

  static const String enableLocation = "Enable Location";
  static const String search = "Search";
  static const String visits = "Visits";
  static const String next = "Next";
  static const String notifications = "Notifications";
  static const String history = "History";
  static const String myProfile = "My Profile";
  static const String aboutUs = "About Us";
  static const String contactUs = "Contact Us";
  static const String rateOurApp = "Rate our app";
  static const String logout = "Logout";
  static const String areYouSure = "Are you sure?";
  static const String doYouWantToMarkPropertyAsSold =
      "Do you want to mark property as sold.";
  static const String tittle = "Tittle";
  static const String enterPropertyTittle = "Enter property tittle";
  static const String enterPropertyPrice = "Enter property price";
  static const String enterCompleteAddress = "Enter complete address";
  static const String price = "Price";
  static const String bathroomSize = "Bathroom Size";
  static const String bedroomSize = "Bedroom Size";
  static const String enterSq = "Enter Sq. Ft";
  static const String zIPCode = "ZIP Code";
  static const String addressStreet = "Address/Street";
  static const String editProfile = "Edit profile";
  static const String subscription = "Subscription";
  static const String description = "Description";
  static const String enterDescription = "Enter description";
  static const String changeProfilePicture = "Change profile picture ";
  static const String becomePremiumMember = "Become a premium member";
  static const String bankDetails = "Bank Details";
  static const String cardDetails = "Card Details";
  static const String inviteFriend = "Invite Friend";
  static const String cardNumber = "Card Number";
  static const String enteryourCardNumber = "Enter your card number";
  static const String expirationDate = "Expiration Date";
  static const String mMYY = "MM/YY";
  static const String enterCvv = "Enter CVV";
  static const String email = "Email";
  static const String propertyFeatures = "Property Features";
  static const String forSale = "For Sale";
  static const String forRent = "For Rent";
  static const String shareFeedback =
      "Share Your Feedback & Rate Your Last Visit";
  static const String rateYourVisite = "Rate Your Visite";
  static const String doYouWantToSellProperty =
      "Do you want to sell property or rent property?";
  static const String subject = "Subject";
  static const String enterEmail = "Enter your email";
  static const String update = "Update";
  static const String setting = "Setting";
  static const String cancel = "Cancel";
  static const String selectPropertyType = "Select property type";
  static const String propertyType = "Property Type";
  static const String areYouSureLogOut = "Are you want to sure logout?";
  static const String freeTriall = "Free trial";
  static const String searchResults = "Search Results";
  static const String reset = "Reset";
  static const String apply = "Apply";
  static const String other = "Other";
  static const String giveRatings = "Give ratings";
  static const String propertyDeleted =
      "Your property is successfully deleted from list.";
  static const String propertySuccessfullyPosted =
      "Property Successfully Posted!";
  static const String propertyUploaded =
      "Congratulations! Your property has been successfully uploaded and is now live for potential buyers or renters to explore";
  static const String bookedSuccessfully = "Booked Successfully!";
  static const String successfullyBooked =
      "Your property visit is successfully booked. Please reach at the location on time.";
  static const String uploadImage = "Upload image";
  static const String buyNow = "Buy Now";
  static const String ratingSubmittedSuccessfully =
      "Rating Submitted \n Successfully!";
  static const String increaseVisibilityBuyer =
      "Increase visibility and attract more buyers.\nPay now to highlight your listing!";
  static const String featureyourProperty = "Feature your property";
  static const String assignAgent = "Do you want to assign agents?";
  static const String enterPropertyFeature = "Enter property Feature";
  static const String addProperty = "Add Property";
  static const String landloard = "Landloard";
  static const String chooseYourAgent = "Choose Your Agent";
  static const String minimumAgentAndFeedback =
      "Please select a single agent from the list below to provide your rating and share your feedback.";
  static const String giveyourReviews = "Give your reviews";
  static const String giveRatingtoLandloard = "Give Rating to the landlord ";

  static const pleaseEnterEmailAddress = 'Please enter email';
  static const pleaseEnterValidEmailAddress = 'Please enter valid email';

  static const pleaseEnterPassword = 'Enter password';
  static const pleaseEnterNewPassword = 'Enter new password';

  static const newPasswordShouldBeDifferent =
      'New password must be different from current password';

  static const pleaseEnterCurrentPassword = 'Enter your current password';
  static const selectReason = 'Select reason';

  static const passwordShouldBe =
      'Password must be at least 8 characters long and include letters, numbers, and special characters.';
  static const newPasswordShouldBe =
      'Password must be at least 8 characters long and include letters, numbers, and special characters.';
  static const passwordMismatch = 'Confirm passwords do not match';
  static const pleaseEnterConfirmPassword = 'Enter confirm password';
  static const String pleaseEnterName = "Enter full name";
  static const String pleaseEnterSubject = "Enter subject";
  static const String pleaseEnterMessage = "Enter message";
  static const String pleaseEnterOtp = "Enter otp";
  static const String invalidOtp = "Invalid otp please check your opt";
}
