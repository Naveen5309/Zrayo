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
      return "Please enter email";
    }
    if (!(RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value))) {
      return "Please enter valid email";
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
      return "$fieldName dfb";
    } else if (requiredLength != null && requiredLength > value.length) {
      return "$fieldName length $requiredLength ";
    } else {
      return null;
    }
  }

  bool signUpValidator({
    required String phoneNumber,
  }) {
    if (phoneNumber.isEmpty) {
      error = "";
      return false;
    } else if (phoneNumber.length < 6 || phoneNumber.length > 12) {
      error = "";
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
}
