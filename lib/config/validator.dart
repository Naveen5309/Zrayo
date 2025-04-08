import 'package:zrayo_flutter/config/helper.dart';

class Validator {
  static final Validator _singleton = Validator._internal();

  factory Validator() {
    return _singleton;
  }

  Validator._internal();

  static Validator get instance => _singleton;

  var error = "";

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.enterEmail;
    }
    if (!(RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value))) {
      return AppString.pleaseEnterValidEmailAddress;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Password minimum length 6 character required";
    } else if (value.length > 15) {
      return "Password maximum length 15 character";
    } else {
      return null;
    }
  }

  String? customValidator(String? value, String fieldName,
      {int? requiredLength}) {
    if (value == null || value.isEmpty) {
      return "Please enter $fieldName";
    } else if (requiredLength != null && requiredLength > value.length) {
      return "$fieldName required length $requiredLength ";
    } else {
      return null;
    }
  }

  bool createProfileValidator({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String dob,
    required String ninNumber,
  }) {
    if (customValidator(firstName, "first name")?.isNotEmpty ?? false) {
      error = customValidator(firstName, "first name") ?? "";
      return false;
    } else if (customValidator(lastName, "last name")?.isNotEmpty ?? false) {
      error = customValidator(lastName, "last name") ?? "";
      return false;
    } else if (phoneNumber.isEmpty) {
      error = AppString.enterPhoneNumber;
      return false;
    } else if (phoneNumber.length < 9 || phoneNumber.length > 11) {
      error = AppString.phoneNumberShouldBe;
      return false;
    } else if (customValidator(dob, "Date of birth")?.isNotEmpty ?? false) {
      error = customValidator(dob, "Date of birth") ?? "";
      return false;
    } else if (customValidator(ninNumber, "Nin Number")?.isNotEmpty ?? false) {
      error = customValidator(ninNumber, "Nin Number") ?? "";
      return false;
    } else {
      return true;
    }
  }

  bool addAddressValidator({
    required String address,
    required String city,
    required String state,
    required String country,
  }) {
    if (customValidator(address, "address")?.isNotEmpty ?? false) {
      error = customValidator(address, "address") ?? "";
      return false;
    } else if (customValidator(country, "country")?.isNotEmpty ?? false) {
      error = customValidator(country, "country") ?? "";
      return false;
    } else if (customValidator(state, "state")?.isNotEmpty ?? false) {
      error = customValidator(state, "state") ?? "";
      return false;
    } else if (customValidator(city, "city")?.isNotEmpty ?? false) {
      error = customValidator(city, "city") ?? "";
      return false;
    } else {
      return true;
    }
  }

  bool addBankDetailsValidator({
    required String accountHolder,
    required String accountNumber,
    required String routingNumber,
  }) {
    if (customValidator(accountHolder, "accountHolder")?.isNotEmpty ?? false) {
      error = customValidator(accountHolder, "accountHolder") ?? "";
      return false;
    } else if (customValidator(accountNumber, "accountNumber")?.isNotEmpty ??
        false) {
      error = customValidator(accountNumber, "accountNumber") ?? "";
      return false;
    } else if (customValidator(routingNumber, "routingNumber")?.isNotEmpty ??
        false) {
      error = customValidator(routingNumber, "routingNumber") ?? "";
      return false;
    } else {
      return true;
    }
  }

  bool checkPassword(String password) {
    return ((password.trim().length < 8) ||
        (!RegExp(r'(?=.*?\d)').hasMatch(password.trim())) ||
        (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(password.trim())));
  }


  bool loginValidator({required String email, required String pass}) {
    if (emailValidator(email) != null) {
      error = emailValidator(email) ?? "";
      return false;
    } else if (passwordValidator(pass) != null) {
      error = passwordValidator(pass) ?? "";
      return false;
    } else {
      return true;
    }
  }

  bool forgetPasswordValidator({required String email}) {
    if (emailValidator(email) != null) {
      error = emailValidator(email) ?? "";
      return false;
    } else {
      return true;
    }
  }

  //sign up
  bool signUpValidator({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (emailValidator(email) != null) {
      error = emailValidator(email) ?? "";
      return false;
    } else if (password.isEmpty) {
      error = AppString.pleaseEnterPassword;
      return false;
    } else if (checkPassword(password)) {
      error = AppString.passwordShouldBe;
      return false;
    } else if (confirmPassword.isEmpty) {
      error = AppString.pleaseEnterConfirmPassword;
      return false;
    } else if (password != confirmPassword) {
      error = AppString.passwordMismatch;
      return false;
    }
    return true;
  }

  bool changePasswordValidator({
    required String password,
    required String confirmPassword,
  }) {
    if (password.isEmpty) {
      error = AppString.pleaseEnterNewPassword;
      return false;
    } else if (checkPassword(password)) {
      error = AppString.passwordShouldBe;
      return false;
    } else if (confirmPassword.isEmpty) {
      error = AppString.pleaseEnterConfirmPassword;
      return false;
    } else if (password != confirmPassword) {
      error = AppString.passwordMismatch;
      return false;
    }
    return true;
  }

  // VerifyEmail
  bool verifyEmailValidator({
    required String otp,
  }) {
    if (otp.isEmpty) {
      error = AppString.pleaseEnterOtp;
      return false;
    } else if (otp.length != 4) {
      error = AppString.invalidOtp;
      return false;
    }

    return true;
  }

  //  Contact us
  bool contactUsValidator({
    required String email,
    required String subject,
    required String message,
  }) {
    if (emailValidator(email) != null) {
      error = emailValidator(email) ?? "";
      return false;
    } else if (subject.isEmpty) {
      error = AppString.pleaseEnterSubject;
      return false;
    } else if (message.isEmpty) {
      error = AppString.pleaseEnterMessage;
      return false;
    }

    return true;
  }
}
