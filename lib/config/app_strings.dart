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
  static const String welcomeBack = "welcomeBack";
  static const String loginToYourAccount = "loginToYourAccount";
  static const String emailAddress = "emailAddress";
  static const String exampleEamil = "exampleEamil";
  static const String name = "name";
  static const String yes = "yes";
  static const String no = "no";
  static const String rent = "rent";
  static const String buy = "buy";
  static const String wanttoSellProperty = "wanttoSellProperty";
  static const String chooseAgents = "chooseAgents";
  static const String slectAgent = "slectAgent";
  static const String setCommissionPercentage = "setCommissionPercentage";
  static const String enterPercentage = "enterPercentage";
  static const String contactNumber = "contactNumber";
  static const String forgetPassword = "forgetPassword";
  static const String otpVerification = "otpVerification";
  static const String createNewPassword = "createNewPassword";
  static const String yourNewPasswordMustBeUnique =
      "yourNewPasswordMustBeUnique";
  static const String or = "or";
  static const String login = "login";
  static const String google = "google";
  static const String apple = "apple";
  static const String newUser = "newUser";
  static const String signUp = "signUp";
  static const String password = "password";
  static const String newPassword = "newPassword";
  static const String confirmPassword = "confirmPassword";
  static const String alreadyHaveAccount = "alreadyHaveAccount";
  static const String startYourJourney = "startYourJourney";
  static const String createAccountToAccessAllFeature =
      "createAccountToAccessAllFeature";
  static const String createProfile = "createProfile";
  static const String firstName = "firstName";
  static const String enterFirstName = "enterFirstName";
  static const String lastName = "lastName";
  static const String enterLastName = "enterLastName";
  static const String mobileNumber = "mobileNumber";
  static const String enterPhoneNumber = "enterPhoneNumber";
  static const String phoneNumberShouldBe = "phoneNumberShouldBe";
  static const String dateOfBirth = "dateOfBirth";
  static const String ninNumberOrBvnNumber = "ninNumberOrBvnNumber";
  static const String enterNinNumberOrBvnNumber = "enterNinNumberOrBvnNumber";
  static const String saveAndContinue = "saveAndContinue";
  static const String address = "address";
  static const String city = "city";
  static const String country = "country";
  static const String stateProvince = "stateProvince";
  static const String completeAddress = "completeAddress";
  static const String identityDocument = "identityDocument";
  static const String state = "state";
  static const String enterAddress = "enterAddress";
  static const String selectCity = "selectCity";
  static const String selectSate = "selectSate";
  static const String selectCountry = "selectCountry";
  static const String uploadFromGallery = "uploadFromGallery";
  static const String takePhoto = "takePhoto";
  static const String uploadDocument = "uploadDocument";
  static const String uploadIdentityDocument = "uploadIdentityDocument";
  static const String frontSide = "frontSide";
  static const String uploadFrontSide = "uploadFrontSide";
  static const String backSide = "backSide";
  static const String uploadBackSide = "uploadBackSide";
  static const String addAddress = "addAddress";
  static const String personalDetails = "personalDetails";
  static const String linkYourCardWithUs = "linkYourCardWithUs";
  static const String addCardDetail = "addCardDetail";
  static const String accountHolderName = "accountHolderName";
  static const String enterAccountHolderName = "enterAccountHolderName";
  static const String accountNumber = "accountNumber";
  static const String enterAccountNumber = "enterAccountNumber";
  static const String routingNumber = "routingNumber";
  static const String enterRoutingNumber = "enterRoutingNumber";
  static const String addBankDetail = "addBankDetail";
  static const String skip = "skip";
  static const String customer = "customer";
  static const String agent = "agent";
  static const String logInAsACustomerToFindProperties =
      "logInAsACustomerToFindProperties";
  static const String chooseInterface = "chooseInterface";
  static const String pleaseEnterEmailAddressAssociated =
      "pleaseEnterEmailAddressAssociated";
  static const String pleaseEnterYourOtpCodeSentToYour =
      "pleaseEnterYourOtpCodeSentToYour";
  static const String submit = "submit";
  static const String choosePlan = "choosePlan";
  static const String oneMonthFreeTrial = "oneMonthFreeTrial";
  static const String free = "free";
  static const String givesDesignatedContact = "givesDesignatedContact";
  static const String basic = "basic";
  static const String accessToBasiscTabs = "accessToBasiscTabs";
  static const String free7DaysTrial = "free7DaysTrial";
  static const String continueText = "continueText";
  static const String didNotReceiveTheOtp = "didNotReceiveTheOtp";
  static const String youCanResendOtpIn = "youCanResendOtpIn";
  static const String verify = "verify";
  static const String change = "change";
  static const String getOneMonth = "getOneMonth";
  static const String freeTrial = "freeTrial";
  static const String freeTrialEnds = "freeTrialEnds";
  static const String allow = "allow";
  static const String deny = "deny";
  static const String zrayoText = 'zrayoText';
  static const String accessDeviceLocation = "accessDeviceLocation";
  static const String message = "message";
  static const String searchLocation = "searchLocation";
  static const String enableLocation = "enableLocation";
  static const String search = "search";
  static const String visits = "visits";
  static const String next = "next";
  static const String notifications = "notifications";
  static const String notification = "notification";
  static const String history = "history";
  static const String myProfile = "myProfile";
  static const String aboutUs = "aboutUs";
  static const String contactUs = "contactUs";
  static const String rateOurApp = "rateOurApp";
  static const String logout = "logout";
  static const String areYouSure = "areYouSure";
  static const String doYouWantToMarkPropertyAsSold =
      "doYouWantToMarkPropertyAsSold";
  static const String tittle = "tittle";
  static const String enterPropertyTittle = "enterPropertyTittle";
  static const String enterPropertyPrice = "enterPropertyPrice";
  static const String enterCompleteAddress = "enterCompleteAddress";
  static const String price = "price";
  static const String bathroomSize = "bathroomSize";
  static const String bedroomSize = "bedroomSize";
  static const String enterSq = "enterSq";
  static const String zIPCode = "zIPCode";
  static const String addressStreet = "addressStreet";
  static const String editProfile = "editProfile";
  static const String subscription = "subscription";
  static const String description = "description";
  static const String enterDescription = "enterDescription";
  static const String changeProfilePicture = "changeProfilePicture";
  static const String becomePremiumMember = "becomePremiumMember";
  static const String bankDetails = "bankDetails";
  static const String cardDetails = "cardDetails";
  static const String inviteFriend = "inviteFriend";
  static const String cardNumber = "cardNumber";
  static const String enteryourCardNumber = "enteryourCardNumber";
  static const String expirationDate = "expirationDate";
  static const String mMYY = "mMYY";
  static const String enterCvv = "enterCvv";
  static const String email = "email";
  static const String propertyFeatures = "propertyFeatures";
  static const String forSale = "forSale";
  static const String forRent = "forRent";
  static const String shareFeedback = "shareFeedback";
  static const String rateYourVisite = "rateYourVisite";
  static const String doYouWantToSellProperty = "doYouWantToSellProperty";
  static const String subject = "subject";
  static const String enterEmail = "enterEmail";
  static const String update = "update";
  static const String setting = "setting";
  static const String cancel = "cancel";
  static const String selectPropertyType = "selectPropertyType";
  static const String propertyType = "propertyType";
  static const String areYouSureLogOut = "areYouSureLogOut";
  static const String freeTriall = "freeTriall";
  static const String searchResults = "searchResults";
  static const String reset = "reset";
  static const String apply = "apply";
  static const String other = "other";
  static const String giveRatings = "giveRatings";
  static const String propertyDeleted = "propertyDeleted";
  static const String propertySuccessfullyPosted = "propertySuccessfullyPosted";
  static const String propertyUploaded = "propertyUploaded";
  static const String bookedSuccessfully = "bookedSuccessfully";
  static const String successfullyBooked = "successfullyBooked";
  static const String uploadImage = "uploadImage";
  static const String buyNow = "buyNow";
  static const String ratingSubmittedSuccessfully =
      "ratingSubmittedSuccessfully";
  static const String increaseVisibilityBuyer = "increaseVisibilityBuyer";
  static const String featureyourProperty = "featureyourProperty";
  static const String assignAgent = "assignAgent";
  static const String enterPropertyFeature = "enterPropertyFeature";
  static const String addProperty = "addProperty";
  static const String landloard = "landloard";
  static const String chooseYourAgent = "chooseYourAgent";
  static const String minimumAgentAndFeedback = "minimumAgentAndFeedback";
  static const String giveyourReviews = "giveyourReviews";
  static const String giveRatingtoLandloard = "giveRatingtoLandloard";
  static const String pleaseEnterEmailAddress = "pleaseEnterEmailAddress";
  static const String pleaseEnterValidEmailAddress =
      "pleaseEnterValidEmailAddress";
  static const String pleaseEnterPassword = "pleaseEnterPassword";
  static const String pleaseEnterNewPassword = "pleaseEnterNewPassword";
  static const String newPasswordShouldBeDifferent =
      "newPasswordShouldBeDifferent";
  static const String pleaseEnterCurrentPassword = "pleaseEnterCurrentPassword";
  static const String selectReason = "selectReason";
  static const String passwordShouldBe = "passwordShouldBe";
  static const String newPasswordShouldBe = "newPasswordShouldBe";
  static const String passwordMismatch = "passwordMismatch";
  static const String pleaseEnterConfirmPassword = "pleaseEnterConfirmPassword";
  static const String pleaseEnterName = "pleaseEnterName";
  static const String pleaseEnterSubject = "pleaseEnterSubject";
  static const String pleaseEnterMessage = "pleaseEnterMessage";
  static const String pleaseEnterOtp = "pleaseEnterOtp";
  static const String invalidOtp = "invalidOtp";
  static const String error = "error";
  static const String exp = "exp";
  static const String resendOTP = "resendOTP";
  static const String visaCard = "visaCard";
  static const String holderName = "holderName";
  static const String noSuchScreenFound = "noSuchScreenFound";
  static const String oneWeekAgo = "oneWeekAgo";
  static const String dashboard = "dashboard";
  static const String recentlyAssignedProperties = "recentlyAssignedProperties";
  static const String assignedProperties = "assignedProperties";
  static const String seeAll = "seeAll";
  static const String location = "location";
  static const String featuredProperties = "featuredProperties";
  static const String nearbyProperties = "nearbyProperties";
  static const String activeNow = "activeNow";
  static const String booking = "booking";
  static const String viewingFees = "viewingFees";
  static const String date = "date";
  static const String time = "time";
  static const String bath = "bath";
  static const String bed = "bed";
  static const String features = "features";
  static const String event = "event";
  static const String chooseDate = "chooseDate";
  static const String totalPrice = "totalPrice";
  static const String bookNow = "bookNow";
  static const String edit = "edit";
  static const String goBack = "goBack";
  static const String yourPropertyisSuccessfullySold =
      "yourPropertyisSuccessfullySold";
  static const String soldSuccessfully = "soldSuccessfully";
  static const String propertySold = "propertySold";
  static const String requestaTour = "requestaTour";
  static const String cancelBooking = "Cancel Booking";
  static const String month = "/month";
  static const String bookVisit = "bookVisit";
  static const String filterProperties = "filterProperties";
  static const String availableSlots = "availableSlots";
  static const String historicalData = "historicalData";
  static const String propertyDetails = "propertyDetails";
  static const String listofAgentsLandlord = "listofAgentsLandlord";

// static const String mMYY = "MM/YY";
}
